package com.edge.yyzx.wjg.entity;

import java.util.Date;

/**
 * 文件柜实体类
 * 
 * @author NingCG
 *
 */
public class SYS_WenJianG {
	private Integer wenJianGDM;// 文件柜代码
	private String wenJianM;// 文件名称
	private Integer wenJianJDM;// 文件夹代码
	private Integer userDM;// 上传用户代码
	private Date startTime;// 上传日期
	private String scwjm;// 上传文件名
	private String scdz;// 上传文件地址
	private String realWJM;// 文件真实名

	// 辅助属性
	private String beginTime;
	private String userName;
	private String title;

	public Integer getWenJianGDM() {
		return wenJianGDM;
	}

	public void setWenJianGDM(Integer wenJianGDM) {
		this.wenJianGDM = wenJianGDM;
	}

	public String getWenJianM() {
		return wenJianM;
	}

	public void setWenJianM(String wenJianM) {
		this.wenJianM = wenJianM;
	}

	public Integer getWenJianJDM() {
		return wenJianJDM;
	}

	public void setWenJianJDM(Integer wenJianJDM) {
		this.wenJianJDM = wenJianJDM;
	}

	public Integer getUserDM() {
		return userDM;
	}

	public void setUserDM(Integer userDM) {
		this.userDM = userDM;
	}

	public Date getStartTime() {
		return startTime;
	}

	public void setStartTime(Date startTime) {
		this.startTime = startTime;
	}

	public String getBeginTime() {
		return beginTime;
	}

	public void setBeginTime(String beginTime) {
		this.beginTime = beginTime;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getScwjm() {
		return scwjm;
	}

	public void setScwjm(String scwjm) {
		this.scwjm = scwjm;
	}

	public String getScdz() {
		return scdz;
	}

	public void setScdz(String scdz) {
		this.scdz = scdz;
	}

	public String getRealWJM() {
		return realWJM;
	}

	public void setRealWJM(String realWJM) {
		this.realWJM = realWJM;
	}

	@Override
	public String toString() {
		return "SYS_WenJianG [wenJianGDM=" + wenJianGDM + ", wenJianM=" + wenJianM + ", wenJianJDM=" + wenJianJDM
				+ ", userDM=" + userDM + ", startTime=" + startTime + ", scwjm=" + scwjm + ", scdz=" + scdz
				+ ", realWJM=" + realWJM + ", beginTime=" + beginTime + ", userName=" + userName + ", title=" + title
				+ "]";
	}

}
