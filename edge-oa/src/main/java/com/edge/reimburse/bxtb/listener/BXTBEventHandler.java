package com.edge.reimburse.bxtb.listener;

import java.util.Date;

import org.activiti.engine.delegate.DelegateExecution;
import org.activiti.engine.delegate.JavaDelegate;
import org.springframework.context.ApplicationContext;
import org.springframework.web.context.ContextLoader;

import com.edge.reimburse.bxtb.entity.Reimbursement;
import com.edge.reimburse.bxtb.service.inter.ReportService;

/**
 * 流程结束监听事件用于更新业务数据审批状态
 * 
 * @author NingCG
 *
 */
public class BXTBEventHandler implements JavaDelegate {

	public void execute(DelegateExecution execution) throws Exception {
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
		// 设置该对象审批状态为完成（1:完成,2:运行中,3:退回,4:作废）
		reimbursement.setAppr_status(1);
		reimbursement.setFinish_time(new Date());
		reimbursement.setNextcz("结束");
		reimbursement.setIs_ffdj(true);//是否发放登记
		reportService.editReimbursement(reimbursement);
	}

}
