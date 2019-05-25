package com.edge.utils;

public class QueryVo {
	// 当前页
	private Integer page;
	// 每页数
	private Integer size = 10;
	// 开始行
	private Integer startRow = 0;
	
	//根据主键查询所属部门
	private Integer dep_id;

	public Integer getDep_id() {
		return dep_id;
	}

	public void setDep_id(Integer dep_id) {
		this.dep_id = dep_id;
	}

	public Integer getStartRow() {
		return startRow;
	}

	public void setStartRow(Integer startRow) {
		this.startRow = startRow;
	}

	public Integer getPage() {
		return page;
	}

	public void setPage(Integer page) {
		this.page = page;
	}

	public Integer getSize() {
		return size;
	}

	public void setSize(Integer size) {
		this.size = size;
	}

}
