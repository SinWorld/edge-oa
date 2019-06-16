package com.edge.utils;

import java.util.Date;

/**
 * 附件实体类
 * 
 * @author NingCG
 *
 */
public class SYS_FUJIAN {
	private Integer FUJIANDM;// 附件代码
	private String CUNCHUWJM;// 存储文件名
	private Integer SHANGCHUANYHDM;// 上传用户代码
	private Date SHANGCHUANRQ;// 上传日期
	private String YEWUDM;// 业务表代码
	private String SHANGCHUANDZ;// 上传文件地址
	private String REALWJM;// 文件真实名

	public Integer getFUJIANDM() {
		return FUJIANDM;
	}

	public void setFUJIANDM(Integer fUJIANDM) {
		FUJIANDM = fUJIANDM;
	}

	public String getCUNCHUWJM() {
		return CUNCHUWJM;
	}

	public void setCUNCHUWJM(String cUNCHUWJM) {
		CUNCHUWJM = cUNCHUWJM;
	}

	public Integer getSHANGCHUANYHDM() {
		return SHANGCHUANYHDM;
	}

	public void setSHANGCHUANYHDM(Integer sHANGCHUANYHDM) {
		SHANGCHUANYHDM = sHANGCHUANYHDM;
	}

	public Date getSHANGCHUANRQ() {
		return SHANGCHUANRQ;
	}

	public void setSHANGCHUANRQ(Date sHANGCHUANRQ) {
		SHANGCHUANRQ = sHANGCHUANRQ;
	}

	public String getYEWUDM() {
		return YEWUDM;
	}

	public void setYEWUDM(String yEWUDM) {
		YEWUDM = yEWUDM;
	}

	public String getSHANGCHUANDZ() {
		return SHANGCHUANDZ;
	}

	public void setSHANGCHUANDZ(String sHANGCHUANDZ) {
		SHANGCHUANDZ = sHANGCHUANDZ;
	}

	public String getREALWJM() {
		return REALWJM;
	}

	public void setREALWJM(String rEALWJM) {
		REALWJM = rEALWJM;
	}

	@Override
	public String toString() {
		return "SYS_FUJIAN [FUJIANDM=" + FUJIANDM + ", CUNCHUWJM=" + CUNCHUWJM + ", SHANGCHUANYHDM=" + SHANGCHUANYHDM
				+ ", SHANGCHUANRQ=" + SHANGCHUANRQ + ", YEWUDM=" + YEWUDM + ", SHANGCHUANDZ=" + SHANGCHUANDZ
				+ ", REALWJM=" + REALWJM + "]";
	}

}
