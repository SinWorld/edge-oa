package com.edge.reimburse.bxtb.entity;

/**
 * 高级搜索查询实体类
 * 
 * @author NingCG
 *
 */
public class MyReport_QueryVo {
	// 当前页
	private Integer page;
	// 每页数
	private Integer size = 10;
	// 开始行
	private Integer startRow = 0;

	private String userName;

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

	public Integer getStartRow() {
		return startRow;
	}

	public void setStartRow(Integer startRow) {
		this.startRow = startRow;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	@Override
	public String toString() {
		return "MyReport_QueryVo [page=" + page + ", size=" + size + ", startRow=" + startRow + ", userName=" + userName
				+ "]";
	}

}
