package com.edge.yyzx.xqd.entity;

import java.util.Date;

/**
 * 高级搜索查询实体类
 * 
 * @author NingCG
 *
 */
public class XuQiuD_QueryVo {
	// 当前页
	private Integer page;
	// 每页数
	private Integer size = 10;
	// 开始行
	private Integer startRow = 0;

	private String xqd_dh;// 需求编号
	private String xqd_mc;// 需求名称
	private Integer xqd_xmxx;// 项目信息
	private Integer xqd_ssxt;// 所属系统
	private Integer xqd_xqlx;// 需求类型
	private Integer xqd_fzr;// 负责人
	private Integer xqd_kh;// 客户
	private Integer xqd_xqjd;// 需求阶段
	private Integer xqd_xqzt;// 需求状态
	private Date beginTime1;// 提出日期时间段
	private Date beginTime2;// 提出日期时间段

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

	public String getXqd_dh() {
		return xqd_dh;
	}

	public void setXqd_dh(String xqd_dh) {
		this.xqd_dh = xqd_dh;
	}

	public String getXqd_mc() {
		return xqd_mc;
	}

	public void setXqd_mc(String xqd_mc) {
		this.xqd_mc = xqd_mc;
	}

	public Integer getXqd_xmxx() {
		return xqd_xmxx;
	}

	public void setXqd_xmxx(Integer xqd_xmxx) {
		this.xqd_xmxx = xqd_xmxx;
	}

	public Integer getXqd_ssxt() {
		return xqd_ssxt;
	}

	public void setXqd_ssxt(Integer xqd_ssxt) {
		this.xqd_ssxt = xqd_ssxt;
	}

	public Integer getXqd_xqlx() {
		return xqd_xqlx;
	}

	public void setXqd_xqlx(Integer xqd_xqlx) {
		this.xqd_xqlx = xqd_xqlx;
	}

	public Integer getXqd_fzr() {
		return xqd_fzr;
	}

	public void setXqd_fzr(Integer xqd_fzr) {
		this.xqd_fzr = xqd_fzr;
	}

	public Integer getXqd_kh() {
		return xqd_kh;
	}

	public void setXqd_kh(Integer xqd_kh) {
		this.xqd_kh = xqd_kh;
	}

	public Integer getXqd_xqjd() {
		return xqd_xqjd;
	}

	public void setXqd_xqjd(Integer xqd_xqjd) {
		this.xqd_xqjd = xqd_xqjd;
	}

	public Integer getXqd_xqzt() {
		return xqd_xqzt;
	}

	public void setXqd_xqzt(Integer xqd_xqzt) {
		this.xqd_xqzt = xqd_xqzt;
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
		return "XuQiuD_QueryVo [page=" + page + ", size=" + size + ", startRow=" + startRow + ", xqd_dh=" + xqd_dh
				+ ", xqd_mc=" + xqd_mc + ", xqd_xmxx=" + xqd_xmxx + ", xqd_ssxt=" + xqd_ssxt + ", xqd_xqlx=" + xqd_xqlx
				+ ", xqd_fzr=" + xqd_fzr + ", xqd_kh=" + xqd_kh + ", xqd_xqjd=" + xqd_xqjd + ", xqd_xqzt=" + xqd_xqzt
				+ ", beginTime1=" + beginTime1 + ", beginTime2=" + beginTime2 + "]";
	}

}
