package com.edge.test.activiti.task.group;

import java.util.List;

import org.activiti.engine.ProcessEngine;
import org.activiti.engine.ProcessEngines;
import org.activiti.engine.repository.Deployment;
import org.activiti.engine.repository.DeploymentBuilder;
import org.activiti.engine.task.Task;
import org.activiti.engine.task.TaskQuery;
import org.junit.Test;

/**
 * 公共如任务
 * 
 * @author NingCG
 *
 */
public class GroupTaskTest {
	ProcessEngine pe = ProcessEngines.getDefaultProcessEngine();// 获得工作流引擎

	/**
	 * 部署流程定义
	 */
	@Test
	public void test1() {
		DeploymentBuilder deploymentBuilder = pe.getRepositoryService().createDeployment();
		deploymentBuilder.addClasspathResource("com/edge/test/activiti/task/group/groupTask.bpmn");
		deploymentBuilder.addClasspathResource("com/edge/test/activiti/task/group/groupTask.png");
		Deployment deploy = deploymentBuilder.deploy();
	}

	/**
	 * 启动流程实例
	 */
	@Test
	public void test2() {
		String processDefinitionId = "groupTask:1:40004";
		pe.getRuntimeService().startProcessInstanceById(processDefinitionId);
	}

	/**
	 * 办理个人任务
	 */
	@Test
	public void test3() {
		String taskId = "47502";
		pe.getTaskService().complete(taskId);
	}

	/**
	 * 查询公共任务列表
	 */
	@Test
	public void test4() {
		TaskQuery query = pe.getTaskService().createTaskQuery();
		String candidateUser = "张三";
		query.taskCandidateUser(candidateUser);
		List<Task> list = query.list();
		for (Task task : list) {
			System.out.println(task.getName());
		}
	}

	/**
	 * 拾取任务 将公共任务转换为个人任务
	 */
	@Test
	public void test5() {
		String taskId = "47502";
		String userId = "Selina";
		pe.getTaskService().claim(taskId, userId);
	}

	/**
	 * 退回任务（将个人任务转换为公共任务）
	 */
	@Test
	public void test6() {
		String taskId = "47502";
		pe.getTaskService().setAssignee(taskId, null);
	}
}
