package com.edge.test.activiti.listener.task;

import java.util.Set;

import org.activiti.engine.delegate.DelegateTask;
import org.activiti.engine.delegate.TaskListener;

/**
 * 自定义任务监听器
 * 
 * @author NingCG
 *
 */
public class MyTaskListener implements TaskListener {
	// 监听任务事件
	public void notify(DelegateTask delegateTask) {
		String assignee = delegateTask.getAssignee();
		String eventName = delegateTask.getEventName();
		String name = delegateTask.getName();
		String processInstanceId = delegateTask.getProcessInstanceId();
		Set<String> variableNames = delegateTask.getVariableNames();
		for (String key : variableNames) {
			Object value = delegateTask.getVariable(key);
			System.out.println(key + " = " + value);
		}
		System.out.println("一个任务[" + name + "]被创建了，由[" + assignee + "]负责办理");
	}
}
