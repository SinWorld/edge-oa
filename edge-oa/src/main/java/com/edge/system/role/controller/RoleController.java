package com.edge.system.role.controller;
/**
 * 角色控制层
 * @author NingCG
 *
 */

import java.util.LinkedHashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.edge.system.role.entity.Role;
import com.edge.system.role.service.inter.PrivilegeService;
import com.edge.system.role.service.inter.RoleServiceInter;
import com.edge.utils.Page;
import com.edge.utils.QueryVo;
import com.google.gson.Gson;

@Controller
@RequestMapping(value = "role")
public class RoleController {
	@Resource
	private RoleServiceInter roleServiceInter;
	@Resource
	private PrivilegeService privilegeService;

	@RequestMapping(value = "/initSaveRole.do")
	public String initSaveRole() {
		return "sys/role/saveRole";
	}

	// 跳转至角色列表页
	@RequestMapping(value = "/initRoleList.do")
	public String initRoleList() {
		return "sys/role/role";
	}

	// 分页查询系统角色
	@RequestMapping(value = "/roleList.do")
	@ResponseBody
	public String roleList(Integer page) {
		// new出QueryVo查询对象
		QueryVo vo = new QueryVo();
		// 获得Page对象
		Page<Role> pages = new Page<Role>();
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		// 每页数
		if (vo != null) {
			pages.setPage((page - 1) * vo.getSize() + 1);
			vo.setPage((page - 1) * vo.getSize() + 1);
			vo.setStartRow((pages.getPage()));
			vo.setSize(page * 10);
		}
		// 总页数
		pages.setTotal(roleServiceInter.queryRoleCount());
		pages.setRows(roleServiceInter.queryRole(vo));
		Gson gson = new Gson();
		map.put("code", 0);
		map.put("msg", "");
		map.put("count", roleServiceInter.queryRoleCount());
		map.put("data", pages.getRows());
		String json = gson.toJson(map);
		return json.toString();
	}

	// 新增用户角色
	@RequestMapping(value = "/saveRole.do")
	public String saveRole(Role role, Model model) {
		role.setIs_delete(false);
		roleServiceInter.saveRole(role);
		boolean flag = true;
		model.addAttribute("flag", flag);
		return "sys/role/saveRole";
	}

	// 打开编辑页面查询角色对象
	@RequestMapping(value = "/initEditRole.do")
	public String initEditRole(@RequestParam Integer roleId, Model model) {
		Role role = roleServiceInter.queryRoleById(roleId);
		model.addAttribute("role", role);
		return "sys/role/editRole";
	}

	// 编辑角色
	@RequestMapping(value = "/editRole.do")
	public String editRole(Role role, Model model) {
		roleServiceInter.editRole(role);
		boolean flag = true;
		model.addAttribute("flag", flag);
		return "sys/role/editRole";
	}

	// 删除角色 逻辑删除
	@RequestMapping(value = "/deleteRole.do")
	public ModelAndView deleteRoleById(@RequestParam Integer roleId, ModelAndView mv) {
		boolean flag = true;
		roleServiceInter.deleteRoleById(roleId, flag);
		// 删除该角色的同时也删除该角色的所有权限(物理删除)
		privilegeService.deleteRolePrivilege(roleId);
		mv.setViewName("redirect:initRoleList.do");
		return mv;
	}

}
