package com.edge.test.activiti.gateway;

import java.util.HashMap;
import java.util.Map;

import org.activiti.engine.ProcessEngine;
import org.activiti.engine.ProcessEngines;
import org.activiti.engine.repository.Deployment;
import org.activiti.engine.repository.DeploymentBuilder;
import org.junit.Test;

/**
 * 网管测试
 * @author NingCG
 *
 */
public class GateWayTest2 {
	ProcessEngine pe = ProcessEngines.getDefaultProcessEngine();
	
	/**
	 * 部署流程定义
	 */
	@Test
	public void test1() {
		DeploymentBuilder deploymentBuilder = pe.getRepositoryService()
				.createDeployment();
		deploymentBuilder .addClasspathResource("com/edge/test/activiti/gateway/gateWay2.bpmn");
		deploymentBuilder .addClasspathResource("com/edge/test/activiti/gateway/gateWay2.png");
		Deployment deployment = deploymentBuilder.deploy();
	}
	
	/**
	 * 启动流程实例
	 */
	@Test
	public void test2(){
		String processDefinitionKey = "gateWay2";
		pe.getRuntimeService().startProcessInstanceByKey(processDefinitionKey);
	}
	
	/**
	 * 办理任务，设置流程变量
	 */
	@Test
	public void test3(){
		String taskId = "112502";
		pe.getTaskService().complete(taskId);
	}
}
