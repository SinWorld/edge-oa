package com.edge.WagePerformance.listener;

import org.activiti.engine.delegate.DelegateExecution;
import org.activiti.engine.delegate.JavaDelegate;
import org.springframework.context.ApplicationContext;
import org.springframework.web.context.ContextLoader;

import com.edge.WagePerformance.entity.WagePerformance;
import com.edge.WagePerformance.service.inter.WagePerService;

/**
 * 流程结束监听事件用于更新业务数据审批状态
 * 
 * @author NingCG
 *
 */
public class GZTBEventHandler implements JavaDelegate {

	public void execute(DelegateExecution execution) throws Exception {
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
		// 设置该对象审批状态为完成（1:完成,2:运行中,3:退回,4:作废）
		wagePerformance.setAppr_Status(1);
		wagePerformance.setNextCz("结束");
		wagePerformance.setIs_ffdj(true);// 是否发放登记
		wagePerService.editWage(wagePerformance);
	}

}
