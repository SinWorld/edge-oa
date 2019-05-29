package com.edge.test.activiti.variable;

import java.util.HashMap;
import java.util.Map;
import java.util.Set;

import org.activiti.engine.ProcessEngine;
import org.activiti.engine.ProcessEngines;
import org.activiti.engine.repository.Deployment;
import org.activiti.engine.repository.DeploymentBuilder;
import org.activiti.engine.runtime.ProcessInstance;
import org.activiti.engine.task.Task;
import org.junit.Test;

/**
 * 流程实例的流程变量测试
 * 
 * @author NingCG
 *
 */
public class VariableTest {
	ProcessEngine pe = ProcessEngines.getDefaultProcessEngine();// 获得工作流引擎

	/**
	 * 部署流程定义
	 */
	@Test
	public void test1() {
		DeploymentBuilder deploymentBuilder = pe.getRepositoryService().createDeployment();
		deploymentBuilder.addClasspathResource("com/edge/test/activiti/variable/variable.bpmn");
		deploymentBuilder.addClasspathResource("com/edge/test/activiti/variable/variable.png");
		Deployment deploy = deploymentBuilder.deploy();
	}

	/**
	 * 设置流程变量方式一：在启动流程实例时设置
	 */
	@Test
	public void test2() {
		String processDefinitionKey = "variable";
		Map<String, Object> variables = new HashMap<String, Object>();
		variables.put("key1", "value1");
		variables.put("key2", 200);
		ProcessInstance pi = pe.getRuntimeService().startProcessInstanceByKey(processDefinitionKey, variables);
		System.out.println(pi.getId());
	}

	/**
	 * 设置流程变量方式二：在办理任务时设置
	 */
	@Test
	public void test3() {
		String taskId = "17504";
		/*
		 * String taskId="15006"; Map<String,Object>variables=new HashMap<String,
		 * Object>(); variables.put("qjts", 5); variables.put("qjyy", "结婚");
		 * pe.getTaskService().complete(taskId, variables);
		 */

		Task task = pe.getTaskService().createTaskQuery().taskId(taskId).singleResult();
		String processInstanceId = task.getProcessInstanceId();
		System.out.println(processInstanceId);
	}

	/**
	 * 设置流程变量方式三：使用RuntimeService的方法设置
	 */
	@Test
	public void test4() {
		String executionId = "15001";// 流程实例ID
		String variableName = "key3";
		Object value = "value";
		pe.getRuntimeService().setVariable(executionId, variableName, value);
	}

	/**
	 * 设置流程变量方式四：使用TaskService的方法设置
	 */
	@Test
	public void test5() {
		String taskId = "17504";// 流程实例ID
		String variableName = "key4";
		Object value = "value";
		pe.getTaskService().setVariable(taskId, variableName, value);
	}

	/**
	 * 办理任务
	 */
	@Test
	public void test6() {
		String taskId = "35002";
		pe.getTaskService().complete(taskId);
	}

	/**
	 * 设置流程变量方式二：在办理任务时设置 加入对象类型
	 */
	@Test
	public void test7() {
		String taskId = "30006";
		Map<String, Object> variables = new HashMap<String, Object>();
		variables.put("user", new UserInfo(1, "Selina"));
		pe.getTaskService().complete(taskId, variables);

	}

	/**
	 * 获取流程变量方式一：使用RuntimeService的方法来获取
	 */
	@Test
	public void test8() {
		String executionId = "30001";
		Map<String, Object> variables = pe.getRuntimeService().getVariables(executionId);
		// 遍历map集合
		Set<String> set = variables.keySet();
		for (String key : set) {
			Object value = variables.get(key);
			System.out.println(key + " = " + value);
		}
	}

	/**
	 * 获取流程变量方式一：使用TaskService的方法来获取
	 */
	@Test
	public void test9() {
		String taskId = "32505";
		Map<String, Object> variables = pe.getTaskService().getVariables(taskId);
		Set<String> set = variables.keySet();
		for (String key : set) {
			Object value = variables.get(key);
			System.out.println(key + " = " + value);
		}
	}
}
