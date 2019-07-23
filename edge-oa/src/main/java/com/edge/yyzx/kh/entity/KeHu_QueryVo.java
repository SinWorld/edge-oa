package com.edge.yyzx.kh.entity;

/**
 * 高级搜索查询实体类
 * 
 * @author NingCG
 *
 */
public class KeHu_QueryVo {
	// 当前页
	private Integer page;
	// 每页数
	private Integer size = 10;
	// 开始行
	private Integer startRow = 0;

	private String khdh;// 签约主体代号
	private String khjc;// 签约主体简称
	private String khmc;// 签约主体名称
	private String khms;// 签约主体描述

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

	public String getKhdh() {
		return khdh;
	}

	public void setKhdh(String khdh) {
		this.khdh = khdh;
	}

	public String getKhjc() {
		return khjc;
	}

	public void setKhjc(String khjc) {
		this.khjc = khjc;
	}

	public String getKhmc() {
		return khmc;
	}

	public void setKhmc(String khmc) {
		this.khmc = khmc;
	}

	public String getKhms() {
		return khms;
	}

	public void setKhms(String khms) {
		this.khms = khms;
	}

	@Override
	public String toString() {
		return "KeHu_QueryVo [page=" + page + ", size=" + size + ", startRow=" + startRow + ", khdh=" + khdh + ", khjc="
				+ khjc + ", khmc=" + khmc + ", khms=" + khms + "]";
	}

}
