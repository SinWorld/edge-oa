package com.edge.yyzx.qyzt.entity;

/**
 * 签约主体
 * 
 * @author NingCG
 *
 */
public class QianYueZT {
	private Integer qyztdm;// 主键
	private String qyztdh;// 签约主体代号
	private String qyztjc;// 签约主体简称
	private String qyztmc;// 签约主体名称
	private String qyztms;// 签约主体描述

	public Integer getQyztdm() {
		return qyztdm;
	}

	public void setQyztdm(Integer qyztdm) {
		this.qyztdm = qyztdm;
	}

	public String getQyztdh() {
		return qyztdh;
	}

	public void setQyztdh(String qyztdh) {
		this.qyztdh = qyztdh;
	}

	public String getQyztjc() {
		return qyztjc;
	}

	public void setQyztjc(String qyztjc) {
		this.qyztjc = qyztjc;
	}

	public String getQyztmc() {
		return qyztmc;
	}

	public void setQyztmc(String qyztmc) {
		this.qyztmc = qyztmc;
	}

	public String getQyztms() {
		return qyztms;
	}

	public void setQyztms(String qyztms) {
		this.qyztms = qyztms;
	}

	@Override
	public String toString() {
		return "QianYueZT [qyztdm=" + qyztdm + ", qyztdh=" + qyztdh + ", qyztjc=" + qyztjc + ", qyztmc=" + qyztmc
				+ ", qyztms=" + qyztms + "]";
	}

}
