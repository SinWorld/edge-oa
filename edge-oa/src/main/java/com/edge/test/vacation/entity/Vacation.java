package com.edge.test.vacation.entity;

import java.util.Date;

/**
 * 请假实体类
 * 
 * @author NingCG
 *
 */
public class Vacation {
	private Integer vacation_id;// 主键
	private Integer days;// 请假天数
	private String reason;// 请假原因
	private Date beginDate;// 请假时间
	private String remark;// 备注
	private Integer user_id;// 请假人
	private String state;// 请假状态

	public Integer getVacation_id() {
		return vacation_id;
	}

	public void setVacation_id(Integer vacation_id) {
		this.vacation_id = vacation_id;
	}

	public Integer getDays() {
		return days;
	}

	public void setDays(Integer days) {
		this.days = days;
	}

	public Date getBeginDate() {
		return beginDate;
	}

	public void setBeginDate(Date beginDate) {
		this.beginDate = beginDate;
	}

	public String getReason() {
		return reason;
	}

	public void setReason(String reason) {
		this.reason = reason;
	}

	public Integer getUser_id() {
		return user_id;
	}

	public void setUser_id(Integer user_id) {
		this.user_id = user_id;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	@Override
	public String toString() {
		return "Vacation [vacation_id=" + vacation_id + ", days=" + days + ", reason=" + reason + ", beginDate="
				+ beginDate + ", remark=" + remark + ", user_id=" + user_id + ", state=" + state + "]";
	}

}
