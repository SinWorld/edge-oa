package com.edge.projman.xshtdj.entity;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

/**
 * 销售合同
 * 
 * @author NingCG
 *
 */
public class XiaoShouHT {
	private Integer proj_Info_Id;// 主键
	private String proj_Code;// 销售合同编号
	private String cont_Number;// 合同档号
	private String proj_Name;// 合同名称
	private String prod_Name;// 货物（产品）内容
	private Integer bp_Method;// 招标采购方式
	private Double cont_Amount;// 合同金额
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date cont_Date;// 签订日期
	private String cust_Unit;// 客户单位名称
	private String cust_Contact;// 客户负责人
	private String cust_Phone;// 客户手机号
	private String offi_Tel;// 客户固定电话
	private String our_Unit;// 我方单位名称
	private Integer user_Id;// 我方负责人主键
	private String user_Name;// 我方负责人姓名
	private Integer depa_Id;// 部门主键
	private String depa;// 部门名称
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date cont_Compdate;// 合同计划签订日期
	private Double payment_Amount;// 回款到账金额
	private Double qual_Ratio;// 质保金比列
	private Double qual_Bonds;// 质保金金额
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date qual_Expiredate;// 质保金到期日期
	private Double purc_Cost;// 进项采购成本（含税金）
	private Double proj_Taxes;// 增值税金及附加
	private Double winbid_Servicefee;// 中标服务费
	private Double capi_Usefee;// 资金占用费
	private Double proj_Materialcost;// 项目辅材费
	private Double proj_Othercost;// 项目配合费用
	private Double proj_Profit;// 项目利润
	private Double pre_Sale_Suppratio;// 售前技术支持部门分成比率
	private Double pre_Sale_Suppfee;// 售前技术支持部门分成金额
	private Double proj_Implratio;// 项目实施服务部分成比率
	private Double proj_Implfee;// 项目实施服务部分成金额
	private Double divi_Profit;// 项目分成利润
	private Double sales_Ratio;// 销售负责人分成比率
	private Double sales_Fee;// 销售负责人分成金额
	private Double qual_Prof_Suppfee;// 质保金到帐售前分成金额
	private Double qual_Prof_Implfee;// 质保金到帐实施服务分成金额
	private Double qual_Prof_Salesfee;// 质保金到帐销售负责人分成金额
	private Boolean winn_Bid;// 是否中标转合同(0:未中标 1：中标)
	private Integer appr_Status;// 审批状态
	private Integer subm_User_Id;// 提交用户主键
	private String subm_Name;// 提交人姓名
	private Integer subm_Depa_Id;// 提交人部门代码
	private String subm_Depa;// 提交人部门名称
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date subm_Time;// 提交时间
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date finish_Time;// 完成时间
	private Boolean subm_Flag;// 提交标识
	private Boolean check_Flag;// 审核标识
	private Integer proj_Id;// 项目信息
	private Boolean is_LX;// 是否立项(0:未立项，1：已立项)
	private String nextCZ;// 下一步操作
	private String db_MS;// 代办任务描述
	// 辅助属性
	private String spzt;// 审批状态
	private String tjTime;// 提交时间
	private String qdrq;// 签订日期
	private String htjhwcrq;// 合同计划完成日期
	private String zbjdqrq;// 质保金到期日期

	public Integer getProj_Id() {
		return proj_Id;
	}

	public void setProj_Id(Integer proj_Id) {
		this.proj_Id = proj_Id;
	}

	public Integer getProj_Info_Id() {
		return proj_Info_Id;
	}

	public void setProj_Info_Id(Integer proj_Info_Id) {
		this.proj_Info_Id = proj_Info_Id;
	}

	public String getProj_Code() {
		return proj_Code;
	}

	public void setProj_Code(String proj_Code) {
		this.proj_Code = proj_Code;
	}

	public String getCont_Number() {
		return cont_Number;
	}

	public void setCont_Number(String cont_Number) {
		this.cont_Number = cont_Number;
	}

	public String getProj_Name() {
		return proj_Name;
	}

	public void setProj_Name(String proj_Name) {
		this.proj_Name = proj_Name;
	}

	public String getProd_Name() {
		return prod_Name;
	}

	public void setProd_Name(String prod_Name) {
		this.prod_Name = prod_Name;
	}

	public Integer getBp_Method() {
		return bp_Method;
	}

	public void setBp_Method(Integer bp_Method) {
		this.bp_Method = bp_Method;
	}

	public Double getCont_Amount() {
		return cont_Amount;
	}

	public void setCont_Amount(Double cont_Amount) {
		this.cont_Amount = cont_Amount;
	}

	public Date getCont_Date() {
		return cont_Date;
	}

