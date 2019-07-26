package com.edge.yyzx.sxwd.entity;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

/**
 * 上线文档实体类
 * 
 * @author NingCG
 *
 */
public class ShangXianWD {
	private Integer sxwd_dm;// 主键
	private String sxwd_mc;// 上线文档名称
	private String sxwd_bh;// 上线文档编号
	private String sxwd_xt;// 系统
	private Integer sxwd_kh;// 客户单位
	private String sxwd_fz;// 分支
	private String sxwd_git;// git版本标签
	private Integer sxwd_wtlx;// 问题类型
	private Integer sxwd_kfysry;// 开发验收人员
	private Integer sxwd_kfry;// 开发人员
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date sxwd_jhsxsj;// 计划上线时间
	private String sxwd_zxcxm;// 执行程序名
	private Boolean sxwd_sfxyzxcx;// 是否需要执行程序
	private Boolean sxwd_sftgyfzxys;// 是否通过研发中心验收
	private Boolean sxwd_sftgxqys;// 是否通过需求验收
	private Boolean sxwd_sfybb;// 是否有报表
	private Boolean sxwd_sfxysq;// 是否需要授权
	private String sxwd_bcgxnr;// 本次更新内容
	private String sxwd_bbwjfzwz;// 报表文件放置位置
	private String sxwd_sqsm;// 授权说明
	private String sxwd_qtqk;// 其它情况

	// 辅助属性
	private String wtlxmc;// 问题类型名称
	private String khdwmc;// 客户单位名称
	private String kfysrymc;// 开发验收人员
	private String kfrymc;// 开发人员名称
	private String jhsxsj;// 计划上线时间

	public Integer getSxwd_dm() {
		return sxwd_dm;
	}

	public void setSxwd_dm(Integer sxwd_dm) {
		this.sxwd_dm = sxwd_dm;
	}

	public String getSxwd_mc() {
		return sxwd_mc;
	}

	public void setSxwd_mc(String sxwd_mc) {
		this.sxwd_mc = sxwd_mc;
	}

	public String getSxwd_bh() {
		return sxwd_bh;
	}

	public void setSxwd_bh(String sxwd_bh) {
		this.sxwd_bh = sxwd_bh;
	}

	public String getSxwd_xt() {
		return sxwd_xt;
	}

	public void setSxwd_xt(String sxwd_xt) {
		this.sxwd_xt = sxwd_xt;
	}

	public Integer getSxwd_kh() {
		return sxwd_kh;
	}

	public void setSxwd_kh(Integer sxwd_kh) {
		this.sxwd_kh = sxwd_kh;
	}

	public String getSxwd_fz() {
		return sxwd_fz;
	}

	public void setSxwd_fz(String sxwd_fz) {
		this.sxwd_fz = sxwd_fz;
	}

	public String getSxwd_git() {
		return sxwd_git;
	}

	public void setSxwd_git(String sxwd_git) {
		this.sxwd_git = sxwd_git;
	}

	public Integer getSxwd_wtlx() {
		return sxwd_wtlx;
	}

	public void setSxwd_wtlx(Integer sxwd_wtlx) {
		this.sxwd_wtlx = sxwd_wtlx;
	}

	public Integer getSxwd_kfysry() {
		return sxwd_kfysry;
	}

	public void setSxwd_kfysry(Integer sxwd_kfysry) {
		this.sxwd_kfysry = sxwd_kfysry;
	}

	public Integer getSxwd_kfry() {
		return sxwd_kfry;
	}

	public void setSxwd_kfyy(Integer sxwd_kfry) {
		this.sxwd_kfry = sxwd_kfry;
	}

	public Date getSxwd_jhsxsj() {
		return sxwd_jhsxsj;
	}

	public void setSxwd_jhsxsj(Date sxwd_jhsxsj) {
		this.sxwd_jhsxsj = sxwd_jhsxsj;
	}

	public String getSxwd_zxcxm() {
		return sxwd_zxcxm;
	}

	public void setSxwd_zxcxm(String sxwd_zxcxm) {
		this.sxwd_zxcxm = sxwd_zxcxm;
	}

	public Boolean getSxwd_sfxyzxcx() {
		return sxwd_sfxyzxcx;
	}

	public void setSxwd_sfxyzxcx(Boolean sxwd_sfxyzxcx) {
		this.sxwd_sfxyzxcx = sxwd_sfxyzxcx;
	}

	public Boolean getSxwd_sftgyfzxys() {
		return sxwd_sftgyfzxys;
	}

