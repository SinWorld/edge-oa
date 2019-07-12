package com.edge.checkedPower.service.inter;

import java.util.List;

import com.edge.system.role.entity.Privilege;

public interface CheckedPowerService {
	// 根据用户主键查询所属的角色
	public List<Integer> queryRoleByUser(Integer userId);

	// 查询该角色下所有的权限集合代码
	public List<Integer> queryPrivilegeByRole(Integer roleId);

	// 根据权限代码查询权限对象
	public Privilege queryPrivilegeById(Integer privilege_id);
}
