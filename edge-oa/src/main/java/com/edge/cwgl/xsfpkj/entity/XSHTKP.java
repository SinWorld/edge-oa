package com.edge.cwgl.xsfpkj.entity;

import java.util.Date;

/**
 * 销售合同开票实体类
 * 
 * @author NingCG
 *
 */
public class XSHTKP {
	private Integer xshtkp_dm;// 主键
	private String xshtkp_code;// 编号
	private Integer xshtkp_dm_jxx;// 所属进销项
	private Integer xshtkp_dm_fplb;// 所属发票类别
	private Double xshtkp_fpsl;// 发票税率
	private String xshtkp_fpbh;// 发票编号
	private Date xshtkp_kprq;// 开票日期
	private Double xshtkp_kpje;// 开票金额
	private Double xshtkp_wsje;// 未税金额
	private Double xshtkp_sj;// 税金
	private String xshtkp_bz;// 备注
	private String xshtkp_djr;// 登记人
	private Integer xshtkp_xshtdm;// 所属销售合同
	private String xshtkp_uuid;// 不重复uuid
	private Boolean is_kp;// 是否开票
	private String xshtkp_lxr;// 联系人
	private String xshtkp_lxdh;// 联系电话

	// 辅助属性
	private String jxxmc;
	private String fplbmc;
	private String xshtmc;

	public Integer getXshtkp_dm() {
		return xshtkp_dm;
	}

	public void setXshtkp_dm(Integer xshtkp_dm) {
		this.xshtkp_dm = xshtkp_dm;
	}

	public String getXshtkp_code() {
		return xshtkp_code;
	}

	public void setXshtkp_code(String xshtkp_code) {
		this.xshtkp_code = xshtkp_code;
	}

	public Integer getXshtkp_dm_jxx() {
		return xshtkp_dm_jxx;
	}

	public void setXshtkp_dm_jxx(Integer xshtkp_dm_jxx) {
		this.xshtkp_dm_jxx = xshtkp_dm_jxx;
	}

	public Integer getXshtkp_dm_fplb() {
		return xshtkp_dm_fplb;
	}

	public void setXshtkp_dm_fplb(Integer xshtkp_dm_fplb) {
		this.xshtkp_dm_fplb = xshtkp_dm_fplb;
	}

	public Double getXshtkp_fpsl() {
		return xshtkp_fpsl;
	}

	public void setXshtkp_fpsl(Double xshtkp_fpsl) {
		this.xshtkp_fpsl = xshtkp_fpsl;
	}

	public String getXshtkp_fpbh() {
		return xshtkp_fpbh;
	}

	public void setXshtkp_fpbh(String xshtkp_fpbh) {
		this.xshtkp_fpbh = xshtkp_fpbh;
	}

	public Date getXshtkp_kprq() {
		return xshtkp_kprq;
	}

	public void setXshtkp_kprq(Date xshtkp_kprq) {
		this.xshtkp_kprq = xshtkp_kprq;
	}

	public Double getXshtkp_kpje() {
		return xshtkp_kpje;
	}

	public void setXshtkp_kpje(Double xshtkp_kpje) {
		this.xshtkp_kpje = xshtkp_kpje;
	}

	public Double getXshtkp_wsje() {
		return xshtkp_wsje;
	}

	public void setXshtkp_wsje(Double xshtkp_wsje) {
		this.xshtkp_wsje = xshtkp_wsje;
	}

	public Double getXshtkp_sj() {
		return xshtkp_sj;
	}

	public void setXshtkp_sj(Double xshtkp_sj) {
		this.xshtkp_sj = xshtkp_sj;
	}

	public String getXshtkp_bz() {
		return xshtkp_bz;
	}

	public void setXshtkp_bz(String xshtkp_bz) {
		this.xshtkp_bz = xshtkp_bz;
	}

	public String getXshtkp_djr() {
		return xshtkp_djr;
	}

	public void setXshtkp_djr(String xshtkp_djr) {
		this.xshtkp_djr = xshtkp_djr;
	}

	public Integer getXshtkp_xshtdm() {
		return xshtkp_xshtdm;
	}

	public void setXshtkp_xshtdm(Integer xshtkp_xshtdm) {
		this.xshtkp_xshtdm = xshtkp_xshtdm;
	}

	public String getXshtkp_uuid() {
		return xshtkp_uuid;
	}

	public void setXshtkp_uuid(String xshtkp_uuid) {
		this.xshtkp_uuid = xshtkp_uuid;
	}

	public Boolean getIs_kp() {
		return is_kp;
	}

	public void setIs_kp(Boolean is_kp) {
		this.is_kp = is_kp;
	}

	public String getJxxmc() {
		return jxxmc;
	}

	public void setJxxmc(String jxxmc) {
		this.jxxmc = jxxmc;
	}

	public String getFplbmc() {
		return fplbmc;
	}

	public void setFplbmc(String fplbmc) {
		this.fplbmc = fplbmc;
	}

	public String getXshtmc() {
		return xshtmc;
	}

	public void setXshtmc(String xshtmc) {
		this.xshtmc = xshtmc;
	}

	public String getXshtkp_lxr() {
		return xshtkp_lxr;
	}

	public void setXshtkp_lxr(String xshtkp_lxr) {
		this.xshtkp_lxr = xshtkp_lxr;
	}

	public String getXshtkp_lxdh() {
		return xshtkp_lxdh;
	}

	public void setXshtkp_lxdh(String xshtkp_lxdh) {
		this.xshtkp_lxdh = xshtkp_lxdh;
	}

	@Override
	public String toString() {
		return "XSHTKP [xshtkp_dm=" + xshtkp_dm + ", xshtkp_code=" + xshtkp_code + ", xshtkp_dm_jxx=" + xshtkp_dm_jxx
				+ ", xshtkp_dm_fplb=" + xshtkp_dm_fplb + ", xshtkp_fpsl=" + xshtkp_fpsl + ", xshtkp_fpbh=" + xshtkp_fpbh
				+ ", xshtkp_kprq=" + xshtkp_kprq + ", xshtkp_kpje=" + xshtkp_kpje + ", xshtkp_wsje=" + xshtkp_wsje
				+ ", xshtkp_sj=" + xshtkp_sj + ", xshtkp_bz=" + xshtkp_bz + ", xshtkp_djr=" + xshtkp_djr
				+ ", xshtkp_xshtdm=" + xshtkp_xshtdm + ", xshtkp_uuid=" + xshtkp_uuid + ", is_kp=" + is_kp
				+ ", xshtkp_lxr=" + xshtkp_lxr + ", xshtkp_lxdh=" + xshtkp_lxdh + ", jxxmc=" + jxxmc + ", fplbmc="
				+ fplbmc + ", xshtmc=" + xshtmc + "]";
	}

}
