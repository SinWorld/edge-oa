package com.edge.projman.approveproj.listener;

import org.activiti.engine.delegate.DelegateTask;
import org.activiti.engine.delegate.TaskListener;
import org.springframework.context.ApplicationContext;
import org.springframework.web.context.ContextLoader;

import com.edge.projman.approveproj.entity.Foll_up_Proj;
import com.edge.projman.approveproj.service.inter.ApproveprojService;

/**
 * 设置流程流转至下一节点的用户
 * 
 * @author NingCG
 *
 */
public class XiangMuLXTaskHandler implements TaskListener {

	public void notify(DelegateTask delegateTask) {
		// 总经办审核人为高云飞 故这里将变量写死
		String name = delegateTask.getName();
		String businessKey = delegateTask.getExecution().getBusinessKey();
		// 得到业务数据主键值
		String id = businessKey.substring(businessKey.indexOf(".") + 1);
		ApplicationContext ac = ContextLoader.getCurrentWebApplicationContext();
		// 获取ApproveprojService接口
		ApproveprojService approveprojService = (ApproveprojService) ac.getBean("approveprojServiceImpl");
		//根据Id获取项目信息对象
		Foll_up_Proj xmxx = approveprojService.queryXiangMuXXById(Integer.parseInt(id));
		//设置下一步操作名称
		xmxx.setNextCZ(name);
		approveprojService.editXiangMuXX(xmxx);
		// 获取spring容器
		String userName = "高云飞";
		// 设置个人任务办理人
		delegateTask.setAssignee(userName);
	}

}
