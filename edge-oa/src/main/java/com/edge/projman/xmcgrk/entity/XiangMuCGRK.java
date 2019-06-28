package com.edge.projman.xmcgrk.entity;

/**
 * 项目采购入库实体类
 * 
 * @author NingCG
 *
 */
public class XiangMuCGRK {
	private Integer hwId;// 主键
	private String chanPinMC;// 产品名称
	private Integer proj_Info_Id;// 所属销售合同
	private Boolean is_rk;// 是否入库
	private Boolean is_ck;// 是否出库

	public Integer getHwId() {
		return hwId;
	}

	public void setHwId(Integer hwId) {
		this.hwId = hwId;
	}

	public String getChanPinMC() {
		return chanPinMC;
	}

	public void setChanPinMC(String chanPinMC) {
		this.chanPinMC = chanPinMC;
	}

	public Integer getProj_Info_Id() {
		return proj_Info_Id;
	}

	public void setProj_Info_Id(Integer proj_Info_Id) {
		this.proj_Info_Id = proj_Info_Id;
	}

	public Boolean getIs_rk() {
		return is_rk;
	}

	public void setIs_rk(Boolean is_rk) {
		this.is_rk = is_rk;
	}

	public Boolean getIs_ck() {
		return is_ck;
	}

	public void setIs_ck(Boolean is_ck) {
		this.is_ck = is_ck;
	}

	@Override
	public String toString() {
		return "XiangMuCGRK [hwId=" + hwId + ", chanPinMC=" + chanPinMC + ", proj_Info_Id=" + proj_Info_Id + ", is_rk="
				+ is_rk + ", is_ck=" + is_ck + "]";
	}

}
