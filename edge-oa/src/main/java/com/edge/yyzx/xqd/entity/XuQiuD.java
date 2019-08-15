package com.edge.yyzx.xqd.entity;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

/**
 * 需求单实体类
 * 
 * @author NingCG
 *
 */
public class XuQiuD {
	private Integer xqd_dm;// 主键
	private String xqd_dh;// 需求单号
	private String xqd_mc;// 需求名称
	private Integer xqd_xmxx;// 项目信息
	private Integer xqd_ssxt;// 所属系统
	private Integer xqd_xqlx;// 需求类型
	private Integer xqd_fzr;// 负责人
	private Integer xqd_kh;// 客户
	private String xqd_khxt;// 客户系统
	private String xqd_khfzr;// 客户负责人
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date xqd_tcrq;// 提出日期
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date xqd_jhksrq;// 计划开始日期
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date xqd_jhjsrq;// 计划结束日期
	private Double xqd_gzl;// 工作量
	private Boolean xqd_xqqd;// 需求签订
	private Boolean xqd_gzlqd;// 工作量签订
	private Boolean xqd_kfks;// 开发开始
	private Boolean xqd_kfjs;// 开发结束
	private Boolean xqd_csks;// 测试开始
	private Boolean xqd_csjs;// 测试结束
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date xqd_ssrq;// 实施日期
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date xqd_ysrq;// 验收日期
	private Integer xqd_xqjd;// 需求阶段
	private Integer xqd_xqzt;// 需求状态
	private String xqd_bz;// 备注

	// 辅助属性
	private String xmxxmc;// 项目信息名称
	private String ssxtmc;// 所属系统名称
	private String xqlxmc;// 需求类型名称
	private String fzrmc;// 负责人名称
	private String khmc;// 客户名称
	private String xqjdmc;// 需求阶段名称
	private String xqztmc;// 需求状态名称
	private String tcrq;// 提出日期
	private String jhksrq;// 计划开始日期
	private String jhjsrq;// 计划结束日期
	private String ssrq;// 实施日期
	private String ysrq;// 验收日期

	public Integer getXqd_dm() {
		return xqd_dm;
	}

	public void setXqd_dm(Integer xqd_dm) {
		this.xqd_dm = xqd_dm;
	}

	public String getXqd_dh() {
		return xqd_dh;
	}

	public void setXqd_dh(String xqd_dh) {
		this.xqd_dh = xqd_dh;
	}

	public String getXqd_mc() {
		return xqd_mc;
	}

	public void setXqd_mc(String xqd_mc) {
		this.xqd_mc = xqd_mc;
	}

	public Integer getXqd_xmxx() {
		return xqd_xmxx;
	}

	public void setXqd_xmxx(Integer xqd_xmxx) {
		this.xqd_xmxx = xqd_xmxx;
	}

	public Integer getXqd_ssxt() {
		return xqd_ssxt;
	}

	public void setXqd_ssxt(Integer xqd_ssxt) {
		this.xqd_ssxt = xqd_ssxt;
	}

	public Integer getXqd_xqlx() {
		return xqd_xqlx;
	}

	public void setXqd_xqlx(Integer xqd_xqlx) {
		this.xqd_xqlx = xqd_xqlx;
	}

	public Integer getXqd_fzr() {
		return xqd_fzr;
	}

	public void setXqd_fzr(Integer xqd_fzr) {
		this.xqd_fzr = xqd_fzr;
	}

	public Integer getXqd_kh() {
		return xqd_kh;
	}

	public void setXqd_kh(Integer xqd_kh) {
		this.xqd_kh = xqd_kh;
	}

	public String getXqd_khxt() {
		return xqd_khxt;
	}

	public void setXqd_khxt(String xqd_khxt) {
		this.xqd_khxt = xqd_khxt;
	}

	public String getXqd_khfzr() {
		return xqd_khfzr;
	}

	public void setXqd_khfzr(String xqd_khfzr) {
		this.xqd_khfzr = xqd_khfzr;
	}

	public Date getXqd_tcrq() {
		return xqd_tcrq;
	}

	public void setXqd_tcrq(Date xqd_tcrq) {
		this.xqd_tcrq = xqd_tcrq;
	}

	public Date getXqd_jhksrq() {
		return xqd_jhksrq;
	}

	public void setXqd_jhksrq(Date xqd_jhksrq) {
		this.xqd_jhksrq = xqd_jhksrq;
	}

	public Date getXqd_jhjsrq() {
		return xqd_jhjsrq;
	}

	public void setXqd_jhjsrq(Date xqd_jhjsrq) {
		this.xqd_jhjsrq = xqd_jhjsrq;
	}

	public Double getXqd_gzl() {
		return xqd_gzl;
	}

	public void setXqd_gzl(Double xqd_gzl) {
		this.xqd_gzl = xqd_gzl;
	}

	public Boolean getXqd_xqqd() {
		return xqd_xqqd;
	}

	public void setXqd_xqqd(Boolean xqd_xqqd) {
		this.xqd_xqqd = xqd_xqqd;
	}

	public Boolean getXqd_gzlqd() {
		return xqd_gzlqd;
	}

	public void setXqd_gzlqd(Boolean xqd_gzlqd) {
		this.xqd_gzlqd = xqd_gzlqd;
	}

	public Boolean getXqd_kfks() {
		return xqd_kfks;
	}

	public void setXqd_kfks(Boolean xqd_kfks) {
		this.xqd_kfks = xqd_kfks;
	}

