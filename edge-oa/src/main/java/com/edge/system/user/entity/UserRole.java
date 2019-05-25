package com.edge.system.user.entity;

/**
 * 用户角色映射实体类
 * 
 * @author NingCG
 *
 */
public class UserRole {
	private Integer user_role_id;// 主键
	private Integer user_id;// 用户主键
	private Integer role_id;// 角色主键

	public Integer getUser_role_id() {
		return user_role_id;
	}

	public void setUser_role_id(Integer user_role_id) {
		this.user_role_id = user_role_id;
	}

	public Integer getUser_id() {
		return user_id;
	}

	public void setUser_id(Integer user_id) {
		this.user_id = user_id;
	}

	public Integer getRole_id() {
		return role_id;
	}

	public void setRole_id(Integer role_id) {
		this.role_id = role_id;
	}

	@Override
	public String toString() {
		return "User_Role [user_role_id=" + user_role_id + ", user_id=" + user_id + ", role_id=" + role_id + "]";
	}

}
