package com.edge.system.role.controller;

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
import com.edge.system.role.entity.Privilege;
import com.edge.system.role.entity.Role;
import com.edge.system.role.entity.Role_Privilege;
import com.edge.system.role.service.inter.PrivilegeService;
import com.edge.system.role.service.inter.RoleServiceInter;

/**
 * 权限控制层
 * 
 * @author NingCG
 *
 */
@Controller
@RequestMapping(value = "privilege")
public class PrivilegeController {
	@Resource
	private PrivilegeService privilegeService;
	@Resource
	private RoleServiceInter roleServiceInter;

	// 跳转至权限列表页面
	@RequestMapping(value = "/initPrivilegeList.do")
	public String initPrivilege(@RequestParam Integer roleId, Model model) {
		// 根据Id查询该角色
		Role role = roleServiceInter.queryRoleById(roleId);
		model.addAttribute("roleName", role.getRole_name());
		model.addAttribute("roleId", role.getRole_id());
		return "sys/role/privilegeList";
	}

	// 初始化权限数据
	@RequestMapping(value = "/rivilegeList.do", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String privilege() {
		// new出JSONArray数组存储顶级权限
		JSONArray jsonArray = new JSONArray();
		// 得到所有的顶级权限
		List<Privilege> trees = privilegeService.privilegeTopLists();
		// 遍历所有顶级权限集合
		for (Privilege tree : trees) {
			// new出map集合
			Map<String, Object> map = new LinkedHashMap<String, Object>();
			// new出JSONArray数组存储二级权限
			JSONArray jsonArrays = new JSONArray();
			// 向map中添加元素
			map.put("id", tree.getPrivilege_id());
			map.put("text", tree.getPrivilege_name());
			map.put("state", "open");
			// 查询当前权限的二级权限
			List<Privilege> childrenTrees = privilegeService.privilegeChildrenLists(tree.getPrivilege_id());
			// 遍历当前二级权限
			for (Privilege treePrivilege : childrenTrees) {
				// new出map集合
				Map<String, Object> childrenMap = new LinkedHashMap<String, Object>();
				// new出JSONArray数组存储三级权限
				JSONArray sunJsonArray = new JSONArray();
				// 向map中添加元素
				childrenMap.put("id", treePrivilege.getPrivilege_id());
				childrenMap.put("text", treePrivilege.getPrivilege_name());
				childrenMap.put("state", "open");
				jsonArrays.add(childrenMap);
				// 查询当前权限的三级权限
				List<Privilege> sanjiQX = privilegeService.privilegeChildrenLists(treePrivilege.getPrivilege_id());
				// 遍历三级权限
				for (Privilege sjqx : sanjiQX) {
					// new出map集合
					Map<String, Object> sjMap = new LinkedHashMap<String, Object>();
					// 向map中添加元素
					sjMap.put("id", sjqx.getPrivilege_id());
					sjMap.put("text", sjqx.getPrivilege_name());
					sjMap.put("state", "open");
					sunJsonArray.add(sjMap);
				}
				childrenMap.put("children", sunJsonArray);
				map.put("children", jsonArrays);
			}
			jsonArray.add(map);
		}
		return jsonArray.toJSONString();
	}

	// 设置权限
	@RequestMapping(value = "/setPrivilegeUI.do")
	public String setPrivilege(@RequestParam String selectId, String roleId, Model model) {
		// 得到功能数组
		String selectIds[] = selectId.split(",");
		//当前是否配置了权限
		int hashCode = selectId.hashCode();
		// 1.查询该角色有无该功能的权限
		List<Role_Privilege> rolePrivilegeList = privilegeService.rolePrivilegeLists(Integer.parseInt(roleId.trim()));
		// 2.若有则将该角色的所有的功能权限清楚，重新添加
		if (rolePrivilegeList.size() > 0 && null != rolePrivilegeList) {
			privilegeService.deleteRolePrivileges(Integer.parseInt(roleId.trim()));
			if(hashCode!=0) {
				// 遍历该数组
				for (String id : selectIds) {
					// new出Role_Privilege对象
					Role_Privilege role_Privilege = new Role_Privilege();
					// 设置其属性
					role_Privilege.setPrivilege_Id(Integer.parseInt(id.trim()));
					role_Privilege.setRole_Id(Integer.parseInt(roleId.trim()));
					privilegeService.saveRolePrivileges(role_Privilege);
				}
			}	
		} else {
			if(hashCode!=0) {
				// 3.若无则直接添加
				for (String id : selectIds) {
					// new出Role_Privilege对象
					Role_Privilege role_Privilege = new Role_Privilege();
					// 设置其属性
					role_Privilege.setPrivilege_Id(Integer.parseInt(id.trim()));
					role_Privilege.setRole_Id(Integer.parseInt(roleId.trim()));
					privilegeService.saveRolePrivileges(role_Privilege);
				}
			}
		}
		model.addAttribute("flag", true);
		return "sys/role/privilegeList";
	}

	// 当某个角色已勾选功能时页面加载时自动勾选所选中的功能数据
	@RequestMapping(value = "/defaultPrivilege.do", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String defaultPrivilege(@RequestParam Integer roleId) {
		// new出JSONArray数组对象
		JSONArray jsonArray = new JSONArray();
		// 根据角色主键去查询该角色所有的权限集合
		List<Role_Privilege> rolePrivilegeList = privilegeService.rolePrivilegeLists(roleId);
		//遍历该集合将对象添加到JSONArray数组中
		for (Role_Privilege role_Privilege : rolePrivilegeList) {
			jsonArray.add(role_Privilege);
		}
		return jsonArray.toString();

	}

}
