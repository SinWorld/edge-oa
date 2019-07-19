package com.edge.WagePerformance.service.impl;

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
import com.edge.WagePerformance.dao.WagePerDao;
import com.edge.WagePerformance.entity.WagePerformance;
import com.edge.WagePerformance.entity.Wage_QueryVo;
import com.edge.WagePerformance.service.inter.WagePerService;
import com.edge.index.service.inter.IndexService;
import com.edge.projman.approveproj.dao.ApproveprojDao;
import com.edge.projman.approveproj.entity.Foll_up_Proj;
import com.edge.reimburse.bxtb.entity.Reimburse_DM_FYLX;
import com.edge.reimburse.bxtb.entity.Reimbursement;
import com.edge.system.department.dao.DepartmentDao;
import com.edge.system.department.entity.Department;
import com.edge.system.user.dao.UserDao;
import com.edge.system.user.entity.User;
import com.edge.system.user.entity.User_DM_Posittion;
import com.edge.system.user.entity.User_DM_YGLX;
import com.edge.utils.ReviewOpinion;

@Service
public class WagePerServiceImpl implements WagePerService {
	@Resource
	private WagePerDao wagePerDao;
	@Resource
	private ProcessEngine processEngine;
	@Resource
	private UserDao userDao;
	@Resource
	private DepartmentDao departmentDao;
	@Resource
	private ApproveprojDao approveprojDao;
	@Resource
	private IndexService indexService;

	// ajax加载所有的用户
	public JSONArray querAllUser() {
		return wagePerDao.querAllUser();
	}

	// 下拉用户带出所属部门和所属岗位
	public User queryUserBMandGW(Integer user_id) {
		return wagePerDao.queryUserBMandGW(user_id);
	}

	// 加载员工类型
	public JSONArray querAllYGLX() {
		return wagePerDao.querAllYGLX();
	}

	// 根据id查询员工类型
	public User_DM_YGLX queryYGLXById(Integer yglx_dm) {
		return wagePerDao.queryYGLXById(yglx_dm);
	}

	// 新增操作
	public void saveWage(WagePerformance wagePerformance) {
		wagePerDao.saveWage(wagePerformance);
	}

	// 加载个人所填写的工资记录
	public List<WagePerformance> queryMyGZJLS(String wage_per_Tbr) {
		return wagePerDao.queryMyGZJLS(wage_per_Tbr);
	}

	// 编辑操作
	public void editWage(WagePerformance wagePerformance) {
		wagePerDao.editWage(wagePerformance);
	}

	// 根据id查询工资填报对象
	public WagePerformance queryWageById(Integer wage_per_Id) {
		return wagePerDao.queryWageById(wage_per_Id);
	}

	// 根据id删除工资填报对象
	public void deleteReimById(Integer wage_per_Id) {
		wagePerDao.deleteReimById(wage_per_Id);
	}

	// 启动流程实例
	public void saveStartProcess(String user_name, HttpServletRequest request, WagePerformance wagePerformance) {
		// 1.：使用当前对象获取到流程定义的key（对象的名称就是流程定义的key）
		String key = wagePerformance.getClass().getSimpleName();
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
		String objId = key + "." + String.valueOf(wagePerformance.getWage_per_Id());
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

	// 分页显示填报记录
	public List<WagePerformance> queryAllWagePerformance(Wage_QueryVo vo) {
		return wagePerDao.queryAllWagePerformance(vo);
	}

	// 显示填报记录的数量
	public Integer queryAllWagePerformanceCount(Wage_QueryVo vo) {
		return wagePerDao.queryAllWagePerformanceCount(vo);
	}

	// 点击报销记录查看业务数据
	public List<ReviewOpinion> wageShowById(Integer wage_per_Id, Model model, HttpSession session) {
		// 使用请报销ID，查询报销对象
		WagePerformance wagePerformance = wagePerDao.queryWageById(wage_per_Id);
		// 格式化月份
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM");
		User user = null;// 员工
		Department department = null;// 部门
		User_DM_Posittion posittion = null;// 岗位
		User_DM_YGLX yglx = null;// 员工类型
		if (wagePerformance != null) {
			wagePerformance.setMonth(sdf.format(wagePerformance.getWage_per_Month()));
			// 查询员工
			user = userDao.queryUserById(wagePerformance.getWage_per_Name());
			if (user != null) {
				wagePerformance.setUser_Name(user.getUser_name());
			}
			// 查询部门
			department = departmentDao.queryDepartmentById(wagePerformance.getWage_per_Department());
			if (department != null) {
				wagePerformance.setUser_Department(department.getDep_name());
			}
			// 查询岗位
			posittion = userDao.queryPosittionById(wagePerformance.getWage_per_Position());
			if (posittion != null) {
				wagePerformance.setUser_Posittion(posittion.getPosittion_mc());
			}
			// 查询员工类型
			yglx = wagePerDao.queryYGLXById(wagePerformance.getWage_per_Yglx());
			if (yglx != null) {
				wagePerformance.setYglx_name(yglx.getYglx_mc());
			}
		}
		// 获取对象的名称
		String objectName = wagePerformance.getClass().getSimpleName();
		// 组织流程表中的字段中的值
		String objId = objectName + "." + String.valueOf(wagePerformance.getWage_per_Id());
		/** 2:使用历史的流程变量查询，返回历史的流程变量的对象，获取流程实例ID */
		HistoricVariableInstance hvi = processEngine.getHistoryService().createHistoricVariableInstanceQuery()// 对应历史的流程变量表
				.variableValueEquals("objId", objId).singleResult();
		// 流程实例ID
		String processInstanceId = hvi.getProcessInstanceId();
		model.addAttribute("wagePerformance", wagePerformance);
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
