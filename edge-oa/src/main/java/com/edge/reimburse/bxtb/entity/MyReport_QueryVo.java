package com.edge.reimburse.bxtb.entity;

import java.util.Date;

/**
 * 高级搜索查询实体类
 * 
 * @author NingCG
 *
 */
public class MyReport_QueryVo {
	// 当前页
	private Integer page;
	// 每页数
	private Integer size = 10;
	// 开始行
	private Integer startRow = 0;

	private String userName;

	private String reimbursement_code;// 审批编号
	private Integer proj_dm;// 所属项目
	private Integer reimbursement_dm_fylx;// 费用类型
	private Double reimbursement_bxje1;// 报销金额1
	private Double reimbursement_bxje2;// 报销金额2
	private Integer reimbursement_user_dm;// 费用所属
	private String reimbursement_bxr;// 报销人
	private Integer appr_status;// 审批状态
	private String nextcz;// 当前操作
	private Date reimbursement_begintime1;// 发生日期
	private Date reimbursement_begintime2;// 发生日期
	private Date reimbursement_submittime1;// 提交日期
	private Date reimbursement_submittime2;// 提交日期

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

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getReimbursement_code() {
		return reimbursement_code;
	}

	public void setReimbursement_code(String reimbursement_code) {
		this.reimbursement_code = reimbursement_code;
	}

	public Integer getProj_dm() {
		return proj_dm;
	}

	public void setProj_dm(Integer proj_dm) {
		this.proj_dm = proj_dm;
	}

	public Integer getReimbursement_dm_fylx() {
		return reimbursement_dm_fylx;
	}

	public void setReimbursement_dm_fylx(Integer reimbursement_dm_fylx) {
		this.reimbursement_dm_fylx = reimbursement_dm_fylx;
	}

	public Double getReimbursement_bxje1() {
		return reimbursement_bxje1;
	}

	public void setReimbursement_bxje1(Double reimbursement_bxje1) {
		this.reimbursement_bxje1 = reimbursement_bxje1;
	}

	public Double getReimbursement_bxje2() {
		return reimbursement_bxje2;
	}

	public void setReimbursement_bxje2(Double reimbursement_bxje2) {
		this.reimbursement_bxje2 = reimbursement_bxje2;
	}

	public Integer getReimbursement_user_dm() {
		return reimbursement_user_dm;
	}

	public void setReimbursement_user_dm(Integer reimbursement_user_dm) {
		this.reimbursement_user_dm = reimbursement_user_dm;
	}

	public String getReimbursement_bxr() {
		return reimbursement_bxr;
	}

	public void setReimbursement_bxr(String reimbursement_bxr) {
		this.reimbursement_bxr = reimbursement_bxr;
	}

	public Integer getAppr_status() {
		return appr_status;
	}

	public void setAppr_status(Integer appr_status) {
		this.appr_status = appr_status;
	}

	public String getNextcz() {
		return nextcz;
	}

	public void setNextcz(String nextcz) {
		this.nextcz = nextcz;
	}

	public Date getReimbursement_begintime1() {
		return reimbursement_begintime1;
	}

	public void setReimbursement_begintime1(Date reimbursement_begintime1) {
		this.reimbursement_begintime1 = reimbursement_begintime1;
	}

	public Date getReimbursement_begintime2() {
		return reimbursement_begintime2;
	}

	public void setReimbursement_begintime2(Date reimbursement_begintime2) {
		this.reimbursement_begintime2 = reimbursement_begintime2;
	}

	public Date getReimbursement_submittime1() {
		return reimbursement_submittime1;
	}

	public void setReimbursement_submittime1(Date reimbursement_submittime1) {
		this.reimbursement_submittime1 = reimbursement_submittime1;
	}

	public Date getReimbursement_submittime2() {
		return reimbursement_submittime2;
	}

	public void setReimbursement_submittime2(Date reimbursement_submittime2) {
		this.reimbursement_submittime2 = reimbursement_submittime2;
	}

	@Override
	public String toString() {
		return "MyReport_QueryVo [page=" + page + ", size=" + size + ", startRow=" + startRow + ", userName=" + userName
				+ ", reimbursement_code=" + reimbursement_code + ", proj_dm=" + proj_dm + ", reimbursement_dm_fylx="
				+ reimbursement_dm_fylx + ", reimbursement_bxje1=" + reimbursement_bxje1 + ", reimbursement_bxje2="
				+ reimbursement_bxje2 + ", reimbursement_user_dm=" + reimbursement_user_dm + ", reimbursement_bxr="
				+ reimbursement_bxr + ", appr_status=" + appr_status + ", nextcz=" + nextcz
				+ ", reimbursement_begintime1=" + reimbursement_begintime1 + ", reimbursement_begintime2="
				+ reimbursement_begintime2 + ", reimbursement_submittime1=" + reimbursement_submittime1
				+ ", reimbursement_submittime2=" + reimbursement_submittime2 + "]";
	}

}
