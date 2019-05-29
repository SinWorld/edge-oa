package com.edge.test;

import org.activiti.engine.ProcessEngine;
import org.activiti.engine.ProcessEngineConfiguration;
import org.junit.Test;

public class CreateTable {
	@Test
	public void test() {
		ProcessEngineConfiguration createProcessEngineConfigurationFromResource = ProcessEngineConfiguration
				.createProcessEngineConfigurationFromResource("activiti.cfg.xml");
		// 工作流核心对象 processEngine
		ProcessEngine processEngine = createProcessEngineConfigurationFromResource.buildProcessEngine();
		System.out.println("processEngine" + processEngine);
	}
}
