package com.edge.system.department.service.inter;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.edge.system.department.entity.Department;
import com.edge.utils.QueryVo;

public interface DepartmentService {
	// 分页展现部门
	public List<Department> queryDepartment(QueryVo vo);

	// 查询部门数量
	public Integer departmentCount();

	// 初始化部门机构树
	public List<Department> initDepartmentTree();

	// 初始化子部门机构树
	public List<Department> initChildrenTree(@Param("dep_parentid") Integer dep_parentid);

	// 根据主键查询部门
	public Department queryDepartmentById(@Param("dep_id") Integer dep_id);

	// 根据传递的主键查询部门和子部门的数量
	public Integer queryDepartCountById(@Param("dep_id") Integer dep_id);

	// 根据条件分页查询部门
	public List<Department> queryDepartmenListById(QueryVo vo);

	// 新增部门
	public void saveDepartment(Department department);

	// 查询所有的顶级部门
	public List<Department> topList();

	// 编辑部门
	public void editDepartment(Department department);
}
