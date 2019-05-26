package com.edge.login.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.edge.login.dao.LoginDao;
import com.edge.login.service.inter.LoginService;
import com.edge.system.user.entity.User;

@Service
public class LoginServiceImpl implements LoginService {
	@Resource
	private LoginDao loginDao;

	// 登录时根据用户名、密码去校验用户
	public User checkUser(String loginName, String password) {
		return loginDao.checkUser(loginName, password);
	}

}
