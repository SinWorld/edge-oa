package com.edge.yyzx.sxwd.entity;

/**
 * 问题类型实体类
 * 
 * @author NingCG
 *
 */
public class Sxwd_DM_WTLX {
	private Integer wtlx_dm;// 主键
	private String wtlx_dh;// 代号
	private String wtlx_mc;// 名称

	public Integer getWtlx_dm() {
		return wtlx_dm;
	}

	public void setWtlx_dm(Integer wtlx_dm) {
		this.wtlx_dm = wtlx_dm;
	}

	public String getWtlx_dh() {
		return wtlx_dh;
	}

	public void setWtlx_dh(String wtlx_dh) {
		this.wtlx_dh = wtlx_dh;
	}

	public String getWtlx_mc() {
		return wtlx_mc;
	}

	public void setWtlx_mc(String wtlx_mc) {
		this.wtlx_mc = wtlx_mc;
	}

	@Override
	public String toString() {
		return "Sxwd_DM_WTLX [wtlx_dm=" + wtlx_dm + ", wtlx_dh=" + wtlx_dh + ", wtlx_mc=" + wtlx_mc + "]";
	}

}
