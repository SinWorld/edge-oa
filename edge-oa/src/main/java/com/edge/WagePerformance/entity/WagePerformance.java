package com.edge.WagePerformance.entity;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

/**
 * 工资绩效实体类
 * 
 * @author NingCG
 *
 */
public class WagePerformance {
	private Integer wage_per_Id;// 主键
	private String wage_per_Code;// 审批编号
	@DateTimeFormat(pattern = "yyyy-MM")
	private Date wage_per_Month;// 月份
	private Integer wage_per_Name;// 员工
	private Integer wage_per_Department;// 所属部门
	private Integer wage_per_Position;// 所属岗位
	private Double wage_per_BaseWage;// 基本工资
	private Double wage_per_PositionWage;// 岗位工资
	private Double wage_per_AchievementBonus;// 绩效奖金
	private Double wage_per_OverTimePay;// 加班工资
	private Double wage_per_Sbjfjs;// 社保缴费基数
	private Double wage_per_Sbgrbf;// 社保个人部分
	private Double wage_per_Sbdwbf;// 社保单位部分
	private Double wage_per_Sbbt;// 社保补贴
	private Double wage_per_Qt;// 其它
	private Double wage_per_Yfgz;// 应发工资
	private Double wage_per_Wcqkk;// 未出勤扣款
	private Double wage_per_Qtkk;// 其它扣款
	private Double wage_per_Sbdk;// 社保代扣
	private Double wage_per_Gsdk;// 个税代扣
	private Double wage_per_Sfgz;// 实发工资
	private Integer wage_per_Yglx;// 员工类型
	private String wage_per_Tbr;// 填报人
	private String wage_per_Bz;// 备注
	private Integer appr_Status;// 审批状态
	private String nextcz;// 下一步操作
	private String db_Ms;// 待办描述
	private Boolean is_wcgztb;// 是否完成工资填报
	private Boolean is_ffdj;// 是否发放登记
	private Double wage_per_dhf;// 电话费

	// 辅助属性
	private String user_Name;// 员工姓名
	private String user_Department;// 部门名称
	private String user_Posittion;// 岗位名称
	private String yglx_name;// 员工类型名称
	private String appr_status_name;// 审批状态
	private String month;// 月份

	public Integer getWage_per_Id() {
		return wage_per_Id;
	}

	public void setWage_per_Id(Integer wage_per_Id) {
		this.wage_per_Id = wage_per_Id;
	}

	public String getWage_per_Code() {
		return wage_per_Code;
	}

	public void setWage_per_Code(String wage_per_Code) {
		this.wage_per_Code = wage_per_Code;
	}

	public Date getWage_per_Month() {
		return wage_per_Month;
	}

	public void setWage_per_Month(Date wage_per_Month) {
		this.wage_per_Month = wage_per_Month;
	}

	public Integer getWage_per_Name() {
		return wage_per_Name;
	}

	public void setWage_per_Name(Integer wage_per_Name) {
		this.wage_per_Name = wage_per_Name;
	}

	public Integer getWage_per_Department() {
		return wage_per_Department;
	}

	public void setWage_per_Department(Integer wage_per_Department) {
		this.wage_per_Department = wage_per_Department;
	}

	public Double getWage_per_BaseWage() {
		return wage_per_BaseWage;
	}

	public void setWage_per_BaseWage(Double wage_per_BaseWage) {
		this.wage_per_BaseWage = wage_per_BaseWage;
	}

	public Double getWage_per_PositionWage() {
		return wage_per_PositionWage;
	}

	public void setWage_per_PositionWage(Double wage_per_PositionWage) {
		this.wage_per_PositionWage = wage_per_PositionWage;
	}

	public Integer getWage_per_Position() {
		return wage_per_Position;
	}

	public void setWage_per_Position(Integer wage_per_Position) {
		this.wage_per_Position = wage_per_Position;
	}

	public Double getWage_per_AchievementBonus() {
		return wage_per_AchievementBonus;
	}