	public Boolean getXqd_kfjs() {
		return xqd_kfjs;
	}

	public void setXqd_kfjs(Boolean xqd_kfjs) {
		this.xqd_kfjs = xqd_kfjs;
	}

	public Boolean getXqd_csks() {
		return xqd_csks;
	}

	public void setXqd_csks(Boolean xqd_csks) {
		this.xqd_csks = xqd_csks;
	}

	public Boolean getXqd_csjs() {
		return xqd_csjs;
	}

	public void setXqd_csjs(Boolean xqd_csjs) {
		this.xqd_csjs = xqd_csjs;
	}

	public Date getXqd_ssrq() {
		return xqd_ssrq;
	}

	public void setXqd_ssrq(Date xqd_ssrq) {
		this.xqd_ssrq = xqd_ssrq;
	}

	public Date getXqd_ysrq() {
		return xqd_ysrq;
	}

	public void setXqd_ysrq(Date xqd_ysrq) {
		this.xqd_ysrq = xqd_ysrq;
	}

	public Integer getXqd_xqjd() {
		return xqd_xqjd;
	}

	public void setXqd_xqjd(Integer xqd_xqjd) {
		this.xqd_xqjd = xqd_xqjd;
	}

	public Integer getXqd_xqzt() {
		return xqd_xqzt;
	}

	public void setXqd_xqzt(Integer xqd_xqzt) {
		this.xqd_xqzt = xqd_xqzt;
	}

	public String getXqd_bz() {
		return xqd_bz;
	}

	public void setXqd_bz(String xqd_bz) {
		this.xqd_bz = xqd_bz;
	}

	public String getXmxxmc() {
		return xmxxmc;
	}

	public void setXmxxmc(String xmxxmc) {
		this.xmxxmc = xmxxmc;
	}

	public String getSsxtmc() {
		return ssxtmc;
	}

	public void setSsxtmc(String ssxtmc) {
		this.ssxtmc = ssxtmc;
	}

	public String getXqlxmc() {
		return xqlxmc;
	}

	public void setXqlxmc(String xqlxmc) {
		this.xqlxmc = xqlxmc;
	}

	public String getFzrmc() {
		return fzrmc;
	}

	public void setFzrmc(String fzrmc) {
		this.fzrmc = fzrmc;
	}

	public String getKhmc() {
		return khmc;
	}

	public void setKhmc(String khmc) {
		this.khmc = khmc;
	}

	public String getXqjdmc() {
		return xqjdmc;
	}

	public void setXqjdmc(String xqjdmc) {
		this.xqjdmc = xqjdmc;
	}

	public String getXqztmc() {
		return xqztmc;
	}

	public void setXqztmc(String xqztmc) {
		this.xqztmc = xqztmc;
	}

	public String getTcrq() {
		return tcrq;
	}

	public void setTcrq(String tcrq) {
		this.tcrq = tcrq;
	}

	public String getJhksrq() {
		return jhksrq;
	}

	public void setJhksrq(String jhksrq) {
		this.jhksrq = jhksrq;
	}

	public String getJhjsrq() {
		return jhjsrq;
	}

	public void setJhjsrq(String jhjsrq) {
		this.jhjsrq = jhjsrq;
	}

	public String getSsrq() {
		return ssrq;
	}

	public void setSsrq(String ssrq) {
		this.ssrq = ssrq;
	}

	public String getYsrq() {
		return ysrq;
	}

	public void setYsrq(String ysrq) {
		this.ysrq = ysrq;
	}

	@Override
	public String toString() {
		return "XuQiuD [xqd_dm=" + xqd_dm + ", xqd_dh=" + xqd_dh + ", xqd_mc=" + xqd_mc + ", xqd_xmxx=" + xqd_xmxx
				+ ", xqd_ssxt=" + xqd_ssxt + ", xqd_xqlx=" + xqd_xqlx + ", xqd_fzr=" + xqd_fzr + ", xqd_kh=" + xqd_kh
				+ ", xqd_khxt=" + xqd_khxt + ", xqd_khfzr=" + xqd_khfzr + ", xqd_tcrq=" + xqd_tcrq + ", xqd_jhksrq="
				+ xqd_jhksrq + ", xqd_jhjsrq=" + xqd_jhjsrq + ", xqd_gzl=" + xqd_gzl + ", xqd_xqqd=" + xqd_xqqd
				+ ", xqd_gzlqd=" + xqd_gzlqd + ", xqd_kfks=" + xqd_kfks + ", xqd_kfjs=" + xqd_kfjs + ", xqd_csks="
				+ xqd_csks + ", xqd_csjs=" + xqd_csjs + ", xqd_ssrq=" + xqd_ssrq + ", xqd_ysrq=" + xqd_ysrq
				+ ", xqd_xqjd=" + xqd_xqjd + ", xqd_xqzt=" + xqd_xqzt + ", xqd_bz=" + xqd_bz + ", xmxxmc=" + xmxxmc
				+ ", ssxtmc=" + ssxtmc + ", xqlxmc=" + xqlxmc + ", fzrmc=" + fzrmc + ", khmc=" + khmc + ", xqjdmc="
				+ xqjdmc + ", xqztmc=" + xqztmc + ", tcrq=" + tcrq + ", jhksrq=" + jhksrq + ", jhjsrq=" + jhjsrq
				+ ", ssrq=" + ssrq + ", ysrq=" + ysrq + "]";
	}

}
