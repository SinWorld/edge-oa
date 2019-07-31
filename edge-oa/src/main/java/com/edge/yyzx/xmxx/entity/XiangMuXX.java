package com.edge.yyzx.xmxx.entity;
/**
 * 项目信息实体类
 * @author NingCG
 *
 */

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class XiangMuXX {
	private Integer xmxx_dm;// 主键
	private String xmxx_ysbh;// 预算编号
	private String xmxx_dh;// 代号
	private String xmxx_mc;// 名称
	private Integer xmxx_fzr;// 负责人
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date xmxx_jhkssj;// 计划开始时间
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date xmxx_jhjssj;// 计划结束时间
	private Integer xmxx_kh;// 客户
	private String xmxx_khbm;// 客户部门
	private String xmxx_khfzr;// 客户负责人
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date xmxx_tcrq;// 提出日期
	private Double xmxx_xmje;// 项目金额
	private Double xmxx_yjgzl;// 预计工作量
	private String xmxx_bz;// 备注

	// 辅助属性
	private String xmxx_khmc;// 客户名称
	private String xmxx_fzrmc;// 负责人名称
	private String jhkssj;// 计划开始时间
	private String jhjssj;// 计划结束时间
	private String tcrq;// 提出日期

	public Integer getXmxx_dm() {
		return xmxx_dm;
	}

	public void setXmxx_dm(Integer xmxx_dm) {
		this.xmxx_dm = xmxx_dm;
	}

	public String getXmxx_ysbh() {
		return xmxx_ysbh;
	}

	public void setXmxx_ysbh(String xmxx_ysbh) {
		this.xmxx_ysbh = xmxx_ysbh;
	}

	public String getXmxx_dh() {
		return xmxx_dh;
	}

	public void setXmxx_dh(String xmxx_dh) {
		this.xmxx_dh = xmxx_dh;
	}

	public String getXmxx_mc() {
		return xmxx_mc;
	}

	public void setXmxx_mc(String xmxx_mc) {
		this.xmxx_mc = xmxx_mc;
	}

	public Integer getXmxx_fzr() {
		return xmxx_fzr;
	}

	public void setXmxx_fzr(Integer xmxx_fzr) {
		this.xmxx_fzr = xmxx_fzr;
	}

	public Date getXmxx_jhkssj() {
		return xmxx_jhkssj;
	}

	public void setXmxx_jhkssj(Date xmxx_jhkssj) {
		this.xmxx_jhkssj = xmxx_jhkssj;
	}

	public Date getXmxx_jhjssj() {
		return xmxx_jhjssj;
	}

	public void setXmxx_jhjssj(Date xmxx_jhjssj) {
		this.xmxx_jhjssj = xmxx_jhjssj;
	}

	public Integer getXmxx_kh() {
		return xmxx_kh;
	}

	public void setXmxx_kh(Integer xmxx_kh) {
		this.xmxx_kh = xmxx_kh;
	}

	public String getXmxx_khbm() {
		return xmxx_khbm;
	}

	public void setXmxx_khbm(String xmxx_khbm) {
		this.xmxx_khbm = xmxx_khbm;
	}

	public String getXmxx_khfzr() {
		return xmxx_khfzr;
	}

	public void setXmxx_khfzr(String xmxx_khfzr) {
		this.xmxx_khfzr = xmxx_khfzr;
	}

	public Date getXmxx_tcrq() {
		return xmxx_tcrq;
	}

	public void setXmxx_tcrq(Date xmxx_tcrq) {
		this.xmxx_tcrq = xmxx_tcrq;
	}

	public Double getXmxx_xmje() {
		return xmxx_xmje;
	}

	public void setXmxx_xmje(Double xmxx_xmje) {
		this.xmxx_xmje = xmxx_xmje;
	}

	public Double getXmxx_yjgzl() {
		return xmxx_yjgzl;
	}

	public void setXmxx_yjgzl(Double xmxx_yjgzl) {
		this.xmxx_yjgzl = xmxx_yjgzl;
	}

	public String getXmxx_bz() {
		return xmxx_bz;
	}

	public void setXmxx_bz(String xmxx_bz) {
		this.xmxx_bz = xmxx_bz;
	}

	public String getXmxx_khmc() {
		return xmxx_khmc;
	}

	public void setXmxx_khmc(String xmxx_khmc) {
		this.xmxx_khmc = xmxx_khmc;
	}

	public String getXmxx_fzrmc() {
		return xmxx_fzrmc;
	}

	public void setXmxx_fzrmc(String xmxx_fzrmc) {
		this.xmxx_fzrmc = xmxx_fzrmc;
	}

	public String getJhkssj() {
		return jhkssj;
	}

	public void setJhkssj(String jhkssj) {
		this.jhkssj = jhkssj;
	}

	public String getJhjssj() {
		return jhjssj;
	}

	public void setJhjssj(String jhjssj) {
		this.jhjssj = jhjssj;
	}

	public String getTcrq() {
		return tcrq;
	}

	public void setTcrq(String tcrq) {
		this.tcrq = tcrq;
	}

	@Override
	public String toString() {
		return "XiangMuXX [xmxx_dm=" + xmxx_dm + ", xmxx_ysbh=" + xmxx_ysbh + ", xmxx_dh=" + xmxx_dh + ", xmxx_mc="
				+ xmxx_mc + ", xmxx_fzr=" + xmxx_fzr + ", xmxx_jhkssj=" + xmxx_jhkssj + ", xmxx_jhjssj=" + xmxx_jhjssj
				+ ", xmxx_kh=" + xmxx_kh + ", xmxx_khbm=" + xmxx_khbm + ", xmxx_khfzr=" + xmxx_khfzr + ", xmxx_tcrq="
				+ xmxx_tcrq + ", xmxx_xmje=" + xmxx_xmje + ", xmxx_yjgzl=" + xmxx_yjgzl + ", xmxx_bz=" + xmxx_bz
				+ ", xmxx_khmc=" + xmxx_khmc + ", xmxx_fzrmc=" + xmxx_fzrmc + ", jhkssj=" + jhkssj + ", jhjssj="
				+ jhjssj + ", tcrq=" + tcrq + "]";
	}

}
