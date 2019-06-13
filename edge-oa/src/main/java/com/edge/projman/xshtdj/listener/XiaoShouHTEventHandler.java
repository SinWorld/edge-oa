package com.edge.projman.xshtdj.listener;

import org.activiti.engine.delegate.DelegateExecution;
import org.activiti.engine.delegate.JavaDelegate;
import org.springframework.context.ApplicationContext;
import org.springframework.web.context.ContextLoader;

import com.edge.projman.xshtdj.entity.XiaoShouHT;
import com.edge.projman.xshtdj.service.inter.XiaoShouHTDJService;
/**
 * 流程结束监听事件用于更新业务数据审批状态
 * @author NingCG
 *
 */
public class XiaoShouHTEventHandler implements JavaDelegate {

	public void execute(DelegateExecution execution) throws Exception {
		// 取得businessKey
		String key = execution.getBusinessKey();
		// 得到业务数据主键值
		String id = key.substring(key.indexOf(".") + 1);
		// 2.从spring容器中获取UserServiceImpl
		ApplicationContext ac = ContextLoader.getCurrentWebApplicationContext();
		//获取xiaoShouHTDJService接口
		XiaoShouHTDJService xiaoShouHTDJService = (XiaoShouHTDJService) ac.getBean("xiaoShouHtDJServiceImpl");
		//根据Id获取销售合同对象
		XiaoShouHT xsht = xiaoShouHTDJService.queryXSHTById(Integer.parseInt(id));
		//设置该对象审批状态为完成（1:完成,2:运行中,3:退回,4:作废）
		xsht.setAppr_Status(1);
		xsht.setNextCZ("结束");
		xsht.setCheck_Flag(true);//审核标识（0：未审核，1：已审核）
		xiaoShouHTDJService.editXSHT(xsht);
	}

}
