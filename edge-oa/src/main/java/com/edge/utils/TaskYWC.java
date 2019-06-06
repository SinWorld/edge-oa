package com.edge.utils;

import java.util.Date;

/**
 * 已完成
 * 
 * @author NingCG
 *
 */
public class TaskYWC {
	private String ID_;// 主键
	private String ASSIGNEE_;// 发起人
	private String FORM_KEY_;// 请求页面action
	private String BUSINESS_KEY_;// 业务数据主键
	private String PROC_DEF_ID_;// 流程部署Id
	private Date START_TIME_;// 创建时间
	private Date END_TIME_;// 完成时间
	private String NAME_;// 节点名称

	// 辅助字段代办任务描述
	private String taskDecription;
	// 辅助字段开始时间和结束时间
	private String beginTime;
	private String endTime;

	public String getID_() {
		return ID_;
	}

	public void setID_(String iD_) {
		ID_ = iD_;
	}

	public String getASSIGNEE_() {
		return ASSIGNEE_;
	}

	public void setASSIGNEE_(String aSSIGNEE_) {
		ASSIGNEE_ = aSSIGNEE_;
	}

	public String getFORM_KEY_() {
		return FORM_KEY_;
	}

	public void setFORM_KEY_(String fORM_KEY_) {
		FORM_KEY_ = fORM_KEY_;
	}

	public String getBUSINESS_KEY_() {
		return BUSINESS_KEY_;
	}

	public void setBUSINESS_KEY_(String bUSINESS_KEY_) {
		BUSINESS_KEY_ = bUSINESS_KEY_;
	}

	public Date getSTART_TIME_() {
		return START_TIME_;
	}

	public void setSTART_TIME_(Date sTART_TIME_) {
		START_TIME_ = sTART_TIME_;
	}

	public Date getEND_TIME_() {
		return END_TIME_;
	}

	public void setEND_TIME_(Date eND_TIME_) {
		END_TIME_ = eND_TIME_;
	}

	public String getTaskDecription() {
		return taskDecription;
	}

	public void setTaskDecription(String taskDecription) {
		this.taskDecription = taskDecription;
	}

	public String getNAME_() {
		return NAME_;
	}

	public void setNAME_(String nAME_) {
		NAME_ = nAME_;
	}

	public String getBeginTime() {
		return beginTime;
	}

	public void setBeginTime(String beginTime) {
		this.beginTime = beginTime;
	}

	public String getEndTime() {
		return endTime;
	}

	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}

	public String getPROC_DEF_ID_() {
		return PROC_DEF_ID_;
	}

	public void setPROC_DEF_ID_(String pROC_DEF_ID_) {
		PROC_DEF_ID_ = pROC_DEF_ID_;
	}

	@Override
	public String toString() {
		return "TaskYWC [ID_=" + ID_ + ", ASSIGNEE_=" + ASSIGNEE_ + ", FORM_KEY_=" + FORM_KEY_ + ", BUSINESS_KEY_="
				+ BUSINESS_KEY_ + ", PROC_DEF_ID_=" + PROC_DEF_ID_ + ", START_TIME_=" + START_TIME_ + ", END_TIME_="
				+ END_TIME_ + ", NAME_=" + NAME_ + ", taskDecription=" + taskDecription + ", beginTime=" + beginTime
				+ ", endTime=" + endTime + "]";
	}

}
