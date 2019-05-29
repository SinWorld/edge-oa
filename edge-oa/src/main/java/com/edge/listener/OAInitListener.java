package com.edge.listener;

import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import org.springframework.beans.BeansException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.context.ApplicationEvent;
import org.springframework.context.ApplicationListener;
import org.springframework.context.event.ApplicationContextEvent;
import org.springframework.context.event.ContextRefreshedEvent;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.edge.system.role.entity.Privilege;
import com.edge.system.role.service.impl.PrivilegeServiceImpl;
import com.edge.system.role.service.inter.PrivilegeService;

/**
 * 项目启动时加载权限数据的监听器
 * 
 * @author NingCG
 *
 */
public class OAInitListener implements ServletContextListener {

	/**
	 * 初始化方法
	 */
	public void contextInitialized(ServletContextEvent sce) {
		// 1 获取spring容器
		WebApplicationContext applicationContext = WebApplicationContextUtils
				.getWebApplicationContext(sce.getServletContext());
		// 2从spring容器中获取privilegeService
		PrivilegeService service = (PrivilegeService) applicationContext.getBean("privilegeServiceImpl");
		// 3使用service查询顶级权限数据
		List<Privilege> privilegeTopList = service.privilegeTopLists();
		//4.遍历该权限数据查询出其下的子权限数据添加到 Privilege属性集合中
		for (Privilege privilege : privilegeTopList) {
			List<Privilege> childrenLists = service.privilegeChildrenLists(privilege.getPrivilege_id());
			for (Privilege children : childrenLists) {
				privilege.setChildren(children);
			}
			
		}
		// 4将权限数据放入application作用域
		sce.getServletContext().setAttribute("privilegeTopList", privilegeTopList);
		
		System.out.println("权限数据已经放入application作用域了");
	}

	public void contextDestroyed(ServletContextEvent arg0) {

	}

}
