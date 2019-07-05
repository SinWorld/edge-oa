package com.edge.reimburse.bxtb.entity;

/**
 * 费用类型字典类
 * 
 * @author NingCG
 *
 */
public class Reimburse_DM_FYLX {
	private Integer fylx_dm;
	private String fylx_mc;
	private String fylx_dh;

	public Integer getFylx_dm() {
		return fylx_dm;
	}

	public void setFylx_dm(Integer fylx_dm) {
		this.fylx_dm = fylx_dm;
	}

	public String getFylx_mc() {
		return fylx_mc;
	}

	public void setFylx_mc(String fylx_mc) {
		this.fylx_mc = fylx_mc;
	}

	public String getFylx_dh() {
		return fylx_dh;
	}

	public void setFylx_dh(String fylx_dh) {
		this.fylx_dh = fylx_dh;
	}

	@Override
	public String toString() {
		return "Reimburse_DM_FYLX [fylx_dm=" + fylx_dm + ", fylx_mc=" + fylx_mc + ", fylx_dh=" + fylx_dh + "]";
	}

}
