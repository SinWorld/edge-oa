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
public class GateWayTest {
	ProcessEngine pe = ProcessEngines.getDefaultProcessEngine();
	
	/**
	 * 部署流程定义
	 */
	@Test
	public void test1() {
		DeploymentBuilder deploymentBuilder = pe.getRepositoryService()
				.createDeployment();
		deploymentBuilder .addClasspathResource("com/edge/test/activiti/gateway/gateWay1.bpmn");
		deploymentBuilder .addClasspathResource("com/edge/test/activiti/gateway/gateWay1.png");
		Deployment deployment = deploymentBuilder.deploy();
	}
	
	/**
	 * 启动流程实例
	 */
	@Test
	public void test2(){
		String processDefinitionKey = "gateWay1";
		pe.getRuntimeService().startProcessInstanceByKey(processDefinitionKey);
	}
	
	/**
	 * 办理任务，设置流程变量
	 */
	@Test
	public void test3(){
		String taskId = "97504";
		Map<String, Object> variables = new HashMap<String, Object>();
		variables.put("bxje", 200);
		pe.getTaskService().complete(taskId, variables);
	}
}
