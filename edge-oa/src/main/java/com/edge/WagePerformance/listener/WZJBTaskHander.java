package com.edge.WagePerformance.listener;

import org.activiti.engine.delegate.DelegateTask;
import org.activiti.engine.delegate.TaskListener;
import org.springframework.context.ApplicationContext;
import org.springframework.web.context.ContextLoader;

import com.edge.WagePerformance.entity.WagePerformance;
import com.edge.WagePerformance.service.inter.WagePerService;

/**
 * 设置流程流转至下一节点的用户
 * 
 * @author NingCG
 *
 */
public class WZJBTaskHander implements TaskListener {

	public void notify(DelegateTask delegateTask) {
		// 总经办审核人为高云飞 故这里将变量写死
		String name = delegateTask.getName();
		String businessKey = delegateTask.getExecution().getBusinessKey();
		// 得到业务数据主键值
		String id = businessKey.substring(businessKey.indexOf(".") + 1);
		ApplicationContext ac = ContextLoader.getCurrentWebApplicationContext();
		// 获取WagePerService接口
		WagePerService wagePerService = (WagePerService) ac.getBean("wagePerServiceImpl");
		// 根据Id获取工资填报对象
		WagePerformance wagePerformance = wagePerService.queryWageById(Integer.parseInt(id.trim()));
		// 设置下一步操作名称
		wagePerformance.setNextCz(name);
		wagePerService.editWage(wagePerformance);
		// 获取spring容器
		String userName = "高云飞";
		// 设置个人任务办理人
		delegateTask.setAssignee(userName);

	}

}
