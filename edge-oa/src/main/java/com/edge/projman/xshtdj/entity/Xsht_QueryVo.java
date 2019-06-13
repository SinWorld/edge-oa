package com.edge.projman.xshtdj.entity;

import java.util.Date;

/**
 * 高级搜索查询实体类
 * 
 * @author NingCG
 *
 */
public class Xsht_QueryVo {
	// 当前页
	private Integer page;
	// 每页数
	private Integer size = 10;
	// 开始行
	private Integer startRow = 0;

	// 合同编号
	private String proj_Code;
	// 合同名称
	private Integer proj_Info_Id;
	// 我方负责人
	private String user_Id;
	// 审批状态
	private Integer appr_Status;
	// 提交人姓名
	private String subm_Name;
	// 当前操作
	private String nextCZ;
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

	public String getProj_Code() {
		return proj_Code;
	}

	public void setProj_Code(String proj_Code) {
		this.proj_Code = proj_Code;
	}

	public Integer getProj_Info_Id() {
		return proj_Info_Id;
	}

	public void setProj_Info_Id(Integer proj_Info_Id) {
		this.proj_Info_Id = proj_Info_Id;
	}

	public String getUser_Id() {
		return user_Id;
	}

	public void setUser_Id(String user_Id) {
		this.user_Id = user_Id;
	}

	public Integer getAppr_Status() {
		return appr_Status;
	}

	public void setAppr_Status(Integer appr_Status) {
		this.appr_Status = appr_Status;
	}

	public String getSubm_Name() {
		return subm_Name;
	}

	public void setSubm_Name(String subm_Name) {
		this.subm_Name = subm_Name;
	}

	public String getNextCZ() {
		return nextCZ;
	}

	public void setNextCZ(String nextCZ) {
		this.nextCZ = nextCZ;
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
		return "Xsht_QueryVo [page=" + page + ", size=" + size + ", startRow=" + startRow + ", proj_Code=" + proj_Code
				+ ", proj_Info_Id=" + proj_Info_Id + ", user_Id=" + user_Id + ", appr_Status=" + appr_Status
				+ ", subm_Name=" + subm_Name + ", nextCZ=" + nextCZ + ", date=" + date + ", date2=" + date2 + "]";
	}

}
