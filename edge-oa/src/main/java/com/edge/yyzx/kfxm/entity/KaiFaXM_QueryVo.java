package com.edge.yyzx.kfxm.entity;

import java.util.Date;

import org.omg.PortableInterceptor.INACTIVE;

/**
 * 高级搜索查询实体类
 * 
 * @author NingCG
 *
 */
public class KaiFaXM_QueryVo {
	// 当前页
	private Integer page;
	// 每页数
	private Integer size = 10;
	// 开始行
	private Integer startRow = 0;

	private String kfxm_dh;// 开发项目代号
	private String kfxm_mc;// 开发项目名称
	private Integer kfxm_xmjd;// 项目阶段
	private Integer kfxm_xmzt;// 项目状态
	private Integer kfxm_kh;// 客户
	private Integer kfxm_qyzt;// 签约主体
	private String kfxm_xmms;// 项目描述

	public Integer getPage() {
		return page;
	}

	public void setPage(Integer page) {
		this.page = page;
	}

	public Integer getSize() {
		return size;
	}

	public void setSize(Integer size) {
		this.size = size;
	}

	public Integer getStartRow() {
		return startRow;
	}

	public void setStartRow(Integer startRow) {
		this.startRow = startRow;
	}

	public String getKfxm_dh() {
		return kfxm_dh;
	}

	public void setKfxm_dh(String kfxm_dh) {
		this.kfxm_dh = kfxm_dh;
	}

	public String getKfxm_mc() {
		return kfxm_mc;
	}

	public void setKfxm_mc(String kfxm_mc) {
		this.kfxm_mc = kfxm_mc;
	}

	public Integer getKfxm_xmjd() {
		return kfxm_xmjd;
	}

	public void setKfxm_xmjd(Integer kfxm_xmjd) {
		this.kfxm_xmjd = kfxm_xmjd;
	}

	public Integer getKfxm_xmzt() {
		return kfxm_xmzt;
	}

	public void setKfxm_xmzt(Integer kfxm_xmzt) {
		this.kfxm_xmzt = kfxm_xmzt;
	}

	public Integer getKfxm_kh() {
		return kfxm_kh;
	}

	public void setKfxm_kh(Integer kfxm_kh) {
		this.kfxm_kh = kfxm_kh;
	}

	public Integer getKfxm_qyzt() {
		return kfxm_qyzt;
	}

	public void setKfxm_qyzt(Integer kfxm_qyzt) {
		this.kfxm_qyzt = kfxm_qyzt;
	}

	public String getKfxm_xmms() {
		return kfxm_xmms;
	}

	public void setKfxm_xmms(String kfxm_xmms) {
		this.kfxm_xmms = kfxm_xmms;
	}

	@Override
	public String toString() {
		return "KaiFaXM_QueryVo [page=" + page + ", size=" + size + ", startRow=" + startRow + ", kfxm_dh=" + kfxm_dh
				+ ", kfxm_mc=" + kfxm_mc + ", kfxm_xmjd=" + kfxm_xmjd + ", kfxm_xmzt=" + kfxm_xmzt + ", kfxm_kh="
				+ kfxm_kh + ", kfxm_qyzt=" + kfxm_qyzt + ", kfxm_xmms=" + kfxm_xmms + "]";
	}

}
