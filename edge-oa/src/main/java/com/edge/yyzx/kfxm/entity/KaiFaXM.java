package com.edge.yyzx.kfxm.entity;

/**
 * 开发项目实体类
 * 
 * @author NingCG
 *
 */
public class KaiFaXM {
	private Integer kfxm_dm;// 主键
	private String kfxm_dh;// 开发项目代号
	private String kfxm_mc;// 开发项目名称
	private Integer kfxm_kh;// 客户
	private Integer kfxm_qyzt;// 签约主体
	private Boolean kfxm_sfybzcsbg;// 是否已编制测试报告
	private Boolean kfxm_sfyqdht;// 是否已签订合同
	private Boolean kfxm_sfyqdsjfa;// 是否已确定设计方案
	private Boolean kfxm_sfyqdyhsysc;// 是否已确定用户使用手册
	private Boolean kfxm_sfyqdysd;// 是否已签订验收单
	private Integer kfxm_xmjd;// 项目阶段
	private Integer kfxm_xmzt;// 项目状态
	private String kfxm_xmms;// 项目描述

	// 辅助属性
	private String xmjdmc;// 项目阶段名称
	private String xmztmc;// 项目状态名称
	private String khmc;// 客户名称
	private String qyztmc;// 签约主体名称

	public Integer getKfxm_dm() {
		return kfxm_dm;
	}

	public void setKfxm_dm(Integer kfxm_dm) {
		this.kfxm_dm = kfxm_dm;
	}

	public String getKfxm_dh() {
		return kfxm_dh;
	}

	public void setKfxm_dh(String kfxm_dh) {
		this.kfxm_dh = kfxm_dh;
	}

	public String getKfxm_mc() {
		return kfxm_mc;
	}

	public void setKfxm_mc(String kfxm_mc) {
		this.kfxm_mc = kfxm_mc;
	}

	public Integer getKfxm_kh() {
		return kfxm_kh;
	}

	public void setKfxm_kh(Integer kfxm_kh) {
		this.kfxm_kh = kfxm_kh;
	}

	public Integer getKfxm_qyzt() {
		return kfxm_qyzt;
	}

	public void setKfxm_qyzt(Integer kfxm_qyzt) {
		this.kfxm_qyzt = kfxm_qyzt;
	}

	public Boolean getKfxm_sfybzcsbg() {
		return kfxm_sfybzcsbg;
	}

	public void setKfxm_sfybzcsbg(Boolean kfxm_sfybzcsbg) {
		this.kfxm_sfybzcsbg = kfxm_sfybzcsbg;
	}

	public Boolean getKfxm_sfyqdht() {
		return kfxm_sfyqdht;
	}

	public void setKfxm_sfyqdht(Boolean kfxm_sfyqdht) {
		this.kfxm_sfyqdht = kfxm_sfyqdht;
	}

	public Boolean getKfxm_sfyqdsjfa() {
		return kfxm_sfyqdsjfa;
	}

	public void setKfxm_sfyqdsjfa(Boolean kfxm_sfyqdsjfa) {
		this.kfxm_sfyqdsjfa = kfxm_sfyqdsjfa;
	}

	public Boolean getKfxm_sfyqdyhsysc() {
		return kfxm_sfyqdyhsysc;
	}

	public void setKfxm_sfyqdyhsysc(Boolean kfxm_sfyqdyhsysc) {
		this.kfxm_sfyqdyhsysc = kfxm_sfyqdyhsysc;
	}

	public Boolean getKfxm_sfyqdysd() {
		return kfxm_sfyqdysd;
	}

	public void setKfxm_sfyqdysd(Boolean kfxm_sfyqdysd) {
		this.kfxm_sfyqdysd = kfxm_sfyqdysd;
	}

	public Integer getKfxm_xmjd() {
		return kfxm_xmjd;
	}

	public void setKfxm_xmjd(Integer kfxm_xmjd) {
		this.kfxm_xmjd = kfxm_xmjd;
	}

	public Integer getKfxm_xmzt() {
		return kfxm_xmzt;
	}

	public void setKfxm_xmzt(Integer kfxm_xmzt) {
		this.kfxm_xmzt = kfxm_xmzt;
	}

	public String getKfxm_xmms() {
		return kfxm_xmms;
	}

	public void setKfxm_xmms(String kfxm_xmms) {
		this.kfxm_xmms = kfxm_xmms;
	}

	public String getXmjdmc() {
		return xmjdmc;
	}

	public void setXmjdmc(String xmjdmc) {
		this.xmjdmc = xmjdmc;
	}

	public String getXmztmc() {
		return xmztmc;
	}

	public void setXmztmc(String xmztmc) {
		this.xmztmc = xmztmc;
	}

	public String getKhmc() {
		return khmc;
	}

	public void setKhmc(String khmc) {
		this.khmc = khmc;
	}

	public String getQyztmc() {
		return qyztmc;
	}

	public void setQyztmc(String qyztmc) {
		this.qyztmc = qyztmc;
	}

	@Override
	public String toString() {
		return "KaiFaXM [kfxm_dm=" + kfxm_dm + ", kfxm_dh=" + kfxm_dh + ", kfxm_mc=" + kfxm_mc + ", kfxm_kh=" + kfxm_kh
				+ ", kfxm_qyzt=" + kfxm_qyzt + ", kfxm_sfybzcsbg=" + kfxm_sfybzcsbg + ", kfxm_sfyqdht=" + kfxm_sfyqdht
				+ ", kfxm_sfyqdsjfa=" + kfxm_sfyqdsjfa + ", kfxm_sfyqdyhsysc=" + kfxm_sfyqdyhsysc + ", kfxm_sfyqdysd="
				+ kfxm_sfyqdysd + ", kfxm_xmjd=" + kfxm_xmjd + ", kfxm_xmzt=" + kfxm_xmzt + ", kfxm_xmms=" + kfxm_xmms
				+ ", xmjdmc=" + xmjdmc + ", xmztmc=" + xmztmc + ", khmc=" + khmc + ", qyztmc=" + qyztmc + "]";
	}

}
