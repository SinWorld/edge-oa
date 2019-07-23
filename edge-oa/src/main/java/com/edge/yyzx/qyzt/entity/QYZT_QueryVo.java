package com.edge.yyzx.qyzt.entity;

/**
 * 高级搜索查询实体类
 * 
 * @author NingCG
 *
 */
public class QYZT_QueryVo {
	// 当前页
	private Integer page;
	// 每页数
	private Integer size = 10;
	// 开始行
	private Integer startRow = 0;

	private String qyztdh;// 签约主体代号
	private String qyztjc;// 签约主体简称
	private String qyztmc;// 签约主体名称
	private String qyztms;// 签约主体描述

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

	public String getQyztdh() {
		return qyztdh;
	}

	public void setQyztdh(String qyztdh) {
		this.qyztdh = qyztdh;
	}

	public String getQyztjc() {
		return qyztjc;
	}

	public void setQyztjc(String qyztjc) {
		this.qyztjc = qyztjc;
	}

	public String getQyztmc() {
		return qyztmc;
	}

	public void setQyztmc(String qyztmc) {
		this.qyztmc = qyztmc;
	}

	public String getQyztms() {
		return qyztms;
	}

	public void setQyztms(String qyztms) {
		this.qyztms = qyztms;
	}

	@Override
	public String toString() {
		return "QYZT_QueryVo [page=" + page + ", size=" + size + ", startRow=" + startRow + ", qyztdh=" + qyztdh
				+ ", qyztjc=" + qyztjc + ", qyztmc=" + qyztmc + ", qyztms=" + qyztms + "]";
	}

}
