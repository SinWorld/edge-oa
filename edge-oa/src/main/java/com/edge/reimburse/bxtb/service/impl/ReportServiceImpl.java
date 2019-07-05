package com.edge.reimburse.bxtb.service.impl;

import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.activiti.engine.ProcessEngine;
import org.activiti.engine.history.HistoricVariableInstance;
import org.activiti.engine.impl.identity.Authentication;
import org.activiti.engine.runtime.ProcessInstance;
import org.activiti.engine.task.Task;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.alibaba.fastjson.JSONArray;
import com.edge.index.service.inter.IndexService;
import com.edge.projman.approveproj.dao.ApproveprojDao;
import com.edge.projman.approveproj.entity.Foll_up_Proj;
import com.edge.projman.approveproj.service.inter.ApproveprojService;
import com.edge.reimburse.bxtb.dao.ReportDao;
import com.edge.reimburse.bxtb.entity.MyReport_QueryVo;
import com.edge.reimburse.bxtb.entity.Reimburse_DM_FYLX;
import com.edge.reimburse.bxtb.entity.Reimbursement;
import com.edge.reimburse.bxtb.service.inter.ReportService;
import com.edge.system.user.entity.User;
import com.edge.system.user.service.inter.UserService;
import com.edge.utils.BP_DM_METHOD;
import com.edge.utils.ReviewOpinion;

@Service
public class ReportServiceImpl implements ReportService {
	@Resource
	private ReportDao reportDao;
	@Resource
	private ProcessEngine processEngine;
	@Resource
	private ApproveprojService approveprojService;
	@Resource
	private UserService userService;
	@Resource
	private ApproveprojDao approveprojDao;
	@Resource
	private IndexService indexService;

	// 加载所有的飞鹰类型
	public JSONArray queryAllFYLX() {
		return reportDao.queryAllFYLX();
	}

	// 新增报销填报
	public void saveReimbursement(Reimbursement reimbursement) {
		reportDao.saveReimbursement(reimbursement);
	}

	// 编辑报销填报
	public void editReimbursement(Reimbursement reimbursement) {
		reportDao.editReimbursement(reimbursement);
	}

	// 分页显示我的报销
	public List<Reimbursement> queryMyReimbursement(MyReport_QueryVo vo) {
		return reportDao.queryMyReimbursement(vo);
	}

	// 显示我的报销的数量
	public Integer queryMyReimbursementCount(MyReport_QueryVo vo) {
		return reportDao.queryMyReimbursementCount(vo);
	}

	// 根据id查询费用类型对象
	public Reimburse_DM_FYLX queryFYLXById(Integer fylx_dm) {
		return reportDao.queryFYLXById(fylx_dm);
	}

	// 根据id查询报销填报对象
	public Reimbursement queryReimbursementById(Integer reimbursement_dm) {
		return reportDao.queryReimbursementById(reimbursement_dm);
	}

	// 根据Id删除报销填报记录
	public void deleteReimbursementById(Integer reimbursement_dm) {
		reportDao.deleteReimbursementById(reimbursement_dm);
	}

	// 分页显示我的报销(流程已启动)
	public List<Reimbursement> queryMyReimbursementLC(MyReport_QueryVo vo) {
		return reportDao.queryMyReimbursementLC(vo);
	}

	// 显示我的报销的数量(流程已启动)
	public Integer queryMyReimbursementCountLC(MyReport_QueryVo vo) {
		return reportDao.queryMyReimbursementCountLC(vo);
	}

	// 分页显示所有的报销记录
	public List<Reimbursement> queryAllReimbursementLC(MyReport_QueryVo vo) {
		return reportDao.queryAllReimbursementLC(vo);
	}

	// 分页显示所有的报销记录
	public Integer queryAllReimbursementCountLC(MyReport_QueryVo vo) {
		return reportDao.queryAllReimbursementCountLC(vo);
	}

	// 启动流程实例
	public void saveStartProcess(String user_name, HttpServletRequest request, Reimbursement reimbursement) {
		// 1.：使用当前对象获取到流程定义的key（对象的名称就是流程定义的key）
		String key = reimbursement.getClass().getSimpleName();
		/**
		 * 2：从Session中获取当前任务的办理人，使用流程变量设置下一个任务的办理人 inputUser是流程变量的名称， 获取的办理人是流程变量的值
		 */
		Map<String, Object> variables = new HashMap<String, Object>();
		variables.put("inputUser", user_name);// 表示惟一用户
		/**
		 * 3： (1)使用流程变量设置字符串（格式：Reimbursement.id的形式），通过设置，让启动的流程（流程实例）关联业务
		 * (2)使用正在执行对象表中的一个字段BUSINESS_KEY（Activiti提供的一个字段），让启动的流程（流程实例）关联业务
		 */
		// 格式：Reimbursement.id的形式（使用流程变量）
		String objId = key + "." + String.valueOf(reimbursement.getReimbursement_dm());
		variables.put("objId", objId);
		// 5：使用流程定义的key，启动流程实例，同时设置流程变量，同时向正在执行的执行对象表中的字段BUSINESS_KEY添加业务数据，同时让流程关联业务
		ProcessInstance pi = processEngine.getRuntimeService().startProcessInstanceByKey(key, objId, variables);
		String processInsTid = pi.getId();
		// 使用流程实例Id得到当前进行的任务对象
		Task task = processEngine.getTaskService().createTaskQuery().processInstanceId(processInsTid).singleResult();
		// 推动流程进入下一节点
		saveTask(task.getId(), request);
	}

