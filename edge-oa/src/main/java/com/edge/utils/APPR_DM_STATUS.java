package com.edge.utils;

/**
 * 审批状态字典实体类
 * 
 * @author NingCG
 *
 */
public class APPR_DM_STATUS {
	private Integer appr_Status_Id;// 主键
	private String appr_Status_Name;// 审批状态名称
	private String appr_Status_DH;// 审批状态代号

	public Integer getAppr_Status_Id() {
		return appr_Status_Id;
	}

	public void setAppr_Status_Id(Integer appr_Status_Id) {
		this.appr_Status_Id = appr_Status_Id;
	}

	public String getAppr_Status_Name() {
		return appr_Status_Name;
	}

	public void setAppr_Status_Name(String appr_Status_Name) {
		this.appr_Status_Name = appr_Status_Name;
	}

	public String getAppr_Status_DH() {
		return appr_Status_DH;
	}

	public void setAppr_Status_DH(String appr_Status_DH) {
		this.appr_Status_DH = appr_Status_DH;
	}

	@Override
	public String toString() {
		return "APPR_DM_STATUS [appr_Status_Id=" + appr_Status_Id + ", appr_Status_Name=" + appr_Status_Name
				+ ", appr_Status_DH=" + appr_Status_DH + "]";
	}

}
