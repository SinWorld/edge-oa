package com.edge.projman.xshtdj.entity;

/**
 * 货物产品内容实体类
 * 
 * @author NingCG
 *
 */
public class HuoWuInFor {
	private Integer hwId;// 主键
	private String chanPinMC;// 产品名称
	private String pinPai;// 品牌
	private String guiGeXH;// 规格型号
	private String zhuYaoPZCS;// 主要配置参数
	private String danWei;// 单位
	private Integer shuLiang;// 数量
	private Double price;// 单价
	private Double jinE;// 金额
	private Integer proj_Info_Id;// 所属销售合同

	// 辅助属性
	private String proj_Info_name;// 销售合同名称

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

	public String getPinPai() {
		return pinPai;
	}

	public void setPinPai(String pinPai) {
		this.pinPai = pinPai;
	}

	public String getGuiGeXH() {
		return guiGeXH;
	}

	public void setGuiGeXH(String guiGeXH) {
		this.guiGeXH = guiGeXH;
	}

	public String getZhuYaoPZCS() {
		return zhuYaoPZCS;
	}

	public void setZhuYaoPZCS(String zhuYaoPZCS) {
		this.zhuYaoPZCS = zhuYaoPZCS;
	}

	public String getDanWei() {
		return danWei;
	}

	public void setDanWei(String danWei) {
		this.danWei = danWei;
	}

	public Integer getShuLiang() {
		return shuLiang;
	}

	public void setShuLiang(Integer shuLiang) {
		this.shuLiang = shuLiang;
	}

	public Double getPrice() {
		return price;
	}

	public void setPrice(Double price) {
		this.price = price;
	}

	public Double getJinE() {
		return jinE;
	}

	public void setJinE(Double jinE) {
		this.jinE = jinE;
	}

	public Integer getProj_Info_Id() {
		return proj_Info_Id;
	}

	public void setProj_Info_Id(Integer proj_Info_Id) {
		this.proj_Info_Id = proj_Info_Id;
	}

	public String getProj_Info_name() {
		return proj_Info_name;
	}

	public void setProj_Info_name(String proj_Info_name) {
		this.proj_Info_name = proj_Info_name;
	}

	@Override
	public String toString() {
		return "HuoWuInFor [hwId=" + hwId + ", chanPinMC=" + chanPinMC + ", pinPai=" + pinPai + ", guiGeXH=" + guiGeXH
				+ ", zhuYaoPZCS=" + zhuYaoPZCS + ", danWei=" + danWei + ", shuLiang=" + shuLiang + ", price=" + price
				+ ", jinE=" + jinE + ", proj_Info_Id=" + proj_Info_Id + ", proj_Info_name=" + proj_Info_name + "]";
	}

}
