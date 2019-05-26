package com.edge.login.service.inter;

import com.edge.system.user.entity.User;

public interface LoginService {
	// 登录时根据用户名、密码去校验用户
	public User checkUser(String loginName, String password);

}
