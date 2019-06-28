package com.edge.projman.xmcgrk.entity;

/**
 * 高级搜索查询实体类
 * 
 * @author NingCG
 *
 */
public class Xmcgrk_QueryVo {
	// 当前页
	private Integer page;
	// 每页数
	private Integer size = 10;
	// 开始行
	private Integer startRow = 0;

	private String chanPinMC;// 产品名称
	private String pinPai;// 品牌
	private String guiGeXH;// 规格型号
	private String zhuYaoPZCS;// 主要配置参数
	private String danWei;// 单位
	private Double price;// 单价
	private Double jinE1;// 金额
	private Double jinE2;// 金额
	private Integer proj_Info_Id;// 所属销售合同
	private String uuid;// 不重复标志

	public Integer getPage() {
		return page;
	}

	public void setPage(Integer page) {
		this.page = page;
	}

	public Integer getSize() {
		return size;
	}

	public void setSize(Integer size) {
		this.size = size;
	}

	public Integer getStartRow() {
		return startRow;
	}

	public void setStartRow(Integer startRow) {
		this.startRow = startRow;
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

	public Double getPrice() {
		return price;
	}

	public void setPrice(Double price) {
		this.price = price;
	}

	public Double getJinE1() {
		return jinE1;
	}

	public void setJinE1(Double jinE1) {
		this.jinE1 = jinE1;
	}

	public Double getJinE2() {
		return jinE2;
	}

	public void setJinE2(Double jinE2) {
		this.jinE2 = jinE2;
	}

	public Integer getProj_Info_Id() {
		return proj_Info_Id;
	}

	public void setProj_Info_Id(Integer proj_Info_Id) {
		this.proj_Info_Id = proj_Info_Id;
	}

	public String getUuid() {
		return uuid;
	}

	public void setUuid(String uuid) {
		this.uuid = uuid;
	}

	@Override
	public String toString() {
		return "Xmcgrk_QueryVo [page=" + page + ", size=" + size + ", startRow=" + startRow + ", chanPinMC=" + chanPinMC
				+ ", pinPai=" + pinPai + ", guiGeXH=" + guiGeXH + ", zhuYaoPZCS=" + zhuYaoPZCS + ", danWei=" + danWei
				+ ", price=" + price + ", jinE1=" + jinE1 + ", jinE2=" + jinE2 + ", proj_Info_Id=" + proj_Info_Id
				+ ", uuid=" + uuid + "]";
	}

}
