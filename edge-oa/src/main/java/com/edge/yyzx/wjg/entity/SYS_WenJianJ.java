package com.edge.yyzx.wjg.entity;

import java.util.List;

/**
 * 文件夹实体类
 * 
 * @author NingCG
 *
 */
public class SYS_WenJianJ {
	private Integer id;// 文件夹主键
	private String title;// 文件夹名称
	private Integer parent_Id;// 上级文件夹主键

	private String parent_Name;// 上级文件夹名称
	private List<SYS_WenJianJ> children;// 子菜单集合
	private Boolean spread = true;// 默认展开

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public Integer getParent_Id() {
		return parent_Id;
	}

	public void setParent_Id(Integer parent_Id) {
		this.parent_Id = parent_Id;
	}

	public String getParent_Name() {
		return parent_Name;
	}

	public void setParent_Name(String parent_Name) {
		this.parent_Name = parent_Name;
	}

	public List<SYS_WenJianJ> getChildren() {
		return children;
	}

	public void setChildren(List<SYS_WenJianJ> children) {
		this.children = children;
	}

	public Boolean getSpread() {
		return spread;
	}

	public void setSpread(Boolean spread) {
		this.spread = spread;
	}

	@Override
	public String toString() {
		return "[id=" + id + ", title=" + title + ", parent_Id=" + parent_Id + ", parent_Name=" + parent_Name
				+ ", children=" + children + ", spread=" + spread + "]";
	}

}
