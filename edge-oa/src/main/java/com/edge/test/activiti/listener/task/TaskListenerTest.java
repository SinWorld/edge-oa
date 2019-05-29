package com.edge.test.activiti.listener.task;

import java.util.HashMap;
import java.util.Map;

import org.activiti.engine.ProcessEngine;
import org.activiti.engine.ProcessEngines;
import org.activiti.engine.repository.Deployment;
import org.activiti.engine.repository.DeploymentBuilder;
import org.junit.Test;

/**
 * 任务监听器测试
 * 
 * @author NingCG
 *
 */
public class TaskListenerTest {
	ProcessEngine pe = ProcessEngines.getDefaultProcessEngine();

	/**
	 * 部署流程定义
	 */
	@Test
	public void test1() {
		DeploymentBuilder deploymentBuilder = pe.getRepositoryService().createDeployment();
		deploymentBuilder.addClasspathResource("com/edge/test/activiti/listener/task/taskListener.bpmn");
		deploymentBuilder.addClasspathResource("com/edge/test/activiti/listener/task/taskListener.png");
		Deployment deployment = deploymentBuilder.deploy();
	}
	
	/**
	 * 启动流程实例
	 */
	@Test
	public void test2(){
		String processDefinitionKey = "taskListener";
		Map<String, Object> variables = new HashMap<String, Object>();
		variables.put("key1", "v1");
		variables.put("k2", 300);
		pe.getRuntimeService().startProcessInstanceByKey(processDefinitionKey, variables);
	}
	
	/**
	 * 办理任务
	 */
	@Test
	public void test3(){
		String taskId = "77502";
		pe.getTaskService().complete(taskId );
	}
}
