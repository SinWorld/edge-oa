package com.edge.test.activiti.listener.execution;

import org.activiti.engine.ProcessEngine;
import org.activiti.engine.ProcessEngines;
import org.activiti.engine.repository.Deployment;
import org.activiti.engine.repository.DeploymentBuilder;
import org.activiti.engine.runtime.ProcessInstance;
import org.junit.Test;

/**
 * 执行监听器测试
 * 
 * @author NingCG
 *
 */
public class ExecutionListenerTest {
	ProcessEngine pe = ProcessEngines.getDefaultProcessEngine();

	/**
	 * 部署流程定义
	 */
	@Test
	public void test1() {
		DeploymentBuilder deploymentBuilder = pe.getRepositoryService().createDeployment();
		deploymentBuilder.addClasspathResource("com/edge/test/activiti/listener/execution/executionListener.bpmn");
		deploymentBuilder.addClasspathResource("com/edge/test/activiti/listener/execution/executionListener.png");
		Deployment deployment = deploymentBuilder.deploy();
	}
	
	/**
	 * 启动流程实例
	 */
	@Test
	public void test2() {
		String processDefinitionKey = "executionListener";
		ProcessInstance pi = pe.getRuntimeService().startProcessInstanceByKey(processDefinitionKey);
	}
	
	/**
	 * 办理任务
	 */
	@Test
	public void test3(){
		String taskId = "65002";
		pe.getTaskService().complete(taskId );
	}
}
