package com.edge.system.user.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.alibaba.fastjson.JSONArray;
import com.edge.system.user.dao.UserDao;
import com.edge.system.user.entity.User;
import com.edge.system.user.entity.User_DM_Posittion;
import com.edge.system.user.service.inter.UserService;
import com.edge.utils.QueryVo;

@Service
public class UserServiceImpl implements UserService {
	@Resource
	private UserDao userDao;

	// 新增用户
	public void saveUser(User user) {
		userDao.saveUser(user);
	}

	// 分页显示用户列表
	public List<User> userList(QueryVo vo) {
		return userDao.userList(vo);
	}

	// 显示用户数量
	public Integer queryUserCount() {
		return userDao.queryUserCount();
	}

	// 根据Id查询当前用户
	public User queryUserById(Integer user_id) {
		return userDao.queryUserById(user_id);
	}

	// 编辑用户
	public void editUser(User user) {
		userDao.editUser(user);
	}

	// 查询用户列表中所有的用户对应的角色
	public List<String> userRoleNames(Integer user_id) {
		return userDao.userRoleNames(user_id);
	}

	// 加载所有的岗位
	public JSONArray queryAllPosittion() {
		return userDao.queryAllPosittion();
	}

	// 根据id加载所属岗位
	public User_DM_Posittion queryPosittionById(Integer posittion_dm) {
		return userDao.queryPosittionById(posittion_dm);
	}

}
