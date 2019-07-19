package com.edge.WagePerformance.gzff.entity;

import java.util.Date;

/**
 * 高级搜索查询实体类
 * 
 * @author NingCG
 *
 */
public class Gzff_QueryVo {
	// 当前页
	private Integer page;
	// 每页数
	private Integer size = 10;
	// 开始行
	private Integer startRow = 0;

	private String wage_Code;// 审批编号
	private Date wage_Month;// 月份
	private Integer wage_Name;// 员工
	private Double wage_Yfgz1;// 应发工资1
	private Double wage_Yfgz2;// 应发工资2
	private Double wage_Sfgz1;// 实发工资1
	private Double wage_Sfgz2;// 实发工资2
	private Integer wage_Yglx;// 员工类型
	private String wage_Tbr;// 填报人
	private Integer bms;// 所属部门
	private Integer user_posittion;// 所属岗位

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

	public String getWage_Code() {
		return wage_Code;
	}

	public void setWage_Code(String wage_Code) {
		this.wage_Code = wage_Code;
	}

	public Date getWage_Month() {
		return wage_Month;
	}

	public void setWage_Month(Date wage_Month) {
		this.wage_Month = wage_Month;
	}

	public Integer getWage_Name() {
		return wage_Name;
	}

	public void setWage_Name(Integer wage_Name) {
		this.wage_Name = wage_Name;
	}

	public Double getWage_Yfgz1() {
		return wage_Yfgz1;
	}

	public void setWage_Yfgz1(Double wage_Yfgz1) {
		this.wage_Yfgz1 = wage_Yfgz1;
	}

	public Double getWage_Yfgz2() {
		return wage_Yfgz2;
	}

	public void setWage_Yfgz2(Double wage_Yfgz2) {
		this.wage_Yfgz2 = wage_Yfgz2;
	}

	public Double getWage_Sfgz1() {
		return wage_Sfgz1;
	}

	public void setWage_Sfgz1(Double wage_Sfgz1) {
		this.wage_Sfgz1 = wage_Sfgz1;
	}

	public Double getWage_Sfgz2() {
		return wage_Sfgz2;
	}

	public void setWage_Sfgz2(Double wage_Sfgz2) {
		this.wage_Sfgz2 = wage_Sfgz2;
	}

	public Integer getWage_Yglx() {
		return wage_Yglx;
	}

	public void setWage_Yglx(Integer wage_Yglx) {
		this.wage_Yglx = wage_Yglx;
	}

	public String getWage_Tbr() {
		return wage_Tbr;
	}

	public void setWage_Tbr(String wage_Tbr) {
		this.wage_Tbr = wage_Tbr;
	}

	public Integer getBms() {
		return bms;
	}

	public void setBms(Integer bms) {
		this.bms = bms;
	}

	public Integer getUser_posittion() {
		return user_posittion;
	}

	public void setUser_posittion(Integer user_posittion) {
		this.user_posittion = user_posittion;
	}

	@Override
	public String toString() {
		return "Gzff_QueryVo [page=" + page + ", size=" + size + ", startRow=" + startRow + ", wage_Code=" + wage_Code
				+ ", wage_Month=" + wage_Month + ", wage_Name=" + wage_Name + ", wage_Yfgz1=" + wage_Yfgz1
				+ ", wage_Yfgz2=" + wage_Yfgz2 + ", wage_Sfgz1=" + wage_Sfgz1 + ", wage_Sfgz2=" + wage_Sfgz2
				+ ", wage_Yglx=" + wage_Yglx + ", wage_Tbr=" + wage_Tbr + ", bms=" + bms + ", user_posittion="
				+ user_posittion + "]";
	}

}
