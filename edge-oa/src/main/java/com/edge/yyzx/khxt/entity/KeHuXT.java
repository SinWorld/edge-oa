package com.edge.yyzx.khxt.entity;
/**
 * 客户系统
 * @author NingCG
 *
 */

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class KeHuXT {
	private Integer khxt_dm;// 主键
	private String khxt_dh;// 客户代号
	private String khxt_mc;// 名称
	private Integer khxt_khdm;// 客户
	private String khxt_khbm;// 客户部门
	private String khxt_khfzr;// 客户负责人
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date khxt_sxrq;// 上线日期
	private String khxt_bz;// 备注

	// 辅助属性
	private String khxt_khmc;// 客户名称
	private String sxrq;// 上线日期

	public String getKhxt_dh() {
		return khxt_dh;
	}

	public void setKhxt_dh(String khxt_dh) {
		this.khxt_dh = khxt_dh;
	}

	public Integer getKhxt_dm() {
		return khxt_dm;
	}

	public void setKhxt_dm(Integer khxt_dm) {
		this.khxt_dm = khxt_dm;
	}

	public String getKhxt_mc() {
		return khxt_mc;
	}

	public void setKhxt_mc(String khxt_mc) {
		this.khxt_mc = khxt_mc;
	}

	public Integer getKhxt_khdm() {
		return khxt_khdm;
	}

	public void setKhxt_khdm(Integer khxt_khdm) {
		this.khxt_khdm = khxt_khdm;
	}

	public String getKhxt_khbm() {
		return khxt_khbm;
	}

	public void setKhxt_khbm(String khxt_khbm) {
		this.khxt_khbm = khxt_khbm;
	}

	public String getKhxt_khfzr() {
		return khxt_khfzr;
	}

	public void setKhxt_khfzr(String khxt_khfzr) {
		this.khxt_khfzr = khxt_khfzr;
	}

	public Date getKhxt_sxrq() {
		return khxt_sxrq;
	}

	public void setKhxt_sxrq(Date khxt_sxrq) {
		this.khxt_sxrq = khxt_sxrq;
	}

	public String getKhxt_khmc() {
		return khxt_khmc;
	}

	public void setKhxt_khmc(String khxt_khmc) {
		this.khxt_khmc = khxt_khmc;
	}

	public String getSxrq() {
		return sxrq;
	}

	public void setSxrq(String sxrq) {
		this.sxrq = sxrq;
	}

	public String getKhxt_bz() {
		return khxt_bz;
	}

	public void setKhxt_bz(String khxt_bz) {
		this.khxt_bz = khxt_bz;
	}

	@Override
	public String toString() {
		return "KeHuXT [khxt_dm=" + khxt_dm + ", khxt_dh=" + khxt_dh + ", khxt_mc=" + khxt_mc + ", khxt_khdm="
				+ khxt_khdm + ", khxt_khbm=" + khxt_khbm + ", khxt_khfzr=" + khxt_khfzr + ", khxt_sxrq=" + khxt_sxrq
				+ ", khxt_bz=" + khxt_bz + ", khxt_khmc=" + khxt_khmc + ", sxrq=" + sxrq + "]";
	}

}
