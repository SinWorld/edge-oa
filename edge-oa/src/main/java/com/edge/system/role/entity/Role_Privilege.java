package com.edge.system.role.entity;

/**
 * 角色权限映射实体类
 * 
 * @author NingCG
 *
 */
public class Role_Privilege {
	private Integer role_privilege_Id;// 主键
	private Integer role_Id;// 角色主键
	private Integer privilege_Id;// 权限主键

	public Integer getRole_privilege_Id() {
		return role_privilege_Id;
	}

	public void setRole_privilege_Id(Integer role_privilege_Id) {
		this.role_privilege_Id = role_privilege_Id;
	}

	public Integer getRole_Id() {
		return role_Id;
	}

	public void setRole_Id(Integer role_Id) {
		this.role_Id = role_Id;
	}

	public Integer getPrivilege_Id() {
		return privilege_Id;
	}

	public void setPrivilege_Id(Integer privilege_Id) {
		this.privilege_Id = privilege_Id;
	}

	@Override
	public String toString() {
		return "Role_Privilege [role_privilege_Id=" + role_privilege_Id + ", role_Id=" + role_Id + ", privilege_Id="
				+ privilege_Id + "]";
	}

}
