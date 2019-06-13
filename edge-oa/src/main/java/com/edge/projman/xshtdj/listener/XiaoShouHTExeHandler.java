package com.edge.projman.xshtdj.listener;

import java.util.Map;

import org.activiti.engine.delegate.DelegateExecution;
import org.activiti.engine.delegate.ExecutionListener;
import org.activiti.engine.impl.persistence.entity.VariableInstance;
import org.springframework.context.ApplicationContext;
import org.springframework.web.context.ContextLoader;

import com.edge.projman.xshtdj.entity.XiaoShouHT;
import com.edge.projman.xshtdj.service.inter.XiaoShouHTDJService;

/**
 * 连线监听器，不同意、退回时,设置业务数据的审批状态
 * 
 * @author NingCG
 *
 */
public class XiaoShouHTExeHandler implements ExecutionListener {

	public void notify(DelegateExecution execution) throws Exception {
		Map<String, VariableInstance> variableInstances = execution.getVariableInstances();
		// 取得流程变量中的评审结果
		VariableInstance value = variableInstances.get("outcome");
		String result = value.getTextValue();
		// 取得businessKey
		String key = execution.getBusinessKey();
		// 得到业务数据主键值
		String id = key.substring(key.indexOf(".") + 1);
		// 2.从spring容器中获取xiaoShouHTDJService
		ApplicationContext ac = ContextLoader.getCurrentWebApplicationContext();
		// 获取ApproveprojService接口
		XiaoShouHTDJService xiaoShouHTDJService = (XiaoShouHTDJService) ac.getBean("xiaoShouHtDJServiceImpl");
		// 根据Id获取项目信息对象
		XiaoShouHT xsht = xiaoShouHTDJService.queryXSHTById((Integer.parseInt(id)));
		if(result.equals("退回")) {
			xsht.setAppr_Status(3);
			xsht.setNextCZ("提交申请");
		}else if(result.equals("不同意")) {
			xsht.setAppr_Status(4);
			xsht.setNextCZ("终止");
		}
		xiaoShouHTDJService.editXSHT(xsht);
	}

}