	public void setSxwd_sftgyfzxys(Boolean sxwd_sftgyfzxys) {
		this.sxwd_sftgyfzxys = sxwd_sftgyfzxys;
	}

	public Boolean getSxwd_sftgxqys() {
		return sxwd_sftgxqys;
	}

	public void setSxwd_sftgxqys(Boolean sxwd_sftgxqys) {
		this.sxwd_sftgxqys = sxwd_sftgxqys;
	}

	public Boolean getSxwd_sfybb() {
		return sxwd_sfybb;
	}

	public void setSxwd_sfybb(Boolean sxwd_sfybb) {
		this.sxwd_sfybb = sxwd_sfybb;
	}

	public Boolean getSxwd_sfxysq() {
		return sxwd_sfxysq;
	}

	public void setSxwd_sfxysq(Boolean sxwd_sfxysq) {
		this.sxwd_sfxysq = sxwd_sfxysq;
	}

	public String getSxwd_bcgxnr() {
		return sxwd_bcgxnr;
	}

	public void setSxwd_bcgxnr(String sxwd_bcgxnr) {
		this.sxwd_bcgxnr = sxwd_bcgxnr;
	}

	public String getSxwd_bbwjfzwz() {
		return sxwd_bbwjfzwz;
	}

	public void setSxwd_bbwjfzwz(String sxwd_bbwjfzwz) {
		this.sxwd_bbwjfzwz = sxwd_bbwjfzwz;
	}

	public String getSxwd_sqsm() {
		return sxwd_sqsm;
	}

	public void setSxwd_sqsm(String sxwd_sqsm) {
		this.sxwd_sqsm = sxwd_sqsm;
	}

	public String getSxwd_qtqk() {
		return sxwd_qtqk;
	}

	public void setSxwd_qtqk(String sxwd_qtqk) {
		this.sxwd_qtqk = sxwd_qtqk;
	}

	public String getWtlxmc() {
		return wtlxmc;
	}

	public void setWtlxmc(String wtlxmc) {
		this.wtlxmc = wtlxmc;
	}

	public String getKhdwmc() {
		return khdwmc;
	}

	public void setKhdwmc(String khdwmc) {
		this.khdwmc = khdwmc;
	}

	public String getKfysrymc() {
		return kfysrymc;
	}

	public void setKfysrymc(String kfysrymc) {
		this.kfysrymc = kfysrymc;
	}

	public String getKfrymc() {
		return kfrymc;
	}

	public void setKfrymc(String kfrymc) {
		this.kfrymc = kfrymc;
	}

	public String getJhsxsj() {
		return jhsxsj;
	}

	public void setJhsxsj(String jhsxsj) {
		this.jhsxsj = jhsxsj;
	}

	public void setSxwd_kfry(Integer sxwd_kfry) {
		this.sxwd_kfry = sxwd_kfry;
	}

	@Override
	public String toString() {
		return "ShangXianWD [sxwd_dm=" + sxwd_dm + ", sxwd_mc=" + sxwd_mc + ", sxwd_bh=" + sxwd_bh + ", sxwd_xt="
				+ sxwd_xt + ", sxwd_kh=" + sxwd_kh + ", sxwd_fz=" + sxwd_fz + ", sxwd_git=" + sxwd_git + ", sxwd_wtlx="
				+ sxwd_wtlx + ", sxwd_kfysry=" + sxwd_kfysry + ", sxwd_kfry=" + sxwd_kfry + ", sxwd_jhsxsj="
				+ sxwd_jhsxsj + ", sxwd_zxcxm=" + sxwd_zxcxm + ", sxwd_sfxyzxcx=" + sxwd_sfxyzxcx + ", sxwd_sftgyfzxys="
				+ sxwd_sftgyfzxys + ", sxwd_sftgxqys=" + sxwd_sftgxqys + ", sxwd_sfybb=" + sxwd_sfybb + ", sxwd_sfxysq="
				+ sxwd_sfxysq + ", sxwd_bcgxnr=" + sxwd_bcgxnr + ", sxwd_bbwjfzwz=" + sxwd_bbwjfzwz + ", sxwd_sqsm="
				+ sxwd_sqsm + ", sxwd_qtqk=" + sxwd_qtqk + ", wtlxmc=" + wtlxmc + ", khdwmc=" + khdwmc + ", kfysrymc="
				+ kfysrymc + ", kfrymc=" + kfrymc + ", jhsxsj=" + jhsxsj + "]";
	}

}
