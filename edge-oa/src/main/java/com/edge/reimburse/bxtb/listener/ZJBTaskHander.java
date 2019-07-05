package com.edge.reimburse.bxtb.listener;

import org.activiti.engine.delegate.DelegateTask;
import org.activiti.engine.delegate.TaskListener;
import org.springframework.context.ApplicationContext;
import org.springframework.web.context.ContextLoader;

import com.edge.reimburse.bxtb.entity.Reimbursement;
import com.edge.reimburse.bxtb.service.inter.ReportService;

/**
 * 设置流程流转至下一节点的用户
 * 
 * @author NingCG
 *
 */
public class ZJBTaskHander implements TaskListener {

	public void notify(DelegateTask delegateTask) {
		// 总经办审核人为高云飞 故这里将变量写死
		String name = delegateTask.getName();
		String businessKey = delegateTask.getExecution().getBusinessKey();
		// 得到业务数据主键值
		String id = businessKey.substring(businessKey.indexOf(".") + 1);
		ApplicationContext ac = ContextLoader.getCurrentWebApplicationContext();
		// 获取ReportService接口
		ReportService reportService = (ReportService) ac.getBean("reportServiceImpl");
		// 根据Id获取报销填报对象
		Reimbursement reimbursement = reportService.queryReimbursementById(Integer.parseInt(id));
		// 设置下一步操作名称
		reimbursement.setNextcz(name);
		reportService.editReimbursement(reimbursement);
		// 获取spring容器
		String userName = "高云飞";
		// 设置个人任务办理人
		delegateTask.setAssignee(userName);

	}

}
