package com.edge.yyzx.hyjy.entity;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

/**
 * 会议纪要实体类
 * 
 * @author NingCG
 *
 */
public class HuiYiJY {
	private Integer hyjydm;// 主键
	private String hyjydh;// 会议纪要代号
	private String hyzt;// 会议主题
	private Integer kehudm;// 客户
	private String cyry;// 参与人员
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date beginTime;// 开始时间
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date endTime;// 结束时间
	private String bz;// 备注
	// 辅助属性
	private String khmc;// 客户名称
	private String kssj;// 开始时间
	private String jssj;// 结束时间

	public Integer getHyjydm() {
		return hyjydm;
	}

	public void setHyjydm(Integer hyjydm) {
		this.hyjydm = hyjydm;
	}

	public String getHyjydh() {
		return hyjydh;
	}

	public void setHyjydh(String hyjydh) {
		this.hyjydh = hyjydh;
	}

	public String getHyzt() {
		return hyzt;
	}

	public void setHyzt(String hyzt) {
		this.hyzt = hyzt;
	}

	public Integer getKehudm() {
		return kehudm;
	}

	public void setKehudm(Integer kehudm) {
		this.kehudm = kehudm;
	}

	public String getCyry() {
		return cyry;
	}

	public void setCyry(String cyry) {
		this.cyry = cyry;
	}

	public Date getBeginTime() {
		return beginTime;
	}

	public void setBeginTime(Date beginTime) {
		this.beginTime = beginTime;
	}

	public Date getEndTime() {
		return endTime;
	}

	public void setEndTime(Date endTime) {
		this.endTime = endTime;
	}

	public String getBz() {
		return bz;
	}

	public void setBz(String bz) {
		this.bz = bz;
	}

	public String getKhmc() {
		return khmc;
	}

	public void setKhmc(String khmc) {
		this.khmc = khmc;
	}

	public String getKssj() {
		return kssj;
	}

	public void setKssj(String kssj) {
		this.kssj = kssj;
	}

	public String getJssj() {
		return jssj;
	}

	public void setJssj(String jssj) {
		this.jssj = jssj;
	}

	@Override
	public String toString() {
		return "HuiYiJY [hyjydm=" + hyjydm + ", hyjydh=" + hyjydh + ", hyzt=" + hyzt + ", kehudm=" + kehudm + ", cyry="
				+ cyry + ", beginTime=" + beginTime + ", endTime=" + endTime + ", bz=" + bz + ", khmc=" + khmc
				+ ", kssj=" + kssj + ", jssj=" + jssj + "]";
	}

}
