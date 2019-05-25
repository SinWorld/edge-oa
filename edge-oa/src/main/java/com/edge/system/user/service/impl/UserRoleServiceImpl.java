package com.edge.system.user.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;

import com.edge.system.user.dao.UserRoleDao;
import com.edge.system.user.entity.UserRole;
import com.edge.system.user.service.inter.UserRoleService;

@Service
public class UserRoleServiceImpl implements UserRoleService {
	@Resource
	private UserRoleDao userRoleDao;

	// 查询当前用户的角色
	public List<UserRole> userRoleList(Integer userId) {
		return userRoleDao.userRoleList(userId);
	}

	// 删除该用户的所有角色(物理删除)
	public void deleteUserRole(Integer userId) {
		userRoleDao.deleteUserRole(userId);
	}

	// 新增用户角色
	public void saveUserRole(UserRole userRole) {
		userRoleDao.saveUserRole(userRole);
	}

}
