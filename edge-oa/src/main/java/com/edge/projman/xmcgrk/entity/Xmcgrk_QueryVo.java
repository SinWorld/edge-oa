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
	private Integer shuLiang;// 数量
	private Double price;// 单价
	private Double jinE;// 金额
	private Integer proj_Info_Id;// 所属销售合同

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

	@Override
	public String toString() {
		return "Xmcgrk_QueryVo [page=" + page + ", size=" + size + ", startRow=" + startRow + ", chanPinMC=" + chanPinMC
				+ ", pinPai=" + pinPai + ", guiGeXH=" + guiGeXH + ", zhuYaoPZCS=" + zhuYaoPZCS + ", danWei=" + danWei
				+ ", shuLiang=" + shuLiang + ", price=" + price + ", jinE=" + jinE + ", proj_Info_Id=" + proj_Info_Id
				+ "]";
	}

}