	public void setWage_per_AchievementBonus(Double wage_per_AchievementBonus) {
		this.wage_per_AchievementBonus = wage_per_AchievementBonus;
	}

	public Double getWage_per_OverTimePay() {
		return wage_per_OverTimePay;
	}

	public void setWage_per_OverTimePay(Double wage_per_OverTimePay) {
		this.wage_per_OverTimePay = wage_per_OverTimePay;
	}

	public Double getWage_per_Sbjfjs() {
		return wage_per_Sbjfjs;
	}

	public void setWage_per_Sbjfjs(Double wage_per_Sbjfjs) {
		this.wage_per_Sbjfjs = wage_per_Sbjfjs;
	}

	public Double getWage_per_Sbgrbf() {
		return wage_per_Sbgrbf;
	}

	public void setWage_per_Sbgrbf(Double wage_per_Sbgrbf) {
		this.wage_per_Sbgrbf = wage_per_Sbgrbf;
	}

	public Double getWage_per_Sbdwbf() {
		return wage_per_Sbdwbf;
	}

	public void setWage_per_Sbdwbf(Double wage_per_Sbdwbf) {
		this.wage_per_Sbdwbf = wage_per_Sbdwbf;
	}

	public Double getWage_per_Sbbt() {
		return wage_per_Sbbt;
	}

	public void setWage_per_Sbbt(Double wage_per_Sbbt) {
		this.wage_per_Sbbt = wage_per_Sbbt;
	}

	public Double getWage_per_Qt() {
		return wage_per_Qt;
	}

	public void setWage_per_Qt(Double wage_per_Qt) {
		this.wage_per_Qt = wage_per_Qt;
	}

	public Double getWage_per_Yfgz() {
		return wage_per_Yfgz;
	}

	public void setWage_per_Yfgz(Double wage_per_Yfgz) {
		this.wage_per_Yfgz = wage_per_Yfgz;
	}

	public Double getWage_per_Wcqkk() {
		return wage_per_Wcqkk;
	}

	public void setWage_per_Wcqkk(Double wage_per_Wcqkk) {
		this.wage_per_Wcqkk = wage_per_Wcqkk;
	}

	public Double getWage_per_Qtkk() {
		return wage_per_Qtkk;
	}

	public void setWage_per_Qtkk(Double wage_per_Qtkk) {
		this.wage_per_Qtkk = wage_per_Qtkk;
	}

	public Double getWage_per_Sbdk() {
		return wage_per_Sbdk;
	}

	public void setWage_per_Sbdk(Double wage_per_Sbdk) {
		this.wage_per_Sbdk = wage_per_Sbdk;
	}

	public Double getWage_per_Gsdk() {
		return wage_per_Gsdk;
	}

	public void setWage_per_Gsdk(Double wage_per_Gsdk) {
		this.wage_per_Gsdk = wage_per_Gsdk;
	}

	public Double getWage_per_Sfgz() {
		return wage_per_Sfgz;
	}

	public void setWage_per_Sfgz(Double wage_per_Sfgz) {
		this.wage_per_Sfgz = wage_per_Sfgz;
	}

	public Integer getWage_per_Yglx() {
		return wage_per_Yglx;
	}

	public void setWage_per_Yglx(Integer wage_per_Yglx) {
		this.wage_per_Yglx = wage_per_Yglx;
	}

	public String getWage_per_Tbr() {
		return wage_per_Tbr;
	}

	public void setWage_per_Tbr(String wage_per_Tbr) {
		this.wage_per_Tbr = wage_per_Tbr;
	}

	public String getWage_per_Bz() {
		return wage_per_Bz;
	}

	public void setWage_per_Bz(String wage_per_Bz) {
		this.wage_per_Bz = wage_per_Bz;
	}

	public Integer getAppr_Status() {
		return appr_Status;
	}

	public void setAppr_Status(Integer appr_Status) {
		this.appr_Status = appr_Status;
	}

	public String getNextCz() {
		return nextcz;
	}

	public void setNextCz(String nextCz) {
		this.nextcz = nextCz;
	}

