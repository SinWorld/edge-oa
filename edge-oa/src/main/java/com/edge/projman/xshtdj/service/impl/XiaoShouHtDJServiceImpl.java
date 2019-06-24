package com.edge.projman.xshtdj.service.impl;

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
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.alibaba.fastjson.JSONArray;
import com.edge.index.service.inter.IndexService;
import com.edge.projman.approveproj.dao.ApproveprojDao;
import com.edge.projman.approveproj.entity.Foll_up_Proj;
import com.edge.projman.approveproj.service.inter.ApproveprojService;
import com.edge.projman.xshtdj.dao.XiaoShouHTDJDao;
import com.edge.projman.xshtdj.entity.HuoWuInFor;
import com.edge.projman.xshtdj.entity.XiaoShouHT;
import com.edge.projman.xshtdj.entity.Xsht_QueryVo;
import com.edge.projman.xshtdj.service.inter.XiaoShouHTDJService;
import com.edge.system.user.entity.User;
import com.edge.system.user.service.inter.UserService;
import com.edge.utils.APPR_DM_STATUS;
import com.edge.utils.BP_DM_METHOD;
import com.edge.utils.ReviewOpinion;

@Service
public class XiaoShouHtDJServiceImpl implements XiaoShouHTDJService {
	@Resource
	private XiaoShouHTDJDao xiaoShouHTDJDao;
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

	// 分页查询所有的销售合同
	public List<XiaoShouHT> queryAllXiaoShouHt(Xsht_QueryVo vo) {
		return xiaoShouHTDJDao.queryAllXiaoShouHt(vo);
	}

	// 按条件查询销售合同所有数量
	public Integer queryAllXiaoShouHTCount(Xsht_QueryVo vo) {
		return xiaoShouHTDJDao.queryAllXiaoShouHTCount(vo);
	}

	// 根据Id查询审批状态
	public APPR_DM_STATUS queryStatus(Integer appr_Status_Id) {
		return xiaoShouHTDJDao.queryStatus(appr_Status_Id);
	}

	// 查询所有的销售合同（高级搜索）
	public JSONArray queryAllXSHT() {
		return xiaoShouHTDJDao.queryAllXSHT();
	}

	// 查询所有已立项的项目信息
	public JSONArray queryAllYLXXMXX() {
		return xiaoShouHTDJDao.queryAllYLXXMXX();
	}

	// 查询所有未立项的项目
	public JSONArray queryAllWLXXMXX() {
		return xiaoShouHTDJDao.queryAllWLXXMXX();
	}

	// 新增销售合同
	public void saveXSHT(XiaoShouHT xiaoShouHT) {
		xiaoShouHTDJDao.saveXSHT(xiaoShouHT);
	}

	// 根据Id查询对应的销售合同
	public XiaoShouHT queryXSHTById(Integer proj_Info_Id) {
		return xiaoShouHTDJDao.queryXSHTById(proj_Info_Id);
	}

	// 查询新增后的销售合同主键值
	public Integer queryXSHTMaxId() {
		return xiaoShouHTDJDao.queryXSHTMaxId();
	}

	// 编辑销售合同
	public void editXSHT(XiaoShouHT xiaoShouHT) {
		xiaoShouHTDJDao.editXSHT(xiaoShouHT);
	}

	// 启动流程实例
	public void saveStartProcess(String user_name, HttpServletRequest request) {
		// 1：根据新增销售合同的Id查询销售合同对象 XiaoShouHT
		Integer xshtId = queryXSHTMaxId();
		XiaoShouHT xsht = queryXSHTById(xshtId);
		// 2：使用当前对象获取到流程定义的key（对象的名称就是流程定义的key）
		String key = xsht.getClass().getSimpleName();
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
		String objId = key + "." + String.valueOf(xshtId);
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

	// 销售合同登记列表查看业务数据
	public List<ReviewOpinion> xiaoShouHTShowById(Integer proj_Id, Model model, HttpSession session) {
		// 格局销售合同主键查询销售合同对象
		XiaoShouHT xsht = xiaoShouHTDJDao.queryXSHTById(proj_Id);
		// 格式化签订日期、合同计划完成日期、质保金到期日期
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		BP_DM_METHOD zbfs = null;// 招标方式
		Foll_up_Proj xmxx = null;// 所属项目
		User user = null;// 我方负责人
		if (xsht != null) {
			xsht.setQdrq(sdf.format(xsht.getCont_Date()));
			xsht.setHtjhwcrq(sdf.format(xsht.getFinish_Time()));
			xsht.setZbjdqrq(sdf.format(xsht.getQual_Expiredate()));
			// 查询所选招标方式对象
			zbfs = approveprojService.queryZBFSById(xsht.getBp_Method());
			// 查询所属项目
			xmxx = approveprojService.queryXiangMuXXById(xsht.getProj_Id());
			// 查询我方负责人
			user = userService.queryUserById(xsht.getUser_Id());
		}
		// 获取对象的名称
		String objectName = xsht.getClass().getSimpleName();
		// 组织流程表中的字段中的值
		String objId = objectName + "." + String.valueOf(proj_Id);
		/** 2:使用历史的流程变量查询，返回历史的流程变量的对象，获取流程实例ID */
		HistoricVariableInstance hvi = processEngine.getHistoryService().createHistoricVariableInstanceQuery()// 对应历史的流程变量表
				.variableValueEquals("objId", objId).singleResult();
		// 流程实例ID
		String processInstanceId = hvi.getProcessInstanceId();
		model.addAttribute("xmxx", xmxx);
		model.addAttribute("xsht", xsht);
		model.addAttribute("zbfs", zbfs);
		model.addAttribute("user", user);
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

	// 新增货物产品内容
	public void addHWCPNR(HuoWuInFor huoWuInFor) {
		xiaoShouHTDJDao.addHWCPNR(huoWuInFor);
	}

	// 查询该销售合同对应的产品内容
	public List<HuoWuInFor> hwnrs(Integer proj_Info_Id) {
		return xiaoShouHTDJDao.hwnrs(proj_Info_Id);
	}

	// 根据id查询对应的货物产品内容
	public HuoWuInFor queryHuoWuInForById(Integer hwId) {
		return xiaoShouHTDJDao.queryHuoWuInForById(hwId);
	}

	// 编辑货物产品内容
	public void editHWCPNR(HuoWuInFor huoWuInFor) {
		xiaoShouHTDJDao.editHWCPNR(huoWuInFor);

	}

	// 删除货物产品数据
	public void deleteHWNRById(Integer hwId) {
		xiaoShouHTDJDao.deleteHWNRById(hwId);
	}

}
