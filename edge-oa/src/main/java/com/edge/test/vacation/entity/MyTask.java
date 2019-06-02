package com.edge.test.vacation.entity;

import java.util.Date;

/**
 * 我的任务实体类（产生我的代办）
 * 
 * @author NingCG
 *
 */
public class MyTask {
	private String ID_;
	private String REV_;
	private String EXECUTION_ID_;
	private String PROC_INST_ID_;
	private String PROC_DEF_ID_;
	private String NAME_;
	private String PARENT_TASK_ID_;
	private String DESCRIPTION_;
	private String TASK_DEF_KEY_;
	private String OWNER_;
	private String ASSIGNEE_;
	private String DELEGATION_;
	private Integer PRIORITY_;
	private Date CREATE_TIME_;
	private Date DUE_DATE_;
	private String CATEGORY_;
	private Integer SUSPENSION_STATE_;
	private String TENANT_ID_;
	private String FORM_KEY_;

	// 辅助字段代办任务描述
	private String taskDecription;
	// 辅助字段创建时间
	private String startTime;

	public String getID_() {
		return ID_;
	}

	public void setID_(String iD_) {
		ID_ = iD_;
	}

	public String getREV_() {
		return REV_;
	}

	public void setREV_(String rEV_) {
		REV_ = rEV_;
	}

	public String getEXECUTION_ID_() {
		return EXECUTION_ID_;
	}

	public void setEXECUTION_ID_(String eXECUTION_ID_) {
		EXECUTION_ID_ = eXECUTION_ID_;
	}

	public String getPROC_INST_ID_() {
		return PROC_INST_ID_;
	}

	public void setPROC_INST_ID_(String pROC_INST_ID_) {
		PROC_INST_ID_ = pROC_INST_ID_;
	}

	public String getPROC_DEF_ID_() {
		return PROC_DEF_ID_;
	}

	public void setPROC_DEF_ID_(String pROC_DEF_ID_) {
		PROC_DEF_ID_ = pROC_DEF_ID_;
	}

	public String getNAME_() {
		return NAME_;
	}

	public void setNAME_(String nAME_) {
		NAME_ = nAME_;
	}

	public String getPARENT_TASK_ID_() {
		return PARENT_TASK_ID_;
	}

	public void setPARENT_TASK_ID_(String pARENT_TASK_ID_) {
		PARENT_TASK_ID_ = pARENT_TASK_ID_;
	}

	public String getDESCRIPTION_() {
		return DESCRIPTION_;
	}

	public void setDESCRIPTION_(String dESCRIPTION_) {
		DESCRIPTION_ = dESCRIPTION_;
	}

	public String getTASK_DEF_KEY_() {
		return TASK_DEF_KEY_;
	}

	public void setTASK_DEF_KEY_(String tASK_DEF_KEY_) {
		TASK_DEF_KEY_ = tASK_DEF_KEY_;
	}

	public String getOWNER_() {
		return OWNER_;
	}

	public void setOWNER_(String oWNER_) {
		OWNER_ = oWNER_;
	}

	public String getASSIGNEE_() {
		return ASSIGNEE_;
	}

	public void setASSIGNEE_(String aSSIGNEE_) {
		ASSIGNEE_ = aSSIGNEE_;
	}

	public String getDELEGATION_() {
		return DELEGATION_;
	}

	public void setDELEGATION_(String dELEGATION_) {
		DELEGATION_ = dELEGATION_;
	}

	public Integer getPRIORITY_() {
		return PRIORITY_;
	}

	public void setPRIORITY_(Integer pRIORITY_) {
		PRIORITY_ = pRIORITY_;
	}

	public Date getCREATE_TIME_() {
		return CREATE_TIME_;
	}

	public void setCREATE_TIME_(Date cREATE_TIME_) {
		CREATE_TIME_ = cREATE_TIME_;
	}

	public Date getDUE_DATE_() {
		return DUE_DATE_;
	}

	public void setDUE_DATE_(Date dUE_DATE_) {
		DUE_DATE_ = dUE_DATE_;
	}

	public String getCATEGORY_() {
		return CATEGORY_;
	}

	public void setCATEGORY_(String cATEGORY_) {
		CATEGORY_ = cATEGORY_;
	}

	public Integer getSUSPENSION_STATE_() {
		return SUSPENSION_STATE_;
	}

	public void setSUSPENSION_STATE_(Integer sUSPENSION_STATE_) {
		SUSPENSION_STATE_ = sUSPENSION_STATE_;
	}

	public String getTENANT_ID_() {
		return TENANT_ID_;
	}

	public void setTENANT_ID_(String tENANT_ID_) {
		TENANT_ID_ = tENANT_ID_;
	}

	public String getFORM_KEY_() {
		return FORM_KEY_;
	}

	public void setFORM_KEY_(String fORM_KEY_) {
		FORM_KEY_ = fORM_KEY_;
	}

	public String getTaskDecription() {
		return taskDecription;
	}

	public void setTaskDecription(String taskDecription) {
		this.taskDecription = taskDecription;
	}

	public String getStartTime() {
		return startTime;
	}

	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}

	@Override
	public String toString() {
		return "MyTask [ID_=" + ID_ + ", REV_=" + REV_ + ", EXECUTION_ID_=" + EXECUTION_ID_ + ", PROC_INST_ID_="
				+ PROC_INST_ID_ + ", PROC_DEF_ID_=" + PROC_DEF_ID_ + ", NAME_=" + NAME_ + ", PARENT_TASK_ID_="
				+ PARENT_TASK_ID_ + ", DESCRIPTION_=" + DESCRIPTION_ + ", TASK_DEF_KEY_=" + TASK_DEF_KEY_ + ", OWNER_="
				+ OWNER_ + ", ASSIGNEE_=" + ASSIGNEE_ + ", DELEGATION_=" + DELEGATION_ + ", PRIORITY_=" + PRIORITY_
				+ ", CREATE_TIME_=" + CREATE_TIME_ + ", DUE_DATE_=" + DUE_DATE_ + ", CATEGORY_=" + CATEGORY_
				+ ", SUSPENSION_STATE_=" + SUSPENSION_STATE_ + ", TENANT_ID_=" + TENANT_ID_ + ", FORM_KEY_=" + FORM_KEY_
				+ ", taskDecription=" + taskDecription + ", startTime=" + startTime + "]";
	}

}
