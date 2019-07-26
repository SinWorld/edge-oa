package com.edge.yyzx.bqwh.entity;

/**
 * 标签维护实体类
 * 
 * @author NingCG
 *
 */
public class BiaoQianWH {
	private Integer bqwhdm;// 主键
	private String bqwhbh;// 编号
	private String bqwhdh;// 代号
	private String bqwhmc;// 名称

	public Integer getBqwhdm() {
		return bqwhdm;
	}

	public void setBqwhdm(Integer bqwhdm) {
		this.bqwhdm = bqwhdm;
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
		return "BiaoQianWH [bqwhdm=" + bqwhdm + ", bqwhbh=" + bqwhbh + ", bqwhdh=" + bqwhdh + ", bqwhmc=" + bqwhmc
				+ "]";
	}

}
