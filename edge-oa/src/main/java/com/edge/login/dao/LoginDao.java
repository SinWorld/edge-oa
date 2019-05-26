package com.edge.login.dao;

import org.apache.ibatis.annotations.Param;

import com.edge.system.user.entity.User;

public interface LoginDao {
	// 登录时根据用户名、密码去校验用户
	public User checkUser(@Param("loginName") String loginName, @Param("password") String password);
}
