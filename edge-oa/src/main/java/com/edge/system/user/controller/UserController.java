package com.edge.system.user.controller;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.mail.MessagingException;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.edge.system.department.entity.Department;
import com.edge.system.department.service.inter.DepartmentService;
import com.edge.system.user.entity.User;
import com.edge.system.user.service.inter.UserRoleService;
import com.edge.system.user.service.inter.UserService;
import com.edge.utils.EmailUtil;
import com.edge.utils.Page;
import com.edge.utils.QueryVo;
import com.google.gson.Gson;

/**
 * 用户控制层
 * 
 * @author NingCG
 *
 */
@Controller
@RequestMapping(value = "user")
public class UserController {

	@Resource
	private UserService userService;

	@Resource
	private DepartmentService departmentService;
	
	@Resource
	private UserRoleService userRoleService;

	// 跳转至用户列表页
	@RequestMapping(value = "initUserList.do")
	public String initUserList() {
		return "sys/user/userList";
	}

	// 跳转至用户新增页面
	@RequestMapping(value = "/initSaveUser.do")
	public String initSaveUser() {
		return "sys/user/saveUser";
	}

	// 新增用户
	@RequestMapping(value = "/saveUser.do")
	public String saveUser(User user, Model model) {
		user.setUser_is_delete(false);
		userService.saveUser(user);
		model.addAttribute("flag", true);
		return "sys/user/saveUser";
	}

	// 分页查询系统用户
	@RequestMapping(value = "/userList.do")
	@ResponseBody
	public String roleList(Integer page) {
		// new出QueryVo查询对象
		QueryVo vo = new QueryVo();
		// 获得Page对象
		Page<User> pages = new Page<User>();
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		// 每页数
		if (vo != null) {
			pages.setPage((page - 1) * vo.getSize() + 1);
			vo.setPage((page - 1) * vo.getSize() + 1);
			vo.setStartRow((pages.getPage()));
			vo.setSize(page * 10);
		}
		// 总页数
		pages.setTotal(userService.queryUserCount());
		pages.setRows(userService.userList(vo));
		Gson gson = new Gson();
		map.put("code", 0);
		map.put("msg", "");
		map.put("count", userService.queryUserCount());
		List<User> rows = pages.getRows();
		//用于拼接角色名
		String role_Name="";
		// 遍历该集合 显示所属部门名称
		for (User user : rows) {
			// 根据部门id去查询部门名称
			Department department = departmentService.queryDepartmentById(user.getUser_department_id());
			user.setUser_department_name(department.getDep_name());
			//查询当前用户的所有角色名
			List<String> roleNames = userService.userRoleNames(user.getUser_id());
			//遍历角色名集合
			for (String roleName : roleNames) {
				role_Name+=roleName.trim()+" ";
			}
			//设置用户的角色名
			user.setUserRoleName(role_Name);
		}
		map.put("data", pages.getRows());
		String json = gson.toJson(map);
		return json.toString();
	}

	// 初始化用户编辑页面
	@RequestMapping(value = "/initEditUser.do")
	public String initEditUser(@RequestParam Integer user_id, Model model) {
		// 根据Id去查询当前用户
		User user = userService.queryUserById(user_id);
		// 根据部门id去查询部门名称
		Department department = departmentService.queryDepartmentById(user.getUser_department_id());
		user.setUser_department_name(department.getDep_name());
		model.addAttribute("user", user);
		return "sys/user/editUser";
	}

	// 编辑用户
	@RequestMapping(value = "/editUser.do")
	public String editUser(User user, Model model) {
		// 根据部门id去查询部门名称
		Department department = departmentService.queryDepartmentById(user.getUser_department_id());
		user.setUser_department_name(department.getDep_name());
		userService.editUser(user);
		model.addAttribute("flag", true);
		return "sys/user/editUser";
	}

	// 删除用户(逻辑删除)
	@RequestMapping(value = "/deleteUser.do")
	public ModelAndView deleteUser(@RequestParam Integer user_id, ModelAndView mv) {
		// 根据Id查询用户
		User user = userService.queryUserById(user_id);
		user.setUser_is_delete(true);
		userService.editUser(user);
		//删除该用户的同时也删除该用户的所有角色
		userRoleService.deleteUserRole(user_id);
		mv.setViewName("redirect:initUserList.do");
		return mv;
	}

	// 重置密码发送邮件通知
	@RequestMapping(value = "/resertPassword.do", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String sendMessage(@RequestParam Integer user_id) {
		JSONObject jsonObject = new JSONObject();
		// 根据Id查询用户
		User user = userService.queryUserById(user_id);
		String resertPassword = "重置密码";
		String newPassword = "000000";
		String text = "<h4>尊敬的用户" + user.getUser_name() + ":<h4>" + "<p>您好！</p>"
				+ "<p>您当前的密码已被管理员重置为:<span style='color:red;' font-size:20px;>" + newPassword.trim() + "</span></p>"
				+ "<p>您可输入以上密码登录内网OA去修改密码。</p>" + "<p></p>"
				+ "<hr style=\" height:2px;border:none;border-top:2px;width:250px;text-align:left;margin-left:0\" />"
				+ "<p></p>" + "<p>12121</p>" + "<p>网址：12121</p>" + "<p>电话：12331231</p>";
		try {
			EmailUtil.sendMessage(user.getUser_email(), resertPassword, text);
		} catch (MessagingException e) {
			e.printStackTrace();
		}
		user.setUser_password(newPassword.trim());
		userService.editUser(user);
		jsonObject.put("flag", "success");
		return jsonObject.toString();
	}

	// 跳转至角色设置页面
	@RequestMapping(value = "/initSetRole.do")
	public String initSetRole(@RequestParam Integer user_id, Model model) {
		model.addAttribute("user_id", user_id);
		return "sys/user/setRoleList";
	}
}
