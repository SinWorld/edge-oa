package com.edge.system.user.service.inter;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.edge.system.role.entity.Role;
import com.edge.system.user.entity.UserRole;

public interface UserRoleService {
	// 根据用户主键查询该用户有无角色
	public List<UserRole> userRoleList(@Param("userId") Integer userId);

	// 删除该用户的所有角色(物理删除)
	public void deleteUserRole(@Param("userId") Integer userId);

	// 新增用户的角色
	public void saveUserRole(UserRole userRole);

	// 查询所有角色
	public List<Role> roleList();
}
