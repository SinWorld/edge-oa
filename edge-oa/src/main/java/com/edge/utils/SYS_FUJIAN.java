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
	private String CUNCHUWJM;// 存储文件地址
	private Integer SHANGCHUANYHDM;// 上传用户代码
	private Date SHANGCHUANRQ;// 上传日期
	private String YEWUDM;// 业务表代码

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

	@Override
	public String toString() {
		return "SYS_FUJIAN [FUJIANDM=" + FUJIANDM + ", CUNCHUWJM=" + CUNCHUWJM + ", SHANGCHUANYHDM=" + SHANGCHUANYHDM
				+ ", SHANGCHUANRQ=" + SHANGCHUANRQ + ", YEWUDM=" + YEWUDM + "]";
	}

}
