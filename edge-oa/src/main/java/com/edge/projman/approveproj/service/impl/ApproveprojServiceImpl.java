package com.edge.projman.approveproj.service.impl;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.activiti.engine.ProcessEngine;
import org.activiti.engine.history.HistoricVariableInstance;
import org.activiti.engine.impl.identity.Authentication;
import org.activiti.engine.impl.interceptor.Session;
import org.activiti.engine.repository.ProcessDefinition;
import org.activiti.engine.runtime.ProcessInstance;
import org.activiti.engine.task.Task;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.alibaba.fastjson.JSONArray;
import com.edge.index.service.inter.IndexService;
import com.edge.projman.approveproj.dao.ApproveprojDao;
import com.edge.projman.approveproj.entity.Foll_QueryVo;
import com.edge.projman.approveproj.entity.Foll_up_Proj;
import com.edge.projman.approveproj.service.inter.ApproveprojService;
import com.edge.system.user.entity.User;
import com.edge.system.user.service.inter.UserService;
import com.edge.utils.APPR_DM_STATUS;
import com.edge.utils.BP_DM_METHOD;
import com.edge.utils.ReviewOpinion;

@Service
public class ApproveprojServiceImpl implements ApproveprojService {
	@Resource
	private ApproveprojDao approveprojDao;
	@Resource
	private IndexService indexService;
	@Resource
	private ProcessEngine processEngine;
	@Resource
	private UserService userService;

	// 分页查询所有的项目信息
	public List<Foll_up_Proj> queryAllxiangMuXX(Foll_QueryVo vo) {
		return approveprojDao.queryAllxiangMuXX(vo);
	}

	// 按条件查询项目信息所有数量
	public Integer queryAllxiangMuXXCount(Foll_QueryVo vo) {
		return approveprojDao.queryAllxiangMuXXCount(vo);
	}

	// 查询所有的招标方式
	public JSONArray allZBFS() {
		return approveprojDao.allZBFS();
	}

	// 根据Id查询招标方式对象
	public BP_DM_METHOD queryZBFSById(Integer bp_Method_Id) {
		return approveprojDao.queryZBFSById(bp_Method_Id);
	}

	// 查询所有我方负责人
	public JSONArray allUser(String userName) {
		return approveprojDao.allUser(userName);
	}

	// 项目立项
	public void saveXiangMuXX(Foll_up_Proj foll_up_Proj) {
		approveprojDao.saveXiangMuXX(foll_up_Proj);
	}

	// 启动流程实例
	public void saveStartProcess(String user_name, HttpServletRequest request) {
		// 1：根据新增项目信息的Id查询项目信息对象 Foll_up_Proj
		Integer xiangMuXXId = xiangMuXXId();
		Foll_up_Proj foll_up_Proj = queryXiangMuXXById(xiangMuXXId);
		// 2：使用当前对象获取到流程定义的key（对象的名称就是流程定义的key）
		String key = foll_up_Proj.getClass().getSimpleName();
		/**
		 * 3：从Session中获取当前任务的办理人，使用流程变量设置下一个任务的办理人 inputUser是流程变量的名称， 获取的办理人是流程变量的值
		 */
		Map<String, Object> variables = new HashMap<String, Object>();
		variables.put("inputUser", user_name);// 表示惟一用户
		/**
		 * 4： (1)使用流程变量设置字符串（格式：Foll_up_Proj.id的形式），通过设置，让启动的流程（流程实例）关联业务
		 * (2)使用正在执行对象表中的一个字段BUSINESS_KEY（Activiti提供的一个字段），让启动的流程（流程实例）关联业务
		 */
		// 格式：Foll_up_Proj.id的形式（使用流程变量）
		String objId = key + "." + String.valueOf(xiangMuXXId);
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

	// 查询最大主键值
	public Integer xiangMuXXId() {
		return approveprojDao.xiangMuXXId();
	}

	// 根据Id查询项目信息对象
	public Foll_up_Proj queryXiangMuXXById(Integer proj_Id) {
		return approveprojDao.queryXiangMuXXById(proj_Id);
	}

	// 跟新项目信息
	public void editXiangMuXX(Foll_up_Proj foll_up_Proj) {
		approveprojDao.editXiangMuXX(foll_up_Proj);
	}

	// 根据Id查询审批状态
	public APPR_DM_STATUS queryStatus(Integer appr_Status_Id) {
		return approveprojDao.queryStatus(appr_Status_Id);
	}

	// 项目信息列表点击项目信息查看信息数据
	public List<ReviewOpinion> xiangMuXXShowById(Integer proj_Id, Model model,HttpSession session) {
		// 使用请假单ID，查询请假单对象
		Foll_up_Proj xmxx = approveprojDao.queryXiangMuXXById(proj_Id);
		// 格式化计划合同签订日期
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		BP_DM_METHOD zbfs = null;
		User user = null;
		if (xmxx != null) {
			xmxx.setPlan_cont_date(sdf.format(xmxx.getPlan_Cont_Date()));
			// 查询所选招标方式对象
			zbfs = queryZBFSById(xmxx.getBp_method());
			user = userService.queryUserById(xmxx.getUser_Id());
		}
		// 获取对象的名称
		String objectName = xmxx.getClass().getSimpleName();
		// 组织流程表中的字段中的值
		String objId = objectName + "." + String.valueOf(proj_Id);
		/** 2:使用历史的流程变量查询，返回历史的流程变量的对象，获取流程实例ID */
		HistoricVariableInstance hvi = processEngine.getHistoryService().createHistoricVariableInstanceQuery()// 对应历史的流程变量表
				.variableValueEquals("objId", objId).singleResult();
		// 流程实例ID
		String processInstanceId = hvi.getProcessInstanceId();
		model.addAttribute("foll_up_Proj", xmxx);
		model.addAttribute("zbfs", zbfs);
		model.addAttribute("user", user);
		// 通过流程实例Id得到流程部署Id
		String procinstById = queryProcinstById(processInstanceId);
		List<ReviewOpinion> queryReviewOpinions = indexService.queryReviewOpinions(processInstanceId);
		// 设置 ReviewOpinion中的流程部署Id
		for (ReviewOpinion reviewOpinion : queryReviewOpinions) {
			reviewOpinion.setProcinstById(procinstById);
		}
		//如果 queryReviewOpinions为空则将流程部署Id添加入session
		if(queryReviewOpinions==null||queryReviewOpinions.size()==0) {
			//将流程部署Id存入session中
			session.setAttribute("prodefById", procinstById);
		}
		return queryReviewOpinions;
	}

	// 点击业务数据列表进入查看页显示对应的流程图返回流程部署Id
	public String queryProcinstById(String processInstanceId) {
		return approveprojDao.queryProcinstById(processInstanceId);
	}

	// 通过流程部署Id查询流程部署对象
	public ProcessDefinition queryProcessDefinitionById(String PROC_DEF_ID_) {
		ProcessDefinition pd = processEngine.getRepositoryService().createProcessDefinitionQuery()// 创建流程定义查询对象
				.processDefinitionId(PROC_DEF_ID_)// 使用流程定义Id对象
				.singleResult();
		return pd;
	}

	// 高级搜索区查询所有的项目信息
	public JSONArray queryAllXMXX() {
		return approveprojDao.queryAllXMXX();
	}

	// 高级搜索区查询所有的审批状态
	public JSONArray queryAllSPZT() {
		return approveprojDao.queryAllSPZT();
	}

	

}
