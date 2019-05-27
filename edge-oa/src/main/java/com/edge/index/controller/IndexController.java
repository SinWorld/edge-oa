package com.edge.index.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.alibaba.fastjson.JSONArray;
import com.edge.index.service.inter.IndexService;
import com.edge.system.role.entity.Privilege;
import com.edge.system.user.entity.User;
import com.edge.system.user.service.inter.UserService;

@Controller
@RequestMapping(value = "index")
public class IndexController {
	@Resource
	private IndexService indexService;
	@Resource
	private UserService userService;

	// 跳转至登录首页
	@RequestMapping(value = "/index.do")
	public String index(HttpServletRequest request, Model model) {
		// 从request作用域中得到session
		HttpSession session = request.getSession();
		// 从session中得到当前登录用户的主键
		Integer userId = (Integer) session.getAttribute("userId");
		// 通过用户主键查询用户
		User user = userService.queryUserById(userId);
		if ("admin".equals(user.getUser_login_name())) {
			return "index/index";
		} else {
			this.userAllPrivilege(userId, model, session);
			return "index/index";
		}

	}

	// 用户登录系统查询当前用户所拥有的权限
	public void userAllPrivilege(Integer userId, Model model, HttpSession session) {
		// 查询当前登录用户的所有顶级权限权限
		List<Privilege> userPrivilegeList = indexService.userPrivilegeList(userId);
		// new出JSONArry对象用于存储所有的三级权限
		JSONArray jsonArray = new JSONArray();
		// 遍历顶级权限集合
		// 查询当前登录用户的所有顶级权限下的二级子权限
		for (Privilege privilege : userPrivilegeList) {
			List<Privilege> ejChildrenList = indexService.ejChildrenList(userId, privilege.getPrivilege_id());
			// 遍历二级子权限集合 将二级子权限添加到权限对象的set集合中
			for (Privilege ej : ejChildrenList) {
				privilege.setChildren(ej);
				// 得到用户二级下所有的三级权限
				List<Privilege> sjChildrenList = indexService.ejChildrenList(userId, ej.getPrivilege_id());
				// 遍历所有的三级权限添加到JSONArray数组中
				for (Privilege sjqx : sjChildrenList) {
					jsonArray.add(sjqx);
				}
			}
		}
		// 将三级权限存入session中
		session.setAttribute("sjqxs", jsonArray.toString().trim());
		model.addAttribute("privilegeTopList", userPrivilegeList);

	}

}
