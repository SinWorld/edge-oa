package com.edge.reimburse.bxtb.listener;

import java.util.Map;

import org.activiti.engine.delegate.DelegateExecution;
import org.activiti.engine.delegate.ExecutionListener;
import org.activiti.engine.impl.persistence.entity.VariableInstance;
import org.springframework.context.ApplicationContext;
import org.springframework.web.context.ContextLoader;

import com.edge.reimburse.bxtb.entity.Reimbursement;
import com.edge.reimburse.bxtb.service.inter.ReportService;

/**
 * 连线监听器，不同意、退回时,设置业务数据的审批状态
 * 
 * @author NingCG
 *
 */
public class BXTBExeHandler implements ExecutionListener {

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
		// 获取ReportService接口
		ReportService reportService = (ReportService) ac.getBean("reportServiceImpl");
		// 根据Id获取报销填报对象
		Reimbursement reimbursement = reportService.queryReimbursementById(Integer.parseInt(id.trim()));
		if (result != null) {
			if (result.equals("退回")) {
				reimbursement.setAppr_status(3);
				reimbursement.setNextcz("提交申请");
			}
			if (result.equals("不同意")) {
				reimbursement.setAppr_status(4);
				reimbursement.setNextcz("终止");
			}
			reportService.editReimbursement(reimbursement);
		}
	}

}
