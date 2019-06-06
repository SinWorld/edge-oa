package com.edge.projman.approveproj.listener;

import java.util.Date;

import org.activiti.engine.delegate.DelegateExecution;
import org.activiti.engine.delegate.JavaDelegate;
import org.springframework.context.ApplicationContext;
import org.springframework.web.context.ContextLoader;

import com.edge.projman.approveproj.entity.Foll_up_Proj;
import com.edge.projman.approveproj.service.inter.ApproveprojService;
/**
 * 流程结束监听事件用于更新业务数据审批状态
 * @author NingCG
 *
 */
public class XiangMuLXEventHandler implements JavaDelegate {

	public void execute(DelegateExecution execution) throws Exception {
		// 取得businessKey
		String key = execution.getBusinessKey();
		// 得到业务数据主键值
		String id = key.substring(key.indexOf(".") + 1);
		// 2.从spring容器中获取UserServiceImpl
		ApplicationContext ac = ContextLoader.getCurrentWebApplicationContext();
		//获取ApproveprojService接口
		ApproveprojService approveprojService = (ApproveprojService) ac.getBean("approveprojServiceImpl");
		//根据Id获取项目信息对象
		Foll_up_Proj XMXX = approveprojService.queryXiangMuXXById(Integer.parseInt(id));
		//设置该对象审批状态为完成（1:完成,2:运行中,3:退回,4:作废）
		XMXX.setAppr_Status(1);
		XMXX.setIS_TY(true);
		XMXX.setFinish_Time(new Date());
		XMXX.setNextCZ("结束");;
		approveprojService.editXiangMuXX(XMXX);
	}

}
