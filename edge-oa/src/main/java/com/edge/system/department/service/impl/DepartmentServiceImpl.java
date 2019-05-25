package com.edge.system.department.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;

import com.alibaba.fastjson.JSONArray;
import com.edge.system.department.dao.DepartmentDao;
import com.edge.system.department.entity.Department;
import com.edge.system.department.service.inter.DepartmentService;
import com.edge.utils.QueryVo;

@Service
public class DepartmentServiceImpl implements DepartmentService {
	@Resource
	private DepartmentDao departmentDao;

	// 分页查询部门
	public List<Department> queryDepartment(QueryVo vo) {
		return departmentDao.queryDepartment(vo);
	}

	// 查询部门数量
	public Integer departmentCount() {
		return departmentDao.departmentCount();
	}

	// 初始化部门机构树
	public List<Department> initDepartmentTree() {
		return departmentDao.initDepartmentTree();
	}

	// 初始化子部门机构树
	public List<Department> initChildrenTree(Integer dep_parentid) {
		return departmentDao.initChildrenTree(dep_parentid);
	}

	// 根据主键查询部门
	public Department queryDepartmentById(Integer dep_id) {
		return departmentDao.queryDepartmentById(dep_id);
	}

	// 根据传递的主键查询部门和子部门的数量
	public Integer queryDepartCountById(Integer dep_id) {
		return departmentDao.queryDepartCountById(dep_id);
	}

	// 根据条件分页查询部门
	public List<Department> queryDepartmenListById(QueryVo vo) {
		return departmentDao.queryDepartmenListById(vo);
	}

	// 新增部门
	public void saveDepartment(Department department) {
		departmentDao.saveDepartment(department);
	}

	// 查询所有的顶级部门
	public List<Department> topList() {
		return departmentDao.topList();
	}
	//编辑部门
	public void editDepartment(Department department) {
		departmentDao.editDepartment(department);
	}

}
