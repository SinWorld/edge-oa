package com.edge.test.activiti.history;
/**
 * 查询历史数据
 * @author NingCG
 *
 */

import java.util.List;

import org.activiti.engine.ProcessEngine;
import org.activiti.engine.ProcessEngines;
import org.activiti.engine.history.HistoricActivityInstance;
import org.activiti.engine.history.HistoricActivityInstanceQuery;
import org.activiti.engine.history.HistoricProcessInstance;
import org.activiti.engine.history.HistoricProcessInstanceQuery;
import org.activiti.engine.history.HistoricTaskInstance;
import org.activiti.engine.history.HistoricTaskInstanceQuery;
import org.activiti.engine.repository.Deployment;
import org.activiti.engine.repository.DeploymentBuilder;
import org.activiti.engine.runtime.ProcessInstance;
import org.activiti.engine.task.Task;
import org.activiti.engine.task.TaskQuery;
import org.junit.Test;

public class HistoryDateTest {
	ProcessEngine pe = ProcessEngines.getDefaultProcessEngine();// 获得工作流引擎

	/**
	 * 部署流程定义
	 */
	@Test
	public void test1() {
		DeploymentBuilder deploymentBuilder = pe.getRepositoryService().createDeployment();
		deploymentBuilder.addClasspathResource("com/edge/test/activiti/history/history.bpmn");
		deploymentBuilder.addClasspathResource("com/edge/test/activiti/history/history.png");
		Deployment deploy = deploymentBuilder.deploy();
	}

	/**
	 * 启动流程实例
	 */
	@Test
	public void test2() {
		String processDefinitionKey = "history";
		ProcessInstance pi = pe.getRuntimeService().startProcessInstanceByKey(processDefinitionKey);
	}

	/**
	 * 查询任务列表
	 */
	@Test
	public void test3() {
		TaskQuery query = pe.getTaskService().createTaskQuery();
		List<Task> list = query.list();
		for (Task task : list) {
			System.out.println(task.getId());
		}
	}

	/**
	 * 办理任务
	 */
	@Test
	public void test4() {
		String taskId = "7502";
		pe.getTaskService().complete(taskId);
	}

	/**
	 * 查询历史流程实例
	 */
	@Test
	public void test5() {
		HistoricProcessInstanceQuery query = pe.getHistoryService().createHistoricProcessInstanceQuery();
		List<HistoricProcessInstance> list = query.list();
		for (HistoricProcessInstance hi : list) {
			System.out.println(hi.getId());
		}
	}

	/**
	 * 查询历史活动数据
	 */
	@Test
	public void test6() {
		HistoricActivityInstanceQuery query = pe.getHistoryService().createHistoricActivityInstanceQuery();
		query.orderByProcessInstanceId().desc();
		query.orderByHistoricActivityInstanceEndTime().asc();
		List<HistoricActivityInstance> list = query.list();
		for (HistoricActivityInstance hi : list) {
			System.out.println(hi.getActivityId() + " " + hi.getActivityName() + " " + hi.getActivityType());
		}
	}

	/**
	 * 查询历史任务数据
	 */
	@Test
	public void test7() {
		HistoricTaskInstanceQuery query = pe.getHistoryService().createHistoricTaskInstanceQuery();
		query.orderByProcessInstanceId().asc();
		query.orderByHistoricTaskInstanceStartTime().asc();
		List<HistoricTaskInstance> list = query.list();
		for (HistoricTaskInstance hi : list) {
			System.out.println(hi.getAssignee() + " " + hi.getName() + " " + hi.getStartTime());
		}
	}
}
