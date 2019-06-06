package com.edge.projman.approveproj.entity;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

/**
 * 项目信息实体类
 * 
 * @author NingCG
 *
 */
public class Foll_up_Proj {
	private Integer proj_Id;// 主键
	private String proj_Code;// 项目编号
	private String budget_Name;// 项目名称
	private Double budget_Amount;// 预算金额
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date plan_Cont_Date;// 计划合同签订日期
	private Integer bp_method;// 招标采购方式
	private String cust_Unit;// 客户单位名称
	private String cust_Contact;// 客户负责人
	private String cust_Phone;// 客户手机号
	private String offi_Tel;// 客户固定电话号
	private Double proj_Succ_Rate;// 项目成功率
	private String our_Unit;// 我方单位名称
	private Integer user_Id;// 我方负责人主键
	private String user_Name;// 我方负责人姓名
	private String memo_1;// 备注
	private Integer appr_Status;// 审批状态
	private Integer subm_User_Id;// 提交用户主键
	private String subm_Name;// 提交人姓名
	private Integer depa_Id;// 部门主键
	private String depa;// 部门名称
	private Date subm_Time;// 提交时间
	private Date finish_Time;// 完成时间
	private String proj_Status;// 项目状态 (已签订合同、未签订合同)
	private Boolean IS_TY;// 是否同意立项标志
	private String db_ms;// 待办任务描述

	// 辅助属性用于格式化计划合同签订日期
	private String plan_cont_date;
	// 辅助属性用于显示审批状态
	private String spzt;
	// 辅助属性用于格式化提交时间
	private String tjTime;
	// 辅助属性用于显示下一步操作
	private String nextCZ;

	public String getPlan_cont_date() {
		return plan_cont_date;
	}

	public void setPlan_cont_date(String plan_cont_date) {
		this.plan_cont_date = plan_cont_date;
	}

	public Integer getProj_Id() {
		return proj_Id;
	}

	public void setProj_Id(Integer proj_Id) {
		this.proj_Id = proj_Id;
	}

	public String getProj_Code() {
		return proj_Code;
	}

	public void setProj_Code(String proj_Code) {
		this.proj_Code = proj_Code;
	}

	public String getBudget_Name() {
		return budget_Name;
	}

	public void setBudget_Name(String budget_Name) {
		this.budget_Name = budget_Name;
	}

	public Double getBudget_Amount() {
		return budget_Amount;
	}

	public void setBudget_Amount(Double budget_Amount) {
		this.budget_Amount = budget_Amount;
	}

	public Date getPlan_Cont_Date() {
		return plan_Cont_Date;
	}

	public void setPlan_Cont_Date(Date plan_Cont_Date) {
		this.plan_Cont_Date = plan_Cont_Date;
	}

	public Integer getBp_method() {
		return bp_method;
	}

	public void setBp_method(Integer bp_method) {
		this.bp_method = bp_method;
	}

	public String getCust_Unit() {
		return cust_Unit;
	}

	public void setCust_Unit(String cust_Unit) {
		this.cust_Unit = cust_Unit;
	}

	public String getCust_Contact() {
		return cust_Contact;
	}

	public void setCust_Contact(String cust_Contact) {
		this.cust_Contact = cust_Contact;
	}

	public String getCust_Phone() {
		return cust_Phone;
	}

	public void setCust_Phone(String cust_Phone) {
		this.cust_Phone = cust_Phone;
	}

	public String getOffi_Tel() {
		return offi_Tel;
	}

	public void setOffi_Tel(String offi_Tel) {
		this.offi_Tel = offi_Tel;
	}

	public Double getProj_Succ_Rate() {
		return proj_Succ_Rate;
	}

	public void setProj_Succ_Rate(Double proj_Succ_Rate) {
		this.proj_Succ_Rate = proj_Succ_Rate;
	}

	public String getOur_Unit() {
		return our_Unit;
	}

