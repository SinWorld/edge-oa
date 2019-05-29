package com.edge.test.activiti.listener.execution;

import org.activiti.engine.delegate.DelegateExecution;
import org.activiti.engine.delegate.ExecutionListener;
import org.activiti.engine.runtime.ProcessInstance;
import org.junit.Test;

/**
 * 自定义一个执行监听器
 * 
 * @author NingCG
 *
 */
public class MyExecutionListener implements ExecutionListener {
	// 当监听的时间执行时执行此方法
	public void notify(DelegateExecution execution) throws Exception {
		System.out.println("自定义的监听器执行了。。。1");
	}
	
}
