package com.edge.utils;

/**
 * 招标采购方式字典实体类
 * 
 * @author NingCG
 *
 */
public class BP_DM_METHOD {
	private Integer bp_Method_Id;// 主键
	private String bp_Method_Name;// 招标采购方式名称
	private String bp_Method_DH;// 招标采购方式代号

	public Integer getBp_Method_Id() {
		return bp_Method_Id;
	}

	public void setBp_Method_Id(Integer bp_Method_Id) {
		this.bp_Method_Id = bp_Method_Id;
	}

	public String getBp_Method_Name() {
		return bp_Method_Name;
	}

	public void setBp_Method_Name(String bp_Method_Name) {
		this.bp_Method_Name = bp_Method_Name;
	}

	public String getBp_Method_DH() {
		return bp_Method_DH;
	}

	public void setBp_Method_DH(String bp_Method_DH) {
		this.bp_Method_DH = bp_Method_DH;
	}

	@Override
	public String toString() {
		return "BP_DM_METHOD [bp_Method_Id=" + bp_Method_Id + ", bp_Method_Name=" + bp_Method_Name + ", bp_Method_DH="
				+ bp_Method_DH + "]";
	}

}
