package com.edge.yyzx.shxm.entity;

/**
 * 售后项目实体类
 * 
 * @author NingCG
 *
 */
public class ShouHouXM {
	private Integer shxm_dm;// 主键
	private String shxm_dh;// 售后项目代号
	private String shxm_mc;// 售后项目名称
	private Integer shxm_kh;// 客户
	private Integer shxm_qyzt;// 签约主体
	private String shxm_ms;// 描述

	// 辅助属性
	private String khmc;// 客户名称
	private String qyztmc;// 签约主体名称

	public Integer getShxm_dm() {
		return shxm_dm;
	}

	public void setShxm_dm(Integer shxm_dm) {
		this.shxm_dm = shxm_dm;
	}

	public String getShxm_dh() {
		return shxm_dh;
	}

	public void setShxm_dh(String shxm_dh) {
		this.shxm_dh = shxm_dh;
	}

	public String getShxm_mc() {
		return shxm_mc;
	}

	public void setShxm_mc(String shxm_mc) {
		this.shxm_mc = shxm_mc;
	}

	public Integer getShxm_kh() {
		return shxm_kh;
	}

	public void setShxm_kh(Integer shxm_kh) {
		this.shxm_kh = shxm_kh;
	}

	public Integer getShxm_qyzt() {
		return shxm_qyzt;
	}

	public void setShxm_qyzt(Integer shxm_qyzt) {
		this.shxm_qyzt = shxm_qyzt;
	}

	public String getShxm_ms() {
		return shxm_ms;
	}

	public void setShxm_ms(String shxm_ms) {
		this.shxm_ms = shxm_ms;
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
		return "ShouHouXM [shxm_dm=" + shxm_dm + ", shxm_dh=" + shxm_dh + ", shxm_mc=" + shxm_mc + ", shxm_kh="
				+ shxm_kh + ", shxm_qyzt=" + shxm_qyzt + ", shxm_ms=" + shxm_ms + ", khmc=" + khmc + ", qyztmc="
				+ qyztmc + "]";
	}

}
