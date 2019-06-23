package com.edge.system.role.entity;

import java.util.Set;
import java.util.TreeSet;

/**
 * 权限实体类
 * 
 * @author NingCG
 *
 */
public class Privilege implements Comparable<Privilege> {
	private Integer privilege_id;// 主键
	private String privilege_name;// 权限名称
	private String privilege_url;// 功能url
	private Integer parent_id;// 父级权限
	private String icon;// 字体图标

	private TreeSet<Privilege> children = new TreeSet<Privilege>();// 辅助属性 下级权限

	public TreeSet<Privilege> getChildren() {
		return children;
	}

	public void setChildren(Privilege children) {
		this.children.add(children);
	}

	public Integer getPrivilege_id() {
		return privilege_id;
	}

	public void setPrivilege_id(Integer privilege_id) {
		this.privilege_id = privilege_id;
	}

	public String getPrivilege_name() {
		return privilege_name;
	}

	public void setPrivilege_name(String privilege_name) {
		this.privilege_name = privilege_name;
	}

	public String getPrivilege_url() {
		return privilege_url;
	}

	public void setPrivilege_url(String privilege_url) {
		this.privilege_url = privilege_url;
	}

	public Integer getParent_id() {
		return parent_id;
	}

	public void setParent_id(Integer parent_id) {
		this.parent_id = parent_id;
	}

	public String getIcon() {
		return icon;
	}

	public void setIcon(String icon) {
		this.icon = icon;
	}

	@Override
	public String toString() {
		return "Privilege [privilege_id=" + privilege_id + ", privilege_name=" + privilege_name + ", privilege_url="
				+ privilege_url + ", parent_id=" + parent_id + ", icon=" + icon + ", children=" + children + "]";
	}

	public int compareTo(Privilege p) {
		if (this.privilege_id > p.privilege_id) {
			return 1;
		} else {
			return -1;
		}
	}

}
