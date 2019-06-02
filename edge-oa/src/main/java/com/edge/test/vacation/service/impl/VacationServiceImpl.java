package com.edge.test.vacation.service.impl;

import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.activiti.engine.ProcessEngine;
import org.activiti.engine.form.TaskFormData;
import org.activiti.engine.history.HistoricVariableInstance;
import org.activiti.engine.impl.identity.Authentication;
import org.activiti.engine.impl.persistence.entity.ProcessDefinitionEntity;
import org.activiti.engine.impl.pvm.PvmTransition;
import org.activiti.engine.impl.pvm.process.ActivityImpl;
import org.activiti.engine.repository.ProcessDefinition;
import org.activiti.engine.runtime.ProcessInstance;
import org.activiti.engine.task.Comment;
import org.activiti.engine.task.Task;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.edge.system.user.entity.User;
import com.edge.system.user.service.inter.UserService;
import com.edge.test.vacation.dao.VacationDao;
import com.edge.test.vacation.entity.MyTask;
import com.edge.test.vacation.entity.ReviewOpinion;
import com.edge.test.vacation.entity.TaskYWC;
import com.edge.test.vacation.entity.Vacation;
import com.edge.test.vacation.service.inter.VacationService;
import com.edge.utils.QueryVo;

@Service
public class VacationServiceImpl implements VacationService {
	@Resource
	private VacationDao vacationDao;

	@Resource
	private ProcessEngine processEngine;

	@Resource
	private UserService userService;

	// 分页查询当前用户所有请假列表数据
	public List<Vacation> vacationList(QueryVo vo) {
		return vacationDao.vacationList(vo);
	}

	// 查询当前用户所有的请假记录
	public Integer vacationCount(Integer user_id) {
		return vacationDao.vacationCount(user_id);
	}

	// 添加请假记录
	public void addVacation(Vacation vacation) {
		vacationDao.addVacation(vacation);
	}

	// 启动流程实例
	public void saveStartProcess(Integer vacation_id, String user_name) {
		// 1：获取请假单ID，使用请假单ID，查询请假单的对象Vacation
		Vacation vacation = queryVacationById(vacation_id);
		// 2：使用当前对象获取到流程定义的key（对象的名称就是流程定义的key）
		String key = vacation.getClass().getSimpleName();
		/**
		 * 3：从Session中获取当前任务的办理人，使用流程变量设置下一个任务的办理人 inputUser是流程变量的名称， 获取的办理人是流程变量的值
		 */
		Map<String, Object> variables = new HashMap<String, Object>();
		variables.put("inputUser", user_name);// 表示惟一用户
		/**
		 * 4： (1)使用流程变量设置字符串（格式：Vacation.id的形式），通过设置，让启动的流程（流程实例）关联业务
		 * (2)使用正在执行对象表中的一个字段BUSINESS_KEY（Activiti提供的一个字段），让启动的流程（流程实例）关联业务
		 */
		// 格式：Vacation.id的形式（使用流程变量）
		String objId = key + "." + vacation_id;
		variables.put("objId", objId);
		// 5：使用流程定义的key，启动流程实例，同时设置流程变量，同时向正在执行的执行对象表中的字段BUSINESS_KEY添加业务数据，同时让流程关联业务
		processEngine.getRuntimeService().startProcessInstanceByKey(key, objId, variables);
	}

	// 根据主键查询当前请假记录
	public Vacation queryVacationById(Integer vacation_id) {
		return vacationDao.queryVacationById(vacation_id);
	}

	// 分页查询我的代办
	public List<MyTask> queryMyTask(QueryVo vo) {
		return vacationDao.queryMyTask(vo);
	}

	// 查询我的代办数量
	public Integer myTaskCount(String user_name) {
		return vacationDao.myTaskCount(user_name);
	}

	// 查询当前用户添加的最大请假记录主键值
	public Integer vacationMaxId(Integer user_id) {
		return vacationDao.vacationMaxId(user_id);
	}

	// 通过任务主键去得到业务主键
	public String querVacationId(String task_id) {
		// 1.使用任务Id查询任务对象Task
		Task task = processEngine.getTaskService().createTaskQuery().taskId(task_id).singleResult();
		// 2.使用任务对象Task获取流程实例Id
		String processInstanceId = task.getProcessInstanceId();
		// 3.使用流程实例Id，查询正在执行的执行对象表，返回流程实例对象
		ProcessInstance pi = processEngine.getRuntimeService().createProcessInstanceQuery()
				.processInstanceId(processInstanceId)// 使用流程实例Id查询
				.singleResult();
		// 4.使用流程实例对象获取BUSINESS_KEY_
		String businessKey = pi.getBusinessKey();
		return businessKey;
	}

	// 使用任务Id获取当前任务节点中对应的Form key中连接的值
	public String querTaskFromKeyByTaskId(String task_id) {
		TaskFormData taskFormData = processEngine.getFormService().getTaskFormData(task_id);
		// 获取formKey的值
		String url = taskFormData.getFormKey();
		return url;

	}

