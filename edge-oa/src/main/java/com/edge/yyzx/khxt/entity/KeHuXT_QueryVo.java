package com.edge.yyzx.khxt.entity;

import java.util.Date;

/**
 * 高级搜索查询实体类
 * 
 * @author NingCG
 *
 */
public class KeHuXT_QueryVo {
	// 当前页
	private Integer page;
	// 每页数
	private Integer size = 10;
	// 开始行
	private Integer startRow = 0;

	private String khxt_dh;// 代号
	private String khxt_mc;// 名称
	private Integer khxt_khdm;// 客户
	private String khxt_khbm;// 客户部门
	private String khxt_khfzr;// 客户负责人
	private Date beginTime1;// 上线日期
	private Date beginTime2;// 上线日期

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

	public String getKhxt_dh() {
		return khxt_dh;
	}

	public void setKhxt_dh(String khxt_dh) {
		this.khxt_dh = khxt_dh;
	}

	public String getKhxt_mc() {
		return khxt_mc;
	}

	public void setKhxt_mc(String khxt_mc) {
		this.khxt_mc = khxt_mc;
	}

	public Integer getKhxt_khdm() {
		return khxt_khdm;
	}

	public void setKhxt_khdm(Integer khxt_khdm) {
		this.khxt_khdm = khxt_khdm;
	}

	public String getKhxt_khbm() {
		return khxt_khbm;
	}

	public void setKhxt_khbm(String khxt_khbm) {
		this.khxt_khbm = khxt_khbm;
	}

	public String getKhxt_khfzr() {
		return khxt_khfzr;
	}

	public void setKhxt_khfzr(String khxt_khfzr) {
		this.khxt_khfzr = khxt_khfzr;
	}

	public Date getBeginTime1() {
		return beginTime1;
	}

	public void setBeginTime1(Date beginTime1) {
		this.beginTime1 = beginTime1;
	}

	public Date getBeginTime2() {
		return beginTime2;
	}

	public void setBeginTime2(Date beginTime2) {
		this.beginTime2 = beginTime2;
	}

	@Override
	public String toString() {
		return "KeHuXT_QueryVo [page=" + page + ", size=" + size + ", startRow=" + startRow + ", khxt_dh=" + khxt_dh
				+ ", khxt_mc=" + khxt_mc + ", khxt_khdm=" + khxt_khdm + ", khxt_khbm=" + khxt_khbm + ", khxt_khfzr="
				+ khxt_khfzr + ", beginTime1=" + beginTime1 + ", beginTime2=" + beginTime2 + "]";
	}

}
