package com.edge.utils;

import java.sql.Blob;
import java.util.Date;

import com.edge.system.role.entity.Privilege;

/**
 * 评审意见实体类
 * 
 * @author NingCG
 *
 */
public class ReviewOpinion {
	private String ID_;// 主键
	private String TYPE_;// 类型
	private Date TIME_;// 审批时间
	private String USER_ID_;// 审批用户主键
	private String TASK_ID_;// 任务Id

	private String PROC_INST_ID_;// 流程实例Id
	private String ACTION_;
	private String MESSAGE_;// 审批信息
	private Blob FULL_MSG_;

	// 辅助属性
	private String userName;// 审批人名称
	private String time;// 审批时间
	private String result;// 审批结果
	private String advise;// 审批意见
	private String procinstById;// 流程部署Id

	public String getID_() {
		return ID_;
	}

	public void setID_(String iD_) {
		ID_ = iD_;
	}

	public String getTYPE_() {
		return TYPE_;
	}

	public void setTYPE_(String tYPE_) {
		TYPE_ = tYPE_;
	}

	public Date getTIME_() {
		return TIME_;
	}

	public void setTIME_(Date tIME_) {
		TIME_ = tIME_;
	}

	public String getUSER_ID_() {
		return USER_ID_;
	}

	public void setUSER_ID_(String uSER_ID_) {
		USER_ID_ = uSER_ID_;
	}

	public String getTASK_ID_() {
		return TASK_ID_;
	}

	public void setTASK_ID_(String tASK_ID_) {
		TASK_ID_ = tASK_ID_;
	}

	public String getPROC_INST_ID_() {
		return PROC_INST_ID_;
	}

	public void setPROC_INST_ID_(String pROC_INST_ID_) {
		PROC_INST_ID_ = pROC_INST_ID_;
	}

	public String getACTION_() {
		return ACTION_;
	}

	public void setACTION_(String aCTION_) {
		ACTION_ = aCTION_;
	}

	public String getMESSAGE_() {
		return MESSAGE_;
	}

	public void setMESSAGE_(String mESSAGE_) {
		MESSAGE_ = mESSAGE_;
	}

	public Blob getFULL_MSG_() {
		return FULL_MSG_;
	}

	public void setFULL_MSG_(Blob fULL_MSG_) {
		FULL_MSG_ = fULL_MSG_;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
	}

	public String getAdvise() {
		return advise;
	}

	public void setAdvise(String advise) {
		this.advise = advise;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getProcinstById() {
		return procinstById;
	}

	public void setProcinstById(String procinstById) {
		this.procinstById = procinstById;
	}
	

	@Override
	public String toString() {
		return "ReviewOpinion [ID_=" + ID_ + ", TYPE_=" + TYPE_ + ", TIME_=" + TIME_ + ", USER_ID_=" + USER_ID_
				+ ", TASK_ID_=" + TASK_ID_ + ", PROC_INST_ID_=" + PROC_INST_ID_ + ", ACTION_=" + ACTION_ + ", MESSAGE_="
				+ MESSAGE_ + ", FULL_MSG_=" + FULL_MSG_ + ", userName=" + userName + ", time=" + time + ", result="
				+ result + ", advise=" + advise + ", procinstById=" + procinstById + "]";
	}

}
