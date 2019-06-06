package com.edge.index.service.impl;

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
import org.activiti.engine.history.HistoricTaskInstance;
import org.activiti.engine.impl.identity.Authentication;
import org.activiti.engine.impl.persistence.entity.ProcessDefinitionEntity;
import org.activiti.engine.impl.pvm.process.ActivityImpl;
import org.activiti.engine.repository.ProcessDefinition;
import org.activiti.engine.runtime.ProcessInstance;
import org.activiti.engine.task.Task;
import org.springframework.stereotype.Service;

import com.edge.index.dao.IndexDao;
import com.edge.index.service.inter.IndexService;
import com.edge.system.role.entity.Privilege;
import com.edge.system.user.entity.User;
import com.edge.system.user.service.inter.UserService;
import com.edge.utils.MyTask;
import com.edge.utils.QueryVo;
import com.edge.utils.ReviewOpinion;
import com.edge.utils.TaskYWC;

@Service
public class IndexServiceImpl implements IndexService {

	@Resource
	private IndexDao indexDao;

	@Resource
	private ProcessEngine processEngine;

	@Resource
	private UserService userService;

	// 用户登录到首页时根据用户主键查询当前用户的顶级权限
	public List<Privilege> userPrivilegeList(Integer user_id) {
		return indexDao.userPrivilegeList(user_id);
	}

	// 查询当前用户所有顶级权限下的二级子权限
	public List<Privilege> ejChildrenList(Integer user_id, Integer parent_id) {
		return indexDao.ejChildrenList(user_id, parent_id);
	}

	// 分页查询我的代办
	public List<MyTask> queryMyTask(QueryVo vo) {
		return indexDao.queryMyTask(vo);
	}

	// 查询我的代办数量
	public Integer myTaskCount(String user_name) {
		return indexDao.myTaskCount(user_name);
	}

	// 查询business_key拿到业务数据主键查询业务表代办任务描述
	public List<String> queryBusinesskey(String proc_def_id) {
		return indexDao.queryBusinesskey(proc_def_id);
	}

	/** 使用部署对象ID和资源图片名称，获取图片的输入流 */
	public InputStream findImageInputStream(String deploymentId, String imageName) {
		return processEngine.getRepositoryService().getResourceAsStream(deploymentId, imageName);

	}

	// 通过任务主键去得到业务主键
	public String querObject(String task_id) {
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

	/** 获取批注信息，传递的是当前任务ID，获取历史任务ID对应的批注 */
	public List<ReviewOpinion> queryCommentByTaskId(String taskId) {
		// 使用当前的任务ID，查询当前流程对应的历史任务ID
		// 使用当前任务ID，获取当前任务对象
		String proc_Inst_id = null;
		List<HistoricTaskInstance> list = processEngine.getHistoryService().createHistoricTaskInstanceQuery().list();
		for (HistoricTaskInstance l : list) {
			if (taskId.equals(l.getId())) {
				proc_Inst_id = l.getProcessInstanceId();
				break;
			}
		}
		// Task task =
		// processEngine.getTaskService().createTaskQuery().taskId(taskId).singleResult();
		// 获取流程实例Id
		// String proc_Inst_id=null;
		// if(task!=null) {
		// proc_Inst_id = task.getProcessInstanceId();
		// }

		return queryReviewOpinions(proc_Inst_id);
	}

	public List<ReviewOpinion> queryReviewOpinions(String proc_Inst_id) {
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");// 设置日期格式
		List<ReviewOpinion> reviewOpinions = indexDao.queryReviewOpinions(proc_Inst_id);
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

	// 通过任务主键去得到业务主键
	public String querObjectId(String task_id) {
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

	// 获取任务Id，获取任务对象，使用任务对象获取流程定义Id，查询流程定义对象
	public ProcessDefinition queryProcessDefinitionByTaskId(String taskId) {
		List<HistoricTaskInstance> his=new ArrayList<HistoricTaskInstance>();
		// 使用任务Id去查询历史任务
		List<HistoricTaskInstance> list = processEngine.getHistoryService().createHistoricTaskInstanceQuery().list();
		for (HistoricTaskInstance l : list) {
			if (taskId.equals(l.getId())) {
				taskId = l.getProcessInstanceId();
				his.add(l);
				break;
			}
		}
		//取得历史任务中的流程定义Id
		if(his.size()>0&&his!=null) {
			String processDefinitionId = his.get(0).getProcessDefinitionId();
			ProcessDefinition pd = processEngine.getRepositoryService().createProcessDefinitionQuery()// 创建流程定义查询对象
					// 对应表act_re_procdef
					.processDefinitionId(processDefinitionId)// 使用流程定义Id对象
					.singleResult();
			return pd;
		}else {
			return null;
		}
	}

	/**
	 * 二：查看当前活动，获取当期活动对应的坐标x,y,width,height，将4个值存放到Map<String,Object>中
	 * map集合的key：表示坐标x,y,width,height map集合的value：表示坐标对应的值
	 */
	public Map<String, Object> queryCoordingByTask(String taskId) {
		// 存放坐标
		Map<String, Object> map = new HashMap<String, Object>();
		// 获取流程定义Id
		String processDefinitionId = null;
		String processInstanceId=null;
		List<HistoricTaskInstance> list = processEngine.getHistoryService().createHistoricTaskInstanceQuery().list();
		for (HistoricTaskInstance l : list) {
			if (taskId.equals(l.getId())) {
				processDefinitionId=l.getProcessDefinitionId();
				processInstanceId=l.getProcessInstanceId();
				break;
			}
		}
		// 获取流程定义的实体对象（对应.bpmn文件中的数据）
		ProcessDefinitionEntity processDefinitionEntity = (ProcessDefinitionEntity) processEngine.getRepositoryService()
				.getProcessDefinition(processDefinitionId);
		// 流程实例ID
		// 使用流程实例ID，查询正在执行的执行对象表，获取当前活动对应的流程实例对象
		ProcessInstance pi = processEngine.getRuntimeService().createProcessInstanceQuery()// 创建流程查询实例
				.processInstanceId(processInstanceId).singleResult();// 使用流程实例ID查询
		// 获取当前活动的ID
		if(pi!=null) {
			String activityId = pi.getActivityId();
			// 获取当前活动对象
			ActivityImpl activityImpl = processDefinitionEntity.findActivity(activityId);// 活动ID
			// 获取历史走过的节点对象
			// 获取坐标
			map.put("x", activityImpl.getX());
			map.put("y", activityImpl.getY() * 1 + 70);
			map.put("width", activityImpl.getWidth());
			map.put("height", activityImpl.getHeight());
			return map;
		}else {
			return null;
		}
	}

	// 使用任务Id获取当前任务节点中对应的Form key中连接的值
	public String querTaskFromKeyByTaskId(String task_id) {
		TaskFormData taskFormData = processEngine.getFormService().getTaskFormData(task_id);
		// 获取formKey的值
		String result = taskFormData.getFormKey();
		return result;

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
	//分页查询已完成的代办
	public List<TaskYWC> queryTaskYWC(QueryVo vo) {
		return indexDao.queryTaskYWC(vo);
	}
	//查询已完成代办
	public Integer TaskYWCCount() {
		return indexDao.TaskYWCCount();
	}

}
