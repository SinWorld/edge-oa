package com.edge.system.role.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.edge.system.role.dao.PrivilegeDao;
import com.edge.system.role.entity.Privilege;
import com.edge.system.role.entity.Role_Privilege;
import com.edge.system.role.service.inter.PrivilegeService;

@Service
public class PrivilegeServiceImpl implements PrivilegeService {
	@Resource
	private PrivilegeDao privilegeDao;

	// 查询所有顶级权限
	public List<Privilege> privilegeTopList() {
		return privilegeDao.privilegeTopList();
	}

	// 根据父类权限主键查询子类权限
	public List<Privilege> privilegeChildrenList(Integer parent_id) {
		return privilegeDao.privilegeChildrenList(parent_id);
	}

	// 查询某个角色是否存在功能权限
	public List<Role_Privilege> rolePrivilegeList(Integer roleId) {
		return privilegeDao.rolePrivilegeList(roleId);
	}

	// 删除某个角色的所有功能权限
	public void deleteRolePrivilege(Integer roleId) {
		privilegeDao.deleteRolePrivilege(roleId);
	}

	// 新增功能权限
	public void saveRolePrivilege(Role_Privilege role_Privilege) {
		privilegeDao.saveRolePrivilege(role_Privilege);
	}
}
