package com.edge.yyzx.xmxx.entity;

import java.util.Date;

/**
 * 高级搜索查询实体类
 * 
 * @author NingCG
 *
 */
public class XiangMuXX_QueryVo {
	// 当前页
	private Integer page;
	// 每页数
	private Integer size = 10;
	// 开始行
	private Integer startRow = 0;

	private String xmxx_ysbh;// 预算编号
	private String xmxx_dh;// 代号
	private String xmxx_mc;// 名称
	private Integer xmxx_kh;// 签约主体描述
	private String xmxx_khbm;// 客户部门
	private Double xmje1;// 项目金额1
	private Double xmje2;// 项目金额2
	private Date tcrq1;// 提出日期1
	private Date tcrq2;// 提出日期2
	private Integer xmxx_fzr;// 负责人

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

	public String getXmxx_ysbh() {
		return xmxx_ysbh;
	}

	public void setXmxx_ysbh(String xmxx_ysbh) {
		this.xmxx_ysbh = xmxx_ysbh;
	}

	public String getXmxx_dh() {
		return xmxx_dh;
	}

	public void setXmxx_dh(String xmxx_dh) {
		this.xmxx_dh = xmxx_dh;
	}

	public String getXmxx_mc() {
		return xmxx_mc;
	}

	public void setXmxx_mc(String xmxx_mc) {
		this.xmxx_mc = xmxx_mc;
	}

	public Integer getXmxx_kh() {
		return xmxx_kh;
	}

	public void setXmxx_kh(Integer xmxx_kh) {
		this.xmxx_kh = xmxx_kh;
	}

	public String getXmxx_khbm() {
		return xmxx_khbm;
	}

	public void setXmxx_khbm(String xmxx_khbm) {
		this.xmxx_khbm = xmxx_khbm;
	}

	public Double getXmje1() {
		return xmje1;
	}

	public void setXmje1(Double xmje1) {
		this.xmje1 = xmje1;
	}

	public Double getXmje2() {
		return xmje2;
	}

	public void setXmje2(Double xmje2) {
		this.xmje2 = xmje2;
	}

	public Date getTcrq1() {
		return tcrq1;
	}

	public void setTcrq1(Date tcrq1) {
		this.tcrq1 = tcrq1;
	}

	public Date getTcrq2() {
		return tcrq2;
	}

	public void setTcrq2(Date tcrq2) {
		this.tcrq2 = tcrq2;
	}

	public Integer getXmxx_fzr() {
		return xmxx_fzr;
	}

	public void setXmxx_fzr(Integer xmxx_fzr) {
		this.xmxx_fzr = xmxx_fzr;
	}

	@Override
	public String toString() {
		return "XiangMuXX_QueryVo [page=" + page + ", size=" + size + ", startRow=" + startRow + ", xmxx_ysbh="
				+ xmxx_ysbh + ", xmxx_dh=" + xmxx_dh + ", xmxx_mc=" + xmxx_mc + ", xmxx_kh=" + xmxx_kh + ", xmxx_khbm="
				+ xmxx_khbm + ", xmje1=" + xmje1 + ", xmje2=" + xmje2 + ", tcrq1=" + tcrq1 + ", tcrq2=" + tcrq2
				+ ", xmxx_fzr=" + xmxx_fzr + "]";
	}

}