	public void setOur_Unit(String our_Unit) {
		this.our_Unit = our_Unit;
	}

	public Integer getUser_Id() {
		return user_Id;
	}

	public void setUser_Id(Integer user_Id) {
		this.user_Id = user_Id;
	}

	public String getUser_Name() {
		return user_Name;
	}

	public void setUser_Name(String user_Name) {
		this.user_Name = user_Name;
	}

	public String getMemo_1() {
		return memo_1;
	}

	public void setMemo_1(String memo_1) {
		this.memo_1 = memo_1;
	}

	public Integer getAppr_Status() {
		return appr_Status;
	}

	public void setAppr_Status(Integer appr_Status) {
		this.appr_Status = appr_Status;
	}

	public Integer getSubm_User_Id() {
		return subm_User_Id;
	}

	public void setSubm_User_Id(Integer subm_User_Id) {
		this.subm_User_Id = subm_User_Id;
	}

	public String getSubm_Name() {
		return subm_Name;
	}

	public void setSubm_Name(String subm_Name) {
		this.subm_Name = subm_Name;
	}

	public Integer getDepa_Id() {
		return depa_Id;
	}

	public void setDepa_Id(Integer depa_Id) {
		this.depa_Id = depa_Id;
	}

	public String getDepa() {
		return depa;
	}

	public void setDepa(String depa) {
		this.depa = depa;
	}

	public Date getSubm_Time() {
		return subm_Time;
	}

	public void setSubm_Time(Date subm_Time) {
		this.subm_Time = subm_Time;
	}

	public Date getFinish_Time() {
		return finish_Time;
	}

	public void setFinish_Time(Date finish_Time) {
		this.finish_Time = finish_Time;
	}

	public String getProj_Status() {
		return proj_Status;
	}

	public void setProj_Status(String proj_Status) {
		this.proj_Status = proj_Status;
	}

	public Boolean getIS_TY() {
		return IS_TY;
	}

	public void setIS_TY(Boolean iS_TY) {
		IS_TY = iS_TY;
	}

	public String getDb_ms() {
		return db_ms;
	}

	public void setDb_ms(String db_ms) {
		this.db_ms = db_ms;
	}

	public String getSpzt() {
		return spzt;
	}

	public void setSpzt(String spzt) {
		this.spzt = spzt;
	}

	public String getTjTime() {
		return tjTime;
	}

	public void setTjTime(String tjTime) {
		this.tjTime = tjTime;
	}

	public String getNextCZ() {
		return nextCZ;
	}

	public void setNextCZ(String nextCZ) {
		this.nextCZ = nextCZ;
	}

	@Override
	public String toString() {
		return "Foll_up_Proj [proj_Id=" + proj_Id + ", proj_Code=" + proj_Code + ", budget_Name=" + budget_Name
				+ ", budget_Amount=" + budget_Amount + ", plan_Cont_Date=" + plan_Cont_Date + ", bp_method=" + bp_method
				+ ", cust_Unit=" + cust_Unit + ", cust_Contact=" + cust_Contact + ", cust_Phone=" + cust_Phone
				+ ", offi_Tel=" + offi_Tel + ", proj_Succ_Rate=" + proj_Succ_Rate + ", our_Unit=" + our_Unit
				+ ", user_Id=" + user_Id + ", user_Name=" + user_Name + ", memo_1=" + memo_1 + ", appr_Status="
				+ appr_Status + ", subm_User_Id=" + subm_User_Id + ", subm_Name=" + subm_Name + ", depa_Id=" + depa_Id
				+ ", depa=" + depa + ", subm_Time=" + subm_Time + ", finish_Time=" + finish_Time + ", proj_Status="
				+ proj_Status + ", IS_TY=" + IS_TY + ", db_ms=" + db_ms + ", plan_cont_date=" + plan_cont_date
				+ ", spzt=" + spzt + ", tjTime=" + tjTime + ", nextCZ=" + nextCZ + "]";
	}

}
