package com.edge.yyzx.kfxm.entity;

/**
 * 项目阶段实体类
 * 
 * @author NingCG
 *
 */
public class XMJD_DM {
	private Integer xmjd_dm;// 主键
	private String xmjd_mc;// 名称
	private String xmjd_dh;// 代号

	public Integer getXmjd_dm() {
		return xmjd_dm;
	}

	public void setXmjd_dm(Integer xmjd_dm) {
		this.xmjd_dm = xmjd_dm;
	}

	public String getXmjd_mc() {
		return xmjd_mc;
	}

	public void setXmjd_mc(String xmjd_mc) {
		this.xmjd_mc = xmjd_mc;
	}

	public String getXmjd_dh() {
		return xmjd_dh;
	}

	public void setXmjd_dh(String xmjd_dh) {
		this.xmjd_dh = xmjd_dh;
	}

	@Override
	public String toString() {
		return "XNJD_DM [xmjd_dm=" + xmjd_dm + ", xmjd_mc=" + xmjd_mc + ", xmjd_dh=" + xmjd_dh + "]";
	}

}
