package com.edge.cwgl.xsfpkj.entity;

/**
 * 发票类别代码
 * 
 * @author NingCG
 *
 */
public class FPLB_DM {
	private Integer fplb_dm;// 主键
	private String fplb_mc;// 名称
	private String fplb_dh;// 代号

	public Integer getFplb_dm() {
		return fplb_dm;
	}

	public void setFplb_dm(Integer fplb_dm) {
		this.fplb_dm = fplb_dm;
	}

	public String getFplb_mc() {
		return fplb_mc;
	}

	public void setFplb_mc(String fplb_mc) {
		this.fplb_mc = fplb_mc;
	}

	public String getFplb_dh() {
		return fplb_dh;
	}

	public void setFplb_dh(String fplb_dh) {
		this.fplb_dh = fplb_dh;
	}

	@Override
	public String toString() {
		return "FPLB_DM [fplb_dm=" + fplb_dm + ", fplb_mc=" + fplb_mc + ", fplb_dh=" + fplb_dh + "]";
	}

}
