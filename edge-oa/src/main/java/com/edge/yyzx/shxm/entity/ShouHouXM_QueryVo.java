package com.edge.yyzx.shxm.entity;

/**
 * 高级搜索查询实体类
 * 
 * @author NingCG
 *
 */
public class ShouHouXM_QueryVo {
	// 当前页
	private Integer page;
	// 每页数
	private Integer size = 10;
	// 开始行
	private Integer startRow = 0;

	private String shxm_dh;// 售后项目代号
	private String shxm_mc;// 售后项目名称
	private Integer shxm_kh;// 客户
	private Integer shxm_qyzt;// 签约主体
	private String shxm_ms;// 描述

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

	public String getShxm_dh() {
		return shxm_dh;
	}

	public void setShxm_dh(String shxm_dh) {
		this.shxm_dh = shxm_dh;
	}

	public String getShxm_mc() {
		return shxm_mc;
	}

	public void setShxm_mc(String shxm_mc) {
		this.shxm_mc = shxm_mc;
	}

	public Integer getShxm_kh() {
		return shxm_kh;
	}

	public void setShxm_kh(Integer shxm_kh) {
		this.shxm_kh = shxm_kh;
	}

	public Integer getShxm_qyzt() {
		return shxm_qyzt;
	}

	public void setShxm_qyzt(Integer shxm_qyzt) {
		this.shxm_qyzt = shxm_qyzt;
	}

	public String getShxm_ms() {
		return shxm_ms;
	}

	public void setShxm_ms(String shxm_ms) {
		this.shxm_ms = shxm_ms;
	}

	@Override
	public String toString() {
		return "ShouHouXM_QueryVo [page=" + page + ", size=" + size + ", startRow=" + startRow + ", shxm_dh=" + shxm_dh
				+ ", shxm_mc=" + shxm_mc + ", shxm_kh=" + shxm_kh + ", shxm_qyzt=" + shxm_qyzt + ", shxm_ms=" + shxm_ms
				+ "]";
	}

}
