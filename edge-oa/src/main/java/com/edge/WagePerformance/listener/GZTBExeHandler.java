package com.edge.WagePerformance.listener;

import java.util.Map;

import org.activiti.engine.delegate.DelegateExecution;
import org.activiti.engine.delegate.ExecutionListener;
import org.activiti.engine.impl.persistence.entity.VariableInstance;
import org.springframework.context.ApplicationContext;
import org.springframework.web.context.ContextLoader;

import com.edge.WagePerformance.entity.WagePerformance;
import com.edge.WagePerformance.service.inter.WagePerService;

/**
 * 连线监听器，不同意、退回时,设置业务数据的审批状态
 * 
 * @author NingCG
 *
 */
public class GZTBExeHandler implements ExecutionListener {

	public void notify(DelegateExecution execution) throws Exception {
		Map<String, VariableInstance> variableInstances = execution.getVariableInstances();
		// 取得流程变量中的评审结果
		VariableInstance value = variableInstances.get("outcome");
		String result = null;
		if (value != null) {
			result = value.getTextValue();
		}
		// 取得businessKey
		String key = execution.getBusinessKey();
		// 得到业务数据主键值
		String id = key.substring(key.indexOf(".") + 1);
		// 2.从spring容器中获取reportServiceImpl
		ApplicationContext ac = ContextLoader.getCurrentWebApplicationContext();
		// 获取WagePerService接口
		WagePerService wagePerService = (WagePerService) ac.getBean("wagePerServiceImpl");
		// 根据Id获取工资填报对象
		WagePerformance wagePerformance = wagePerService.queryWageById(Integer.parseInt(id.trim()));
		if (result != null) {
			if (result.equals("退回")) {
				wagePerformance.setAppr_Status(3);
				wagePerformance.setNextCz("提交申请");
			}
			if (result.equals("不同意")) {
				wagePerformance.setAppr_Status(4);
				wagePerformance.setNextCz("终止");
			}
			wagePerService.editWage(wagePerformance);
		}
	}

}
