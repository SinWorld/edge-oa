package com.edge.yyzx.bqwh.entity;

/**
 * 高级搜索查询实体类
 * 
 * @author NingCG
 *
 */
public class BQWH_QueryVo {
	// 当前页
	private Integer page;
	// 每页数
	private Integer size = 10;
	// 开始行
	private Integer startRow = 0;

	private String bqwhbh;// 标签维护编号
	private String bqwhdh;// 标签维护代号
	private String bqwhmc;// 标签维护名称

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

	public String getBqwhbh() {
		return bqwhbh;
	}

	public void setBqwhbh(String bqwhbh) {
		this.bqwhbh = bqwhbh;
	}

	public String getBqwhdh() {
		return bqwhdh;
	}

	public void setBqwhdh(String bqwhdh) {
		this.bqwhdh = bqwhdh;
	}

	public String getBqwhmc() {
		return bqwhmc;
	}

	public void setBqwhmc(String bqwhmc) {
		this.bqwhmc = bqwhmc;
	}

	@Override
	public String toString() {
		return "BQWH_QueryVo [page=" + page + ", size=" + size + ", startRow=" + startRow + ", bqwhbh=" + bqwhbh
				+ ", bqwhdh=" + bqwhdh + ", bqwhmc=" + bqwhmc + "]";
	}

}
