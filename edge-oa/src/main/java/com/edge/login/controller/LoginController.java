package com.edge.login.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSONObject;
import com.edge.login.service.inter.LoginService;
import com.edge.system.user.entity.User;

/**
 * 登录控制层
 * 
 * @author NingCG
 *
 */
@Controller
@RequestMapping(value = "login")
public class LoginController {
	@Resource
	private LoginService loginService;

	// 跳转至登录页
	@RequestMapping(value = "/initLogin.do")
	public String initLogin() {
		return "login/login";
	}

	// 用户登陆
	@RequestMapping(value = "/doLogin.do", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String doLogin(@RequestParam String loginName, String password, HttpServletRequest request) {
		// new出JSONObject对象
		JSONObject jsonObject = new JSONObject();
		// 得到session
		HttpSession session = request.getSession();
		if (loginName != null && password != null) {
			User user = loginService.checkUser(loginName.trim(), password.trim());
			// 查询到了该用户，用户名密码正确
			if (user != null) {
				if (user.getUser_is_delete() == false) {
					// 跳转至index首页，并将用户名、用户主键存入session
					session.setAttribute("userName", user.getUser_name());
					session.setAttribute("userId", user.getUser_id());
					jsonObject.put("flag", "success");
					return jsonObject.toString();
				} else {
					// 当前用户已被禁用
					jsonObject.put("flag", "inforMation");
					return jsonObject.toString();
				}
			} else {
				// 说明无该用户，用户名或密码错误回转至登录页，并给出提示
				jsonObject.put("flag", "fail");
				return jsonObject.toString();
			}
		} else {
			return null;
		}
	}

	// 退出系统
	@RequestMapping(value = "/exit.do")
	public ModelAndView exit(HttpServletRequest request, ModelAndView mv) {
		HttpSession session = request.getSession();
		// 清除session
		session.invalidate();
		mv.setViewName("redirect:initLogin.do");
		return mv;
	}

}
