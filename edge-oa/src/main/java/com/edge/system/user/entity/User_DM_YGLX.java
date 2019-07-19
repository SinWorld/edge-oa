package com.edge.system.user.entity;

/**
 * 员工类型
 * 
 * @author NingCG
 *
 */
public class User_DM_YGLX {
	private Integer yglx_dm;
	private String yglx_mc;
	private String yglx_dh;

	public Integer getYglx_dm() {
		return yglx_dm;
	}

	public void setYglx_dm(Integer yglx_dm) {
		this.yglx_dm = yglx_dm;
	}

	public String getYglx_mc() {
		return yglx_mc;
	}

	public void setYglx_mc(String yglx_mc) {
		this.yglx_mc = yglx_mc;
	}

	public String getYglx_dh() {
		return yglx_dh;
	}

	public void setYglx_dh(String yglx_dh) {
		this.yglx_dh = yglx_dh;
	}

	@Override
	public String toString() {
		return "User_DM_YGLX [yglx_dm=" + yglx_dm + ", yglx_mc=" + yglx_mc + ", yglx_dh=" + yglx_dh + "]";
	}

}
