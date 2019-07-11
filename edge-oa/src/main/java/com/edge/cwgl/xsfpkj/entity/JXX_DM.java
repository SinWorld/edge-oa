package com.edge.cwgl.xsfpkj.entity;

/**
 * 进销项 字典实体类
 * 
 * @author NingCG
 *
 */

public class JXX_DM {
	private Integer jxx_dm;// 主键
	private String jxx_mc;// 名称
	private String jxx_dh;// 代号

	public Integer getJxx_dm() {
		return jxx_dm;
	}

	public void setJxx_dm(Integer jxx_dm) {
		this.jxx_dm = jxx_dm;
	}

	public String getJxx_mc() {
		return jxx_mc;
	}

	public void setJxx_mc(String jxx_mc) {
		this.jxx_mc = jxx_mc;
	}

	public String getJxx_dh() {
		return jxx_dh;
	}

	public void setJxx_dh(String jxx_dh) {
		this.jxx_dh = jxx_dh;
	}

	@Override
	public String toString() {
		return "JXX_DM [jxx_dm=" + jxx_dm + ", jxx_mc=" + jxx_mc + ", jxx_dh=" + jxx_dh + "]";
	}

}