	public void setCont_Date(Date cont_Date) {
		this.cont_Date = cont_Date;
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

	public Date getCont_Compdate() {
		return cont_Compdate;
	}

	public void setCont_Compdate(Date cont_Compdate) {
		this.cont_Compdate = cont_Compdate;
	}

	public Double getPayment_Amount() {
		return payment_Amount;
	}

	public void setPayment_Amount(Double payment_Amount) {
		this.payment_Amount = payment_Amount;
	}

	public Double getQual_Ratio() {
		return qual_Ratio;
	}

	public void setQual_Ratio(Double qual_Ratio) {
		this.qual_Ratio = qual_Ratio;
	}

	public Double getQual_Bonds() {
		return qual_Bonds;
	}

	public void setQual_Bonds(Double qual_Bonds) {
		this.qual_Bonds = qual_Bonds;
	}

	public Date getQual_Expiredate() {
		return qual_Expiredate;
	}

	public void setQual_Expiredate(Date qual_Expiredate) {
		this.qual_Expiredate = qual_Expiredate;
	}

	public Double getPurc_Cost() {
		return purc_Cost;
	}

	public void setPurc_Cost(Double purc_Cost) {
		this.purc_Cost = purc_Cost;
	}

	public Double getProj_Taxes() {
		return proj_Taxes;
	}

	public void setProj_Taxes(Double proj_Taxes) {
		this.proj_Taxes = proj_Taxes;
	}

	public Double getWinbid_Servicefee() {
		return winbid_Servicefee;
	}

	public void setWinbid_Servicefee(Double winbid_Servicefee) {
		this.winbid_Servicefee = winbid_Servicefee;
	}

	public Double getCapi_Usefee() {
		return capi_Usefee;
	}

	public void setCapi_Usefee(Double capi_Usefee) {
		this.capi_Usefee = capi_Usefee;
	}

	public Double getProj_Materialcost() {
		return proj_Materialcost;
	}

	public void setProj_Materialcost(Double proj_Materialcost) {
		this.proj_Materialcost = proj_Materialcost;
	}

	public Double getProj_Othercost() {
		return proj_Othercost;
	}

	public void setProj_Othercost(Double proj_Othercost) {
		this.proj_Othercost = proj_Othercost;
	}

	public Double getProj_Profit() {
		return proj_Profit;
	}

	public void setProj_Profit(Double proj_Profit) {
		this.proj_Profit = proj_Profit;
	}

	public Double getPre_Sale_Suppratio() {
		return pre_Sale_Suppratio;
	}

	public void setPre_Sale_Suppratio(Double pre_Sale_Suppratio) {
		this.pre_Sale_Suppratio = pre_Sale_Suppratio;
	}

	public Double getPre_Sale_Suppfee() {
		return pre_Sale_Suppfee;
	}

	public void setPre_Sale_Suppfee(Double pre_Sale_Suppfee) {
		this.pre_Sale_Suppfee = pre_Sale_Suppfee;
	}

	public Double getProj_Implratio() {
		return proj_Implratio;
	}

	public void setProj_Implratio(Double proj_Implratio) {
		this.proj_Implratio = proj_Implratio;
	}

	public Double getProj_Implfee() {
		return proj_Implfee;
	}

	public void setProj_Implfee(Double proj_Implfee) {
		this.proj_Implfee = proj_Implfee;
	}

	public Double getDivi_Profit() {
		return divi_Profit;
	}

	public void setDivi_Profit(Double divi_Profit) {
		this.divi_Profit = divi_Profit;
	}

	public Double getSales_Ratio() {
		return sales_Ratio;
	}

	public void setSales_Ratio(Double sales_Ratio) {
		this.sales_Ratio = sales_Ratio;
	}

	public Double getSales_Fee() {
		return sales_Fee;
	}

	public void setSales_Fee(Double sales_Fee) {
		this.sales_Fee = sales_Fee;
	}

	public Double getQual_Prof_Suppfee() {
		return qual_Prof_Suppfee;
	}

	public void setQual_Prof_Suppfee(Double qual_Prof_Suppfee) {
		this.qual_Prof_Suppfee = qual_Prof_Suppfee;
	}

	public Double getQual_Prof_Implfee() {
		return qual_Prof_Implfee;
	}

	public void setQual_Prof_Implfee(Double qual_Prof_Implfee) {
		this.qual_Prof_Implfee = qual_Prof_Implfee;
	}

	public Double getQual_Prof_Salesfee() {
		return qual_Prof_Salesfee;
	}

	public void setQual_Prof_Salesfee(Double qual_Prof_Salesfee) {
		this.qual_Prof_Salesfee = qual_Prof_Salesfee;
	}

	public Boolean getWinn_Bid() {
		return winn_Bid;
	}

	public void setWinn_Bid(Boolean winn_Bid) {
		this.winn_Bid = winn_Bid;
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

	public Integer getSubm_Depa_Id() {
		return subm_Depa_Id;
	}

	public void setSubm_Depa_Id(Integer subm_Depa_Id) {
		this.subm_Depa_Id = subm_Depa_Id;
	}

	public String getSubm_Depa() {
		return subm_Depa;
	}

	public void setSubm_Depa(String subm_Depa) {
		this.subm_Depa = subm_Depa;
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

	public Boolean getSubm_Flag() {
		return subm_Flag;
	}

	public void setSubm_Flag(Boolean subm_Flag) {
		this.subm_Flag = subm_Flag;
	}

	public Boolean getCheck_Flag() {
		return check_Flag;
	}

	public void setCheck_Flag(Boolean check_Flag) {
		this.check_Flag = check_Flag;
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

	public Boolean getIs_LX() {
		return is_LX;
	}

	public void setIs_LX(Boolean is_LX) {
		this.is_LX = is_LX;
	}

	public String getNextCZ() {
		return nextCZ;
	}

	public void setNextCZ(String nextCZ) {
		this.nextCZ = nextCZ;
	}

	public String getDb_MS() {
		return db_MS;
	}

	public void setDb_MS(String db_MS) {
		this.db_MS = db_MS;
	}

	public String getQdrq() {
		return qdrq;
	}

	public void setQdrq(String qdrq) {
		this.qdrq = qdrq;
	}

	public String getHtjhwcrq() {
		return htjhwcrq;
	}

	public void setHtjhwcrq(String htjhwcrq) {
		this.htjhwcrq = htjhwcrq;
	}

	public String getZbjdqrq() {
		return zbjdqrq;
	}

	public void setZbjdqrq(String zbjdqrq) {
		this.zbjdqrq = zbjdqrq;
	}

	@Override
	public String toString() {
		return "XiaoShouHT [proj_Info_Id=" + proj_Info_Id + ", proj_Code=" + proj_Code + ", cont_Number=" + cont_Number
				+ ", proj_Name=" + proj_Name + ", prod_Name=" + prod_Name + ", bp_Method=" + bp_Method
				+ ", cont_Amount=" + cont_Amount + ", cont_Date=" + cont_Date + ", cust_Unit=" + cust_Unit
				+ ", cust_Contact=" + cust_Contact + ", cust_Phone=" + cust_Phone + ", offi_Tel=" + offi_Tel
				+ ", our_Unit=" + our_Unit + ", user_Id=" + user_Id + ", user_Name=" + user_Name + ", depa_Id="
				+ depa_Id + ", depa=" + depa + ", cont_Compdate=" + cont_Compdate + ", payment_Amount=" + payment_Amount
				+ ", qual_Ratio=" + qual_Ratio + ", qual_Bonds=" + qual_Bonds + ", qual_Expiredate=" + qual_Expiredate
				+ ", purc_Cost=" + purc_Cost + ", proj_Taxes=" + proj_Taxes + ", winbid_Servicefee=" + winbid_Servicefee
				+ ", capi_Usefee=" + capi_Usefee + ", proj_Materialcost=" + proj_Materialcost + ", proj_Othercost="
				+ proj_Othercost + ", proj_Profit=" + proj_Profit + ", pre_Sale_Suppratio=" + pre_Sale_Suppratio
				+ ", pre_Sale_Suppfee=" + pre_Sale_Suppfee + ", proj_Implratio=" + proj_Implratio + ", proj_Implfee="
				+ proj_Implfee + ", divi_Profit=" + divi_Profit + ", sales_Ratio=" + sales_Ratio + ", sales_Fee="
				+ sales_Fee + ", qual_Prof_Suppfee=" + qual_Prof_Suppfee + ", qual_Prof_Implfee=" + qual_Prof_Implfee
				+ ", qual_Prof_Salesfee=" + qual_Prof_Salesfee + ", winn_Bid=" + winn_Bid + ", appr_Status="
				+ appr_Status + ", subm_User_Id=" + subm_User_Id + ", subm_Name=" + subm_Name + ", subm_Depa_Id="
				+ subm_Depa_Id + ", subm_Depa=" + subm_Depa + ", subm_Time=" + subm_Time + ", finish_Time="
				+ finish_Time + ", subm_Flag=" + subm_Flag + ", check_Flag=" + check_Flag + ", proj_Id=" + proj_Id
				+ ", is_LX=" + is_LX + ", nextCZ=" + nextCZ + ", db_MS=" + db_MS + ", spzt=" + spzt + ", tjTime="
				+ tjTime + ", qdrq=" + qdrq + ", htjhwcrq=" + htjhwcrq + ", zbjdqrq=" + zbjdqrq + "]";
	}

}
