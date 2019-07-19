package com.edge.system.user.entity;

/**
 * 用户岗位实体类
 * 
 * @author NingCG
 *
 */
public class User_DM_Posittion {
	private Integer posittion_dm;// 主键
	private String posittion_mc;// 名称
	private String posittion_dh;// 代号

	public Integer getPosittion_dm() {
		return posittion_dm;
	}

	public void setPosittion_dm(Integer posittion_dm) {
		this.posittion_dm = posittion_dm;
	}

	public String getPosittion_mc() {
		return posittion_mc;
	}

	public void setPosittion_mc(String posittion_mc) {
		this.posittion_mc = posittion_mc;
	}

	public String getPosittion_dh() {
		return posittion_dh;
	}

	public void setPosittion_dh(String posittion_dh) {
		this.posittion_dh = posittion_dh;
	}

	@Override
	public String toString() {
		return "User_DM_Posittion [posittion_dm=" + posittion_dm + ", posittion_mc=" + posittion_mc + ", posittion_dh="
				+ posittion_dh + "]";
	}

}
