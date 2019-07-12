package com.edge.cwgl.xsfpkj.entity;

import java.util.Date;

/**
 * 高级搜索查询实体类
 * 
 * @author NingCG
 *
 */
public class Xshtkp_QueryVo {
	// 当前页
	private Integer page;
	// 每页数
	private Integer size = 10;
	// 开始行
	private Integer startRow = 0;
	private String xshtkp_djr;// 登记人
	private Integer xshtkp_xshtdm;// 所属销售合同
	// 提交时间 时间段
	private Date date;
	private Date date2;

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

	public String getXshtkp_djr() {
		return xshtkp_djr;
	}

	public void setXshtkp_djr(String xshtkp_djr) {
		this.xshtkp_djr = xshtkp_djr;
	}

	public Integer getXshtkp_xshtdm() {
		return xshtkp_xshtdm;
	}

	public void setXshtkp_xshtdm(Integer xshtkp_xshtdm) {
		this.xshtkp_xshtdm = xshtkp_xshtdm;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public Date getDate2() {
		return date2;
	}

	public void setDate2(Date date2) {
		this.date2 = date2;
	}

	@Override
	public String toString() {
		return "Xshtkp_QueryVo [page=" + page + ", size=" + size + ", startRow=" + startRow + ", xshtkp_djr="
				+ xshtkp_djr + ", xshtkp_xshtdm=" + xshtkp_xshtdm + ", date=" + date + ", date2=" + date2 + "]";
	}

}
