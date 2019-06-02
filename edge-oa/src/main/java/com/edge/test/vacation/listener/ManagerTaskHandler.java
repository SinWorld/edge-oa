package com.edge.test.vacation.listener;

import java.util.List;

import javax.annotation.Resource;
import javax.mail.Session;
import javax.servlet.ServletContextEvent;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.activiti.engine.delegate.DelegateExecution;
import org.activiti.engine.delegate.DelegateTask;
import org.activiti.engine.delegate.TaskListener;
import org.activiti.engine.impl.persistence.entity.ExecutionEntity;
import org.activiti.engine.impl.persistence.entity.IdentityLinkEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.web.context.ContextLoader;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.edge.system.user.entity.User;
import com.edge.system.user.service.inter.UserService;

/**
 * 设置流程流转至下一节点的用户
 * 
 * @author NingCG
 *
 */
public class ManagerTaskHandler implements TaskListener {

	public void notify(DelegateTask delegateTask) {
		// 1.从session中获取当前用户主键
		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes())
				.getRequest();
		HttpSession session = request.getSession();
		Integer userId = (Integer) session.getAttribute("userId");
		// 2.从spring容器中获取UserServiceImpl
		ApplicationContext ac = ContextLoader.getCurrentWebApplicationContext();
		UserService userService = (UserService) ac.getBean("userServiceImpl");
		// 3.调用userService 获取根据用户主键得到用户
		User user = userService.queryUserById(userId);
		// 4.得到改用户上级领导主键
		Integer leaderId = user.getUser_leader();
		// 5.得到领导对象的用户名
		String userName = userService.queryUserById(leaderId).getUser_name();
		// 设置个人任务办理人
		delegateTask.setAssignee(userName);
	}

}
