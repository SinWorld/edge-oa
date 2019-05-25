package com.edge.system.role.service.inter;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.edge.system.role.entity.Privilege;
import com.edge.system.role.entity.Role_Privilege;

public interface PrivilegeService {
	// 查询顶级权限
	public List<Privilege> privilegeTopList();

	// 根据父类权限主键查询子类权限
	public List<Privilege> privilegeChildrenList(Integer parent_id);

	// 查询某个角色是否存在功能权限
	public List<Role_Privilege> rolePrivilegeList(@Param("roleId") Integer roleId);

	// 删除某个角色的所有功能权限
	public void deleteRolePrivilege(@Param("roleId") Integer roleId);

	// 新增功能权限
	public void saveRolePrivilege(Role_Privilege role_Privilege);
}