	public String getDb_Ms() {
		return db_Ms;
	}

	public void setDb_Ms(String db_Ms) {
		this.db_Ms = db_Ms;
	}

	public Boolean getIs_wcgztb() {
		return is_wcgztb;
	}

	public void setIs_wcgztb(Boolean is_wcgztb) {
		this.is_wcgztb = is_wcgztb;
	}

	public String getUser_Name() {
		return user_Name;
	}

	public void setUser_Name(String user_Name) {
		this.user_Name = user_Name;
	}

	public String getUser_Department() {
		return user_Department;
	}

	public void setUser_Department(String user_Department) {
		this.user_Department = user_Department;
	}

	public String getUser_Posittion() {
		return user_Posittion;
	}

	public void setUser_Posittion(String user_Posittion) {
		this.user_Posittion = user_Posittion;
	}

	public String getYglx_name() {
		return yglx_name;
	}

	public void setYglx_name(String yglx_name) {
		this.yglx_name = yglx_name;
	}

	public String getAppr_status_name() {
		return appr_status_name;
	}

	public void setAppr_status_name(String appr_status_name) {
		this.appr_status_name = appr_status_name;
	}

	public Boolean getIs_ffdj() {
		return is_ffdj;
	}

	public void setIs_ffdj(Boolean is_ffdj) {
		this.is_ffdj = is_ffdj;
	}

	public String getMonth() {
		return month;
	}

	public void setMonth(String month) {
		this.month = month;
	}

	public String getNextcz() {
		return nextcz;
	}

	public void setNextcz(String nextcz) {
		this.nextcz = nextcz;
	}

	public Double getWage_per_dhf() {
		return wage_per_dhf;
	}

	public void setWage_per_dhf(Double wage_per_dhf) {
		this.wage_per_dhf = wage_per_dhf;
	}

	@Override
	public String toString() {
		return "WagePerformance [wage_per_Id=" + wage_per_Id + ", wage_per_Code=" + wage_per_Code + ", wage_per_Month="
				+ wage_per_Month + ", wage_per_Name=" + wage_per_Name + ", wage_per_Department=" + wage_per_Department
				+ ", wage_per_Position=" + wage_per_Position + ", wage_per_BaseWage=" + wage_per_BaseWage
				+ ", wage_per_PositionWage=" + wage_per_PositionWage + ", wage_per_AchievementBonus="
				+ wage_per_AchievementBonus + ", wage_per_OverTimePay=" + wage_per_OverTimePay + ", wage_per_Sbjfjs="
				+ wage_per_Sbjfjs + ", wage_per_Sbgrbf=" + wage_per_Sbgrbf + ", wage_per_Sbdwbf=" + wage_per_Sbdwbf
				+ ", wage_per_Sbbt=" + wage_per_Sbbt + ", wage_per_Qt=" + wage_per_Qt + ", wage_per_Yfgz="
				+ wage_per_Yfgz + ", wage_per_Wcqkk=" + wage_per_Wcqkk + ", wage_per_Qtkk=" + wage_per_Qtkk
				+ ", wage_per_Sbdk=" + wage_per_Sbdk + ", wage_per_Gsdk=" + wage_per_Gsdk + ", wage_per_Sfgz="
				+ wage_per_Sfgz + ", wage_per_Yglx=" + wage_per_Yglx + ", wage_per_Tbr=" + wage_per_Tbr
				+ ", wage_per_Bz=" + wage_per_Bz + ", appr_Status=" + appr_Status + ", nextcz=" + nextcz + ", db_Ms="
				+ db_Ms + ", is_wcgztb=" + is_wcgztb + ", is_ffdj=" + is_ffdj + ", wage_per_dhf=" + wage_per_dhf
				+ ", user_Name=" + user_Name + ", user_Department=" + user_Department + ", user_Posittion="
				+ user_Posittion + ", yglx_name=" + yglx_name + ", appr_status_name=" + appr_status_name + ", month="
				+ month + "]";
	}

}
