package com.edge.yyzx.sxwd.entity;

import java.util.Date;

/**
 * 高级搜索查询实体类
 * 
 * @author NingCG
 *
 */
public class ShangXianWD_QueryVo {
	// 当前页
	private Integer page;
	// 每页数
	private Integer size = 10;
	// 开始行
	private Integer startRow = 0;

	private String sxwd_bh;// 编号
	private Integer sxwd_wtlx;// 问题类型
	private String sxwd_bcgxnr;// 上线内容
	private String sxwd_xt;// 系统
	private String sxwd_fz;// 分支
	private String sxwd_git;// git版本
	private Integer sxwd_kfry;// 开发负责人
	private Integer sxwd_kfysry;// 上线人员
	private Date beginTime1;// 计划上线时间段
	private Date beginTime2;// 计划上线时间段

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

	public String getSxwd_bh() {
		return sxwd_bh;
	}

	public void setSxwd_bh(String sxwd_bh) {
		this.sxwd_bh = sxwd_bh;
	}

	public Integer getSxwd_wtlx() {
		return sxwd_wtlx;
	}

	public void setSxwd_wtlx(Integer sxwd_wtlx) {
		this.sxwd_wtlx = sxwd_wtlx;
	}

	public String getSxwd_bcgxnr() {
		return sxwd_bcgxnr;
	}

	public void setSxwd_bcgxnr(String sxwd_bcgxnr) {
		this.sxwd_bcgxnr = sxwd_bcgxnr;
	}

	public String getSxwd_xt() {
		return sxwd_xt;
	}

	public void setSxwd_xt(String sxwd_xt) {
		this.sxwd_xt = sxwd_xt;
	}

	public String getSxwd_fz() {
		return sxwd_fz;
	}

	public void setSxwd_fz(String sxwd_fz) {
		this.sxwd_fz = sxwd_fz;
	}

	public String getSxwd_git() {
		return sxwd_git;
	}

	public void setSxwd_git(String sxwd_git) {
		this.sxwd_git = sxwd_git;
	}

	public Integer getSxwd_kfry() {
		return sxwd_kfry;
	}

	public void setSxwd_kfry(Integer sxwd_kfry) {
		this.sxwd_kfry = sxwd_kfry;
	}

	public Integer getSxwd_kfysry() {
		return sxwd_kfysry;
	}

	public void setSxwd_kfysry(Integer sxwd_kfysry) {
		this.sxwd_kfysry = sxwd_kfysry;
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
		return "ShangXianWD_QueryVo [page=" + page + ", size=" + size + ", startRow=" + startRow + ", sxwd_bh="
				+ sxwd_bh + ", sxwd_wtlx=" + sxwd_wtlx + ", sxwd_bcgxnr=" + sxwd_bcgxnr + ", sxwd_xt=" + sxwd_xt
				+ ", sxwd_fz=" + sxwd_fz + ", sxwd_git=" + sxwd_git + ", sxwd_kfry=" + sxwd_kfry + ", sxwd_kfysry="
				+ sxwd_kfysry + ", beginTime1=" + beginTime1 + ", beginTime2=" + beginTime2 + "]";
	}

}
