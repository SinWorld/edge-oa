package com.edge.system.user.controller;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONArray;
import com.edge.system.role.service.inter.RoleServiceInter;
import com.edge.system.user.entity.UserRole;
import com.edge.system.user.service.inter.UserRoleService;

/**
 * 用户角色控制层
 * 
 * @author NingCG
 *
 */
@Controller
@RequestMapping(value = "userRole")
public class UserRoleController {
	@Resource
	private UserRoleService userRoleService;
	@Resource
	private RoleServiceInter roleServiceInter;

	// 为用户授予角色
	@RequestMapping(value = "/setUserRole.do")
	public String setUserRole(@RequestParam String selectId, String userId, Model model) {
		// 将角色字符串转为数组
		String roleIds[] = selectId.split(",");
		// 当前是授予了角色
		int hashCode = selectId.hashCode();
		// 1.查询该用户有无该角色的
		List<UserRole> userRoleList = userRoleService.userRoleList(Integer.parseInt(userId.trim()));
		// 2.若有则将该用户的所有的角色清除，重新添加
		if (userRoleList.size() > 0 && null != userRoleList) {
			userRoleService.deleteUserRole(Integer.parseInt(userId.trim()));
			if (hashCode != 0) {
				// 遍历该数组
				for (String id : roleIds) {
					// new出UserRole对象
					UserRole userRole = new UserRole();
					// 设置其属性
					userRole.setRole_id(Integer.parseInt(id.trim()));
					userRole.setUser_id(Integer.parseInt(userId.trim()));
					userRoleService.saveUserRole(userRole);
				}
			}
		} else {
			if (hashCode != 0) {
				// 3.若无则直接添加
				// 遍历该数组
				for (String id : roleIds) {
					// new出UserRole对象
					UserRole userRole = new UserRole();
					// 设置其属性
					userRole.setRole_id(Integer.parseInt(id.trim()));
					userRole.setUser_id(Integer.parseInt(userId.trim()));
					userRoleService.saveUserRole(userRole);
				}
			}
		}
		model.addAttribute("flag", true);
		return "sys/user/setRoleList";
	}

	// 查询当前用户的所有角色
	@RequestMapping(value = "/checkedUserRole.do", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String checkedUserRole(@RequestParam Integer userId) {
		// 根据用户主键去查询用户的所有角色
		List<UserRole> userRoleList = userRoleService.userRoleList(userId);
		// new出JSONArray数组对象
		JSONArray jsonArray = new JSONArray();
		// 遍历该集合
		for (UserRole userRole : userRoleList) {
			// new出Map集合
			Map<String, Integer> map = new LinkedHashMap<String, Integer>();
			// 向集合中添加角色主键
			map.put("roleId", userRole.getRole_id());
			jsonArray.add(map);
		}
		return jsonArray.toString();
	}
}
