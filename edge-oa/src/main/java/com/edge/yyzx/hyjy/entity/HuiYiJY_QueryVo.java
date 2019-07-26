package com.edge.yyzx.hyjy.entity;

import java.util.Date;

/**
 * 高级搜索查询实体类
 * 
 * @author NingCG
 *
 */
public class HuiYiJY_QueryVo {
	// 当前页
	private Integer page;
	// 每页数
	private Integer size = 10;
	// 开始行
	private Integer startRow = 0;

	private String hyjydh;// 会议纪要代号
	private String hyzt;// 会议主题
	private Integer kehudm;// 客户
	private String cyry;// 参与人员
	private Date beginTime1;// 开始时间段
	private Date beginTime2;// 开始时间段
	private Date endTime1;// 结束时间段
	private Date endTime2;// 结束时间段

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

	public String getHyjydh() {
		return hyjydh;
	}

	public void setHyjydh(String hyjydh) {
		this.hyjydh = hyjydh;
	}

	public String getHyzt() {
		return hyzt;
	}

	public void setHyzt(String hyzt) {
		this.hyzt = hyzt;
	}

	public Integer getKehudm() {
		return kehudm;
	}

	public void setKehudm(Integer kehudm) {
		this.kehudm = kehudm;
	}

	public String getCyry() {
		return cyry;
	}

	public void setCyry(String cyry) {
		this.cyry = cyry;
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

	public Date getEndTime1() {
		return endTime1;
	}

	public void setEndTime1(Date endTime1) {
		this.endTime1 = endTime1;
	}

	public Date getEndTime2() {
		return endTime2;
	}

	public void setEndTime2(Date endTime2) {
		this.endTime2 = endTime2;
	}

	@Override
	public String toString() {
		return "HuiYiJY_QueryVo [page=" + page + ", size=" + size + ", startRow=" + startRow + ", hyjydh=" + hyjydh
				+ ", hyzt=" + hyzt + ", kehudm=" + kehudm + ", cyry=" + cyry + ", beginTime1=" + beginTime1
				+ ", beginTime2=" + beginTime2 + ", endTime1=" + endTime1 + ", endTime2=" + endTime2 + "]";
	}

}
