package com.edge.checkedPower.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.edge.system.role.entity.Privilege;

public interface CheckedPowerDao {
	// 根据用户主键查询所属的角色
	public List<Integer> queryRoleByUser(@Param("userId") Integer userId);
	
	//查询该角色下所有的权限集合代码
	public List<Integer> queryPrivilegeByRole(@Param("roleId") Integer roleId);
	
	//根据权限代码查询权限对象
	public Privilege queryPrivilegeById(@Param("privilege_id") Integer privilege_id);
}
