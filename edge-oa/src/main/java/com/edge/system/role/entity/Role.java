package com.edge.system.role.entity;

/**
 * 角色实体类
 * 
 * @author NingCG
 *
 */
public class Role {
	private Integer role_id;// 主键
	private String role_name;// 角色名称
	private String role_infor;// 角色说明
	private Boolean is_delete;// 是否删除

	public Boolean getIs_delete() {
		return is_delete;
	}

	public void setIs_delete(Boolean is_delete) {
		this.is_delete = is_delete;
	}

	public Integer getRole_id() {
		return role_id;
	}

	public void setRole_id(Integer role_id) {
		this.role_id = role_id;
	}

	public String getRole_name() {
		return role_name;
	}

	public void setRole_name(String role_name) {
		this.role_name = role_name;
	}

	public String getRole_infor() {
		return role_infor;
	}

	public void setRole_infor(String role_infor) {
		this.role_infor = role_infor;
	}

	@Override
	public String toString() {
		return "Role [role_id=" + role_id + ", role_name=" + role_name + ", role_infor=" + role_infor + ", is_delete="
				+ is_delete + "]";
	}

}
