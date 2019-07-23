package com.edge.yyzx.kh.entity;

/**
 * 客户实体类
 * 
 * @author NingCG
 *
 */
public class KeHu {
	private Integer khdm;
	private String khdh;
	private String khjc;
	private String khmc;
	private String khms;

	public Integer getKhdm() {
		return khdm;
	}

	public void setKhdm(Integer khdm) {
		this.khdm = khdm;
	}

	public String getKhdh() {
		return khdh;
	}

	public void setKhdh(String khdh) {
		this.khdh = khdh;
	}

	public String getKhjc() {
		return khjc;
	}

	public void setKhjc(String khjc) {
		this.khjc = khjc;
	}

	public String getKhmc() {
		return khmc;
	}

	public void setKhmc(String khmc) {
		this.khmc = khmc;
	}

	public String getKhms() {
		return khms;
	}

	public void setKhms(String khms) {
		this.khms = khms;
	}

	@Override
	public String toString() {
		return "KeHu [khdm=" + khdm + ", khdh=" + khdh + ", khjc=" + khjc + ", khmc=" + khmc + ", khms=" + khms + "]";
	}

}