	/**
	 * 已知任务ID，查询ProcessDefinitionEntiy对象， 从而获取当前任务完成之后的连线名称，并放置到List<String>集合中
	 */
	public List<String> queryOutComeListByTaskId(String taskId) {
		// 返回存放连线的名称集合
		List<String> list = new ArrayList<String>();
		// 1:使用任务ID，查询任务对象
		Task task = processEngine.getTaskService().createTaskQuery().taskId(taskId).singleResult();
		// 2.获取流程定义Id
		String processDefinitionId = task.getProcessDefinitionId();
		// 3：查询ProcessDefinitionEntiy对象
		ProcessDefinitionEntity processDefinitionEntity = (ProcessDefinitionEntity) processEngine.getRepositoryService()
				.getProcessDefinition(processDefinitionId);
		// 4.使用任务对象Task获取流程实例ID
		String processInstanceId = task.getProcessInstanceId();
		// 5.使用流程实例ID，查询正在执行的执行对象表，返回流程实例对象
		ProcessInstance pi = processEngine.getRuntimeService().createProcessInstanceQuery()
				.processInstanceId(processInstanceId).singleResult();// 使用流程实例Id查询
		// 6.获取当前活动的id
		String activityId = pi.getActivityId();
		// 7：获取当前的活动
		ActivityImpl activityImpl = processDefinitionEntity.findActivity(activityId);
		// 8：获取当前活动完成之后连线的名称
		List<PvmTransition> pvmList = activityImpl.getOutgoingTransitions();
		if (pvmList != null && pvmList.size() > 0) {
			for (PvmTransition pvm : pvmList) {
				String name = (String) pvm.getProperty("name");
				if (StringUtils.isNotBlank(name)) {
					list.add(name);
				}
			}
		}
		return list;
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

	// 指定任务连线的名称完成任务
	public void saveSubmitTask(String taskId, HttpServletRequest request, String advice, String outcome) {
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
		String message = outcome + "," + advice;
		processEngine.getTaskService().addComment(taskId, processInstanceId, message);
		Map<String, Object> variables = new HashMap<String, Object>();
		if (outcome != null) {
			variables.put("outcome", outcome);
		}
		// 3：使用任务ID，完成当前人的个人任务，同时流程变量
		processEngine.getTaskService().complete(taskId, variables);
		// 4：当任务完成之后，需要指定下一个任务的办理人（使用类）-----已经开发完成
	}

	// 查询当前我的任务
	public List<MyTask> queryAllMyTask(String user_name) {
		return vacationDao.queryAllMyTask(user_name);
	}

	// 查询已完成
	public List<TaskYWC> queryTaskYWC(QueryVo vo) {
		return vacationDao.queryTaskYWC(vo);
	}

	// 分页查询已完成数量
	public Integer TaskYWCCount() {
		return vacationDao.TaskYWCCount();
	}

	/** 获取批注信息，传递的是当前任务ID，获取历史任务ID对应的批注 */
	public List<ReviewOpinion> queryCommentByTaskId(String taskId) {
		// 使用当前的任务ID，查询当前流程对应的历史任务ID
		// 使用当前任务ID，获取当前任务对象
		Task task = processEngine.getTaskService().createTaskQuery().taskId(taskId).singleResult();
		// 获取流程实例Id
		String proc_Inst_id = task.getProcessInstanceId();
		return queryReviewOpinions(proc_Inst_id);
	}

	public List<ReviewOpinion> queryReviewOpinions(String proc_Inst_id) {
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");// 设置日期格式
		List<ReviewOpinion> reviewOpinions = vacationDao.queryReviewOpinions(proc_Inst_id);
		// 遍历该集合
		for (ReviewOpinion reviewOpinion : reviewOpinions) {
			// 修改属性值
			// 调用userService去查询审核用户得到用户名
			User user = userService.queryUserById(Integer.parseInt(reviewOpinion.getUSER_ID_()));
			reviewOpinion.setUserName((user.getUser_name()));
			reviewOpinion.setTime((df.format(reviewOpinion.getTIME_())));
			// 审批结果
			String result = reviewOpinion.getMESSAGE_().substring(0, reviewOpinion.getMESSAGE_().indexOf(","));
			// 审批意见
			String advise = reviewOpinion.getMESSAGE_().substring(reviewOpinion.getMESSAGE_().indexOf(",") + 1);
			reviewOpinion.setResult(result);
			reviewOpinion.setAdvise(advise);
		}
		return reviewOpinions;
	}

	// 请假记录列表点击请假记录查看请假数据
	public List<ReviewOpinion> vacationShowById(Integer vacation_id, Model model) {
		// 使用请假单ID，查询请假单对象
		Vacation vacation = vacationDao.queryVacationById(vacation_id);
		// 获取对象的名称
		String objectName = vacation.getClass().getSimpleName();
		// 组织流程表中的字段中的值
		String objId = objectName + "." + vacation_id;
		/** 2:使用历史的流程变量查询，返回历史的流程变量的对象，获取流程实例ID */
		HistoricVariableInstance hvi = processEngine.getHistoryService().createHistoricVariableInstanceQuery()// 对应历史的流程变量表
				.variableValueEquals("objId", objId).singleResult();
		// 流程实例ID
		String processInstanceId = hvi.getProcessInstanceId();
		model.addAttribute("vacation", vacation);
		List<ReviewOpinion> queryReviewOpinions = queryReviewOpinions(processInstanceId);
		return queryReviewOpinions;
	}

	// 获取任务Id，获取任务对象，使用任务对象获取流程定义Id，查询流程定义对象
	public ProcessDefinition queryProcessDefinitionByTaskId(String taskId) {
		// 使用任务Id查询任务对象
		Task task = processEngine.getTaskService().createTaskQuery().taskId(taskId)// 使用任务Id查询
				.singleResult();
		// 获取流程定义Id
		String processDefinitionId = task.getProcessDefinitionId();
		ProcessDefinition pd = processEngine.getRepositoryService().createProcessDefinitionQuery()//创建流程定义查询对象 对应表act_re_procdef
					.processDefinitionId(processDefinitionId)//使用流程定义Id对象
				.singleResult();
		return pd;
	}

	/**使用部署对象ID和资源图片名称，获取图片的输入流*/
	public InputStream findImageInputStream(String deploymentId,String imageName) {
		return processEngine.getRepositoryService().getResourceAsStream(deploymentId, imageName);
		
	}

}
