package com.edge.checkedPower.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.edge.checkedPower.dao.CheckedPowerDao;
import com.edge.checkedPower.service.inter.CheckedPowerService;
import com.edge.system.role.entity.Privilege;

/**
 * 权限控制业务逻辑层
 * 
 * @author NingCG
 *
 */
@Service
public class CheckedPowerServiceImpl implements CheckedPowerService {
	@Resource
	private CheckedPowerDao checkedPowerDao;

	// 查询用户所有的角色
	public List<Integer> queryRoleByUser(Integer userId) {
		return checkedPowerDao.queryRoleByUser(userId);
	}

	// 查询该角色下所有的权限集合代码
	public List<Integer> queryPrivilegeByRole(Integer roleId) {
		return checkedPowerDao.queryPrivilegeByRole(roleId);
	}

	// 根据权限代码查询权限对象
	public Privilege queryPrivilegeById(Integer privilege_id) {
		return checkedPowerDao.queryPrivilegeById(privilege_id);
	}
}
