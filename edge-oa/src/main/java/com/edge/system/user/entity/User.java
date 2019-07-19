package com.edge.system.user.entity;

/**
 * 用户实体类
 * 
 * @author NingCG
 *
 */
public class User {
	private Integer user_id;// 主键
	private String user_login_name;// 登录名
	private String user_name;// 用户名
	private String user_password;// 密码
	private String user_phone;// 手机号
	private String user_email;// 邮箱
	private Integer user_gender;// 性别
	private Integer user_department_id;// 所属部门
	private Boolean user_is_delete;// 是否删除
	private Integer user_leader;// 上级领导
	private Integer user_posittion;// 所属岗位

	// 辅助属性 显示部门名称
	private String user_department_name;
	// 辅助属性 显示角色名
	private String userRoleName;

	public String getUserRoleName() {
		return userRoleName;
	}

	public void setUserRoleName(String userRoleName) {
		this.userRoleName = userRoleName;
	}

	public Integer getUser_id() {
		return user_id;
	}

	public void setUser_id(Integer user_id) {
		this.user_id = user_id;
	}

	public String getUser_login_name() {
		return user_login_name;
	}

	public void setUser_login_name(String user_login_name) {
		this.user_login_name = user_login_name;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public String getUser_password() {
		return user_password;
	}

	public void setUser_password(String user_password) {
		this.user_password = user_password;
	}

	public String getUser_phone() {
		return user_phone;
	}

	public void setUser_phone(String user_phone) {
		this.user_phone = user_phone;
	}

	public String getUser_email() {
		return user_email;
	}

	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}

	public Integer getUser_gender() {
		return user_gender;
	}

	public void setUser_gender(Integer user_gender) {
		this.user_gender = user_gender;
	}

	public Integer getUser_department_id() {
		return user_department_id;
	}

	public void setUser_department_id(Integer user_department_id) {
		this.user_department_id = user_department_id;
	}

	public Boolean getUser_is_delete() {
		return user_is_delete;
	}

	public void setUser_is_delete(Boolean user_is_delete) {
		this.user_is_delete = user_is_delete;
	}

	public String getUser_department_name() {
		return user_department_name;
	}

	public void setUser_department_name(String user_department_name) {
		this.user_department_name = user_department_name;
	}

	public Integer getUser_leader() {
		return user_leader;
	}

	public void setUser_leader(Integer user_leader) {
		this.user_leader = user_leader;
	}

	public Integer getUser_posittion() {
		return user_posittion;
	}

	public void setUser_posittion(Integer user_posittion) {
		this.user_posittion = user_posittion;
	}

	@Override
	public String toString() {
		return "User [user_id=" + user_id + ", user_login_name=" + user_login_name + ", user_name=" + user_name
				+ ", user_password=" + user_password + ", user_phone=" + user_phone + ", user_email=" + user_email
				+ ", user_gender=" + user_gender + ", user_department_id=" + user_department_id + ", user_is_delete="
				+ user_is_delete + ", user_leader=" + user_leader + ", user_posittion=" + user_posittion
				+ ", user_department_name=" + user_department_name + ", userRoleName=" + userRoleName + "]";
	}

}
