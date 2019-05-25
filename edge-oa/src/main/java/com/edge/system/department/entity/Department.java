package com.edge.system.department.entity;

/**
 * 部门实体类
 * 
 * @author NingCG
 *
 */
public class Department {
	private Integer dep_id;// 主键
	private String dep_name;// 部门名称
	private String dep_description;// 部门描述
	private Integer dep_parentid;// 上级部门
	private Boolean dep_is_delete;// 是否删除

	private String dep_parentName;// 上级部门名称

	public Boolean getDep_is_delete() {
		return dep_is_delete;
	}

	public void setDep_is_delete(Boolean dep_is_delete) {
		this.dep_is_delete = dep_is_delete;
	}

	public String getDep_parentName() {
		return dep_parentName;
	}

	public void setDep_parentName(String dep_parentName) {
		this.dep_parentName = dep_parentName;
	}

	public Integer getDep_id() {
		return dep_id;
	}

	public void setDep_id(Integer dep_id) {
		this.dep_id = dep_id;
	}

	public String getDep_name() {
		return dep_name;
	}

	public void setDep_name(String dep_name) {
		this.dep_name = dep_name;
	}

	public String getDep_description() {
		return dep_description;
	}

	public void setDep_description(String dep_description) {
		this.dep_description = dep_description;
	}

	public Integer getDep_parentid() {
		return dep_parentid;
	}

	public void setDep_parentid(Integer dep_parentid) {
		this.dep_parentid = dep_parentid;
	}

	@Override
	public String toString() {
		return "Department [dep_id=" + dep_id + ", dep_name=" + dep_name + ", dep_description=" + dep_description
				+ ", dep_parentid=" + dep_parentid + ", dep_is_delete=" + dep_is_delete + ", dep_parentName="
				+ dep_parentName + "]";
	}

	
	
}
