package com.edge.projman.xmcgrk.entity;

/**
 * 项目入库详情实体类
 * 
 * @author NingCG
 *
 */
public class XmrkInFo {
	private Integer rkInfoId;// 主键
	private String chanPinMC;// 产品名称
	private String pinPai;// 品牌
	private String guiGeXH;// 规格型号
	private String zhuYaoPZCS;// 主要配置参数
	private String danWei;// 单位
	private Integer oldShuLiang;// 数量
	private Double price;// 单价
	private Double jinE;// 金额
	private Boolean is_rk;// 是否入库
	private Boolean is_ck;// 是否出库
	private String buyer;// 采购商
	private String bz;// 备注
	private Integer xmrkorCkId;// 项目采购入库主键
	private String uuid;// 不重复的标志（用于合并数据）

	// 辅助属性
	private String xshtmc;// 销售合同名称

	public Integer getRkInfoId() {
		return rkInfoId;
	}

	public void setRkInfoId(Integer rkInfoId) {
		this.rkInfoId = rkInfoId;
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

	public Integer getOldShuLiang() {
		return oldShuLiang;
	}

	public void setOldShuLiang(Integer oldShuLiang) {
		this.oldShuLiang = oldShuLiang;
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

	public String getBuyer() {
		return buyer;
	}

	public void setBuyer(String buyer) {
		this.buyer = buyer;
	}

	public String getBz() {
		return bz;
	}

	public void setBz(String bz) {
		this.bz = bz;
	}

	public Integer getXmrkorCkId() {
		return xmrkorCkId;
	}

	public void setXmrkorCkId(Integer xmrkorCkId) {
		this.xmrkorCkId = xmrkorCkId;
	}

	public String getXshtmc() {
		return xshtmc;
	}

	public void setXshtmc(String xshtmc) {
		this.xshtmc = xshtmc;
	}

	public String getUuid() {
		return uuid;
	}

	public void setUuid(String uuid) {
		this.uuid = uuid;
	}

	@Override
	public String toString() {
		return "XmrkInFo [rkInfoId=" + rkInfoId + ", chanPinMC=" + chanPinMC + ", pinPai=" + pinPai + ", guiGeXH="
				+ guiGeXH + ", zhuYaoPZCS=" + zhuYaoPZCS + ", danWei=" + danWei + ", oldShuLiang=" + oldShuLiang
				+ ", price=" + price + ", jinE=" + jinE + ", is_rk=" + is_rk + ", is_ck=" + is_ck + ", buyer=" + buyer
				+ ", bz=" + bz + ", xmrkorCkId=" + xmrkorCkId + ", uuid=" + uuid + ", xshtmc=" + xshtmc + "]";
	}

}
