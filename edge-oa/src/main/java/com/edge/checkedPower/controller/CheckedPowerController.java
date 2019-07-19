package com.edge.checkedPower.controller;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;
import com.edge.checkedPower.service.inter.CheckedPowerService;
import com.edge.system.role.entity.Privilege;

/**
 * 权限控制跳转层
 * 
 * @author NingCG
 *
 */
@Controller
@RequestMapping(value = "checkPower")
public class CheckedPowerController {
	@Resource
	private CheckedPowerService checkedPowerService;
	@Resource
	private HttpServletRequest request;

	// 查询用户的所有角色
	private List<Integer> queryRoleIdByUserId() {
		HttpSession session = request.getSession();
		Integer userId = (Integer) session.getAttribute("userId");
		// 根据当前用户的主键查询所有的角色主键
		List<Integer> roleIds = checkedPowerService.queryRoleByUser(userId);
		return roleIds;
	}

	// 查询该角色下所有的权限集合代码
	private Set<Integer> queryPrivilegeByRoleId() {
		List<Integer> roleIds = this.queryRoleIdByUserId();
		// new出Set集合
		Set<Integer> set = new HashSet<Integer>();
		// 遍历该集合
		for (Integer roleId : roleIds) {
			// 通过角色主键去查询所属的功能权限
			List<Integer> privileges = checkedPowerService.queryPrivilegeByRole(roleId);
			// 将该权限主键添加到set集合中
			for (Integer privilege : privileges) {
				set.add(privilege);
			}
		}
		return set;
	}

	// ajax 验证权限集合
	@RequestMapping(value = "/checkPower.do")
	@ResponseBody
	public String checkPower(@RequestParam String url) {
		// 得到当前角色所有的功能权限代码集合
		Set<Integer> privileges = this.queryPrivilegeByRoleId();
		// new出JSONObject对象
		JSONObject jsonObject = new JSONObject();
		boolean kg = false;
		// 遍历该集合
		for (Integer p : privileges) {
			// 通过该集合代码查询所属权限对象
			Privilege privilege = checkedPowerService.queryPrivilegeById(p);
			// 判断该对象的url是否与参数一致
			// 1.若一致，则说明有该权限放行，终结循环
			// 2.若无，则给出提示
			if(privilege.getPrivilege_url()!=null) {
				if (url.equals(privilege.getPrivilege_url())) {
					kg = true;
					break;
				}
			}
		}
		if (kg) {
			jsonObject.put("flag", true);
		} else {
			jsonObject.put("flag", false);
		}
		return jsonObject.toString();
	}
}