	// 指定任务连线的名称完成任务
	public void saveTask(String taskId, HttpServletRequest request) {
		/**
		 * 1：在完成之前，添加一个批注信息，向act_hi_comment表中添加数据，用于记录对当前申请人的一些审核信息
		 */
		Task task = processEngine.getTaskService().createTaskQuery().taskId(taskId).singleResult();
		// 获取流程实例ID
		String processInstanceId = task.getProcessInstanceId();
		/**
		 * 注意：添加批注的时候，由于Activiti底层代码是使用： String userId =
		 * Authentication.getAuthenticatedUserId(); CommentEntity comment = new
		 * CommentEntity(); comment.setUserId(userId);
		 * 所有需要从Session中获取当前登录人，作为该任务的办理人（审核人），对应act_hi_comment表中的User_ID的字段，不过不添加审核人，该字段为null
		 * 所以要求，添加配置执行使用Authentication.setAuthenticatedUserId();添加当前任务的审核人
		 */
		HttpSession session = request.getSession();
		Authentication.setAuthenticatedUserId(String.valueOf(session.getAttribute("userId")));
		// processEngine.getTaskService().addComment(taskId, processInstanceId,"");
		// 3：使用任务ID，完成当前人的个人任务，同时流程变量
		processEngine.getTaskService().complete(taskId);
		// 4：当任务完成之后，需要指定下一个任务的办理人（使用类）-----已经开发完成
	}

	// 点击报销记录查看业务数据
	public List<ReviewOpinion> reimburseShowByIdShowById(Integer reimbursement_dm, Model model, HttpSession session) {
		// 使用请报销ID，查询报销对象
		Reimbursement reimbursement = reportDao.queryReimbursementById(reimbursement_dm);
		// 格式化发生日期、提交日期、完成日期
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Foll_up_Proj xmxx = null;// 所属项目
		User user = null;// 费用所属
		Reimburse_DM_FYLX fylx = null;// 费用类型
		if (reimbursement != null) {
			reimbursement.setFsrq(sdf.format(reimbursement.getReimbursement_begintime()));
			reimbursement.setTjrq(sdf.format(reimbursement.getReimbursement_submittime()));
			if (reimbursement.getFinish_time() != null) {
				reimbursement.setWcrq(sdf.format(reimbursement.getFinish_time()));
			} else {
				reimbursement.setWcrq(null);
			}
			// 查询所属项目
			xmxx = approveprojService.queryXiangMuXXById(reimbursement.getProj_dm());
			// 查询费用所属
			user = userService.queryUserById(reimbursement.getReimbursement_user_dm());
			// 查询费用类型
			fylx = this.queryFYLXById(reimbursement.getReimbursement_dm_fylx());

		}
		// 获取对象的名称
		String objectName = reimbursement.getClass().getSimpleName();
		// 组织流程表中的字段中的值
		String objId = objectName + "." + String.valueOf(reimbursement.getReimbursement_dm());
		/** 2:使用历史的流程变量查询，返回历史的流程变量的对象，获取流程实例ID */
		HistoricVariableInstance hvi = processEngine.getHistoryService().createHistoricVariableInstanceQuery()// 对应历史的流程变量表
				.variableValueEquals("objId", objId).singleResult();
		// 流程实例ID
		String processInstanceId = hvi.getProcessInstanceId();
		model.addAttribute("reimbursement", reimbursement);
		model.addAttribute("user", user);
		model.addAttribute("xmxx", xmxx);
		model.addAttribute("fylx", fylx);
		// 通过流程实例Id得到流程部署Id
		String procinstById = queryProcinstById(processInstanceId);
		List<ReviewOpinion> queryReviewOpinions = indexService.queryReviewOpinions(processInstanceId);
		// 设置 ReviewOpinion中的流程部署Id
		for (ReviewOpinion reviewOpinion : queryReviewOpinions) {
			reviewOpinion.setProcinstById(procinstById);
		}
		// 如果 queryReviewOpinions为空则将流程部署Id添加入session
		if (queryReviewOpinions == null || queryReviewOpinions.size() == 0) {
			// 将流程部署Id存入session中
			session.setAttribute("prodefById", procinstById);
		}
		return queryReviewOpinions;
	}

	// 点击业务数据列表进入查看页显示对应的流程图返回流程部署Id
	public String queryProcinstById(String processInstanceId) {
		return approveprojDao.queryProcinstById(processInstanceId);
	}
}
