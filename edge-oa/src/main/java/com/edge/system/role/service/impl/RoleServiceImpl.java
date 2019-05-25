package com.edge.system.role.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;

import com.edge.system.role.dao.RoleDao;
import com.edge.system.role.entity.Role;
import com.edge.system.role.service.inter.RoleServiceInter;
import com.edge.utils.QueryVo;

@Service
public class RoleServiceImpl implements RoleServiceInter {
	@Resource
	private RoleDao roleDao;

	// 添加角色
	public void saveRole(Role role) {
		roleDao.saveRole(role);
	}

	// 分页查询角色
	public List<Role> queryRole(QueryVo vo) {
		return roleDao.queryRole(vo);
	}

	// 查询角色总数量
	public Integer queryRoleCount() {
		return roleDao.queryRoleCount();
	}

	// 根据主键查询对象
	public Role queryRoleById(Integer roleId) {
		return roleDao.queryRoleById(roleId);
	}

	// 修改角色
	public void editRole(Role role) {
		roleDao.editRole(role);
	}

	// 删除角色 逻辑删除
	public void deleteRoleById(Integer roleId, boolean flag) {
		roleDao.deleteRoleById(roleId, flag);
	}

	

}
