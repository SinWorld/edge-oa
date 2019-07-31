package com.edge.yyzx.kfxm.entity;

public class XMZT_DM {
	private Integer xmzt_dm;// 主键
	private String xmzt_mc;// 名称
	private String xmzt_dh;// 代号

	public Integer getXmzt_dm() {
		return xmzt_dm;
	}

	public void setXmzt_dm(Integer xmzt_dm) {
		this.xmzt_dm = xmzt_dm;
	}

	public String getXmzt_mc() {
		return xmzt_mc;
	}

	public void setXmzt_mc(String xmzt_mc) {
		this.xmzt_mc = xmzt_mc;
	}

	public String getXmzt_dh() {
		return xmzt_dh;
	}

	public void setXmzt_dh(String xmzt_dh) {
		this.xmzt_dh = xmzt_dh;
	}

	@Override
	public String toString() {
		return "XMZT_DM [xmzt_dm=" + xmzt_dm + ", xmzt_mc=" + xmzt_mc + ", xmzt_dh=" + xmzt_dh + "]";
	}

}
