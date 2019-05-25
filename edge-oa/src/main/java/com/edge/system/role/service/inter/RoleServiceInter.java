package com.edge.system.role.service.inter;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.edge.system.role.entity.Role;
import com.edge.utils.QueryVo;

public interface RoleServiceInter {
	// 添加角色
	public void saveRole(Role role);

	// 分页查询角色
	public List<Role> queryRole(QueryVo vo);

	// 查询角色总数量
	public Integer queryRoleCount();

	// 根据主键查询角色
	public Role queryRoleById(@Param("roleId") Integer roleId);

	// 修改角色
	public void editRole(Role role);

	// 删除角色
	public void deleteRoleById(@Param("roleId") Integer roleId, boolean flag);

	
}
