package com.edge.projman.approveproj.listener;

import java.util.Date;
import java.util.Map;

import org.activiti.engine.delegate.DelegateExecution;
import org.activiti.engine.delegate.ExecutionListener;
import org.activiti.engine.impl.persistence.entity.VariableInstance;
import org.springframework.context.ApplicationContext;
import org.springframework.web.context.ContextLoader;

import com.edge.projman.approveproj.entity.Foll_up_Proj;
import com.edge.projman.approveproj.service.inter.ApproveprojService;

/**
 * 连线监听器，不同意、退回时,设置业务数据的审批状态
 * 
 * @author NingCG
 *
 */
public class XiangMuXXExeHandler implements ExecutionListener {

	public void notify(DelegateExecution execution) throws Exception {
		Map<String, VariableInstance> variableInstances = execution.getVariableInstances();
		// 取得流程变量中的评审结果
		VariableInstance value = variableInstances.get("outcome");
		String result = value.getTextValue();
		// 取得businessKey
		String key = execution.getBusinessKey();
		// 得到业务数据主键值
		String id = key.substring(key.indexOf(".") + 1);
		// 2.从spring容器中获取UserServiceImpl
		ApplicationContext ac = ContextLoader.getCurrentWebApplicationContext();
		// 获取ApproveprojService接口
		ApproveprojService approveprojService = (ApproveprojService) ac.getBean("approveprojServiceImpl");
		// 根据Id获取项目信息对象
		Foll_up_Proj XMXX = approveprojService.queryXiangMuXXById(Integer.parseInt(id));
		if(result.equals("退回")) {
			XMXX.setAppr_Status(3);
			XMXX.setNextCZ("提交申请");
		}else if(result.equals("不同意")) {
			XMXX.setAppr_Status(4);
			XMXX.setNextCZ("终止");
		}
		approveprojService.editXiangMuXX(XMXX);
	}

}
