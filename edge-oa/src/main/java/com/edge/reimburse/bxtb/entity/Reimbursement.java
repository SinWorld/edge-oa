package com.edge.reimburse.bxtb.entity;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

/**
 * 报销实体类
 * 
 * @author NingCG
 *
 */
public class Reimbursement {
	private Integer reimbursement_dm;// 主键
	private Integer proj_dm;// 所属项目
	private String reimbursement_code;// 审批编号
	private Integer reimbursement_dm_fylx;// 费用类型
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date reimbursement_begintime;// 发生日期
	private Double reimbursement_bxje;// 报销金额
	private Integer reimbursement_user_dm;// 费用所属
	private String reimbursement_bxr;// 报销人
	private Double reimbursement_shje;// 审核金额
	private Double reimbursement_fpje;// 发票金额
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date reimbursement_submittime;// 提交时间
	private String reimbursement_details;// 费用明细
	private Integer appr_status;// 审批状态
	private String nextcz;// 下一步操作
	private String db_ms;// 待办描述
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date finish_time;// 完成日期
	private Boolean is_ffdj;// 是否发放登记

	// 辅助属性
	private String proj_name;// 项目名称
	private String fylx_name;// 费用类型
	private String reimbursement_user_name;// 费用所属
	private String appr_status_name;// 审批状态
	private String fsrq;// 发生日期
	private String tjrq;// 提交日期
	private String wcrq;// 完成日期

	public Integer getReimbursement_dm() {
		return reimbursement_dm;
	}

	public void setReimbursement_dm(Integer reimbursement_dm) {
		this.reimbursement_dm = reimbursement_dm;
	}

	public Integer getProj_dm() {
		return proj_dm;
	}

	public void setProj_dm(Integer proj_dm) {
		this.proj_dm = proj_dm;
	}

	public String getReimbursement_code() {
		return reimbursement_code;
	}

	public void setReimbursement_code(String reimbursement_code) {
		this.reimbursement_code = reimbursement_code;
	}

	public Integer getReimbursement_dm_fylx() {
		return reimbursement_dm_fylx;
	}

	public void setReimbursement_dm_fylx(Integer reimbursement_dm_fylx) {
		this.reimbursement_dm_fylx = reimbursement_dm_fylx;
	}

	public Date getReimbursement_begintime() {
		return reimbursement_begintime;
	}

	public void setReimbursement_begintime(Date reimbursement_begintime) {
		this.reimbursement_begintime = reimbursement_begintime;
	}

	public Double getReimbursement_bxje() {
		return reimbursement_bxje;
	}

	public void setReimbursement_bxje(Double reimbursement_bxje) {
		this.reimbursement_bxje = reimbursement_bxje;
	}

	public Integer getReimbursement_user_dm() {
		return reimbursement_user_dm;
	}

	public void setReimbursement_user_dm(Integer reimbursement_user_dm) {
		this.reimbursement_user_dm = reimbursement_user_dm;
	}

	public String getReimbursement_bxr() {
		return reimbursement_bxr;
	}

	public void setReimbursement_bxr(String reimbursement_bxr) {
		this.reimbursement_bxr = reimbursement_bxr;
	}

	public Double getReimbursement_shje() {
		return reimbursement_shje;
	}

	public void setReimbursement_shje(Double reimbursement_shje) {
		this.reimbursement_shje = reimbursement_shje;
	}

	public Double getReimbursement_fpje() {
		return reimbursement_fpje;
	}

	public void setReimbursement_fpje(Double reimbursement_fpje) {
		this.reimbursement_fpje = reimbursement_fpje;
	}

	public Date getReimbursement_submittime() {
		return reimbursement_submittime;
	}

	public void setReimbursement_submittime(Date reimbursement_submittime) {
		this.reimbursement_submittime = reimbursement_submittime;
	}

	public String getReimbursement_details() {
		return reimbursement_details;
	}

	public void setReimbursement_details(String reimbursement_details) {
		this.reimbursement_details = reimbursement_details;
	}

	public Integer getAppr_status() {
		return appr_status;
	}

	public void setAppr_status(Integer appr_status) {
		this.appr_status = appr_status;
	}

	public String getNextcz() {
		return nextcz;
	}

	public void setNextcz(String nextcz) {
		this.nextcz = nextcz;
	}

	public String getDb_ms() {
		return db_ms;
	}

	public void setDb_ms(String db_ms) {
		this.db_ms = db_ms;
	}

	public Date getFinish_time() {
		return finish_time;
	}

	public void setFinish_time(Date finish_time) {
		this.finish_time = finish_time;
	}

	public String getProj_name() {
		return proj_name;
	}

	public void setProj_name(String proj_name) {
		this.proj_name = proj_name;
	}

	public String getFylx_name() {
		return fylx_name;
	}

	public void setFylx_name(String fylx_name) {
		this.fylx_name = fylx_name;
	}

	public String getReimbursement_user_name() {
		return reimbursement_user_name;
	}

	public void setReimbursement_user_name(String reimbursement_user_name) {
		this.reimbursement_user_name = reimbursement_user_name;
	}

	public String getAppr_status_name() {
		return appr_status_name;
	}

	public void setAppr_status_name(String appr_status_name) {
		this.appr_status_name = appr_status_name;
	}

	public Boolean getIs_ffdj() {
		return is_ffdj;
	}

	public void setIs_ffdj(Boolean is_ffdj) {
		this.is_ffdj = is_ffdj;
	}

	public String getFsrq() {
		return fsrq;
	}

	public void setFsrq(String fsrq) {
		this.fsrq = fsrq;
	}

	public String getTjrq() {
		return tjrq;
	}

	public void setTjrq(String tjrq) {
		this.tjrq = tjrq;
	}

	public String getWcrq() {
		return wcrq;
	}

	public void setWcrq(String wcrq) {
		this.wcrq = wcrq;
	}

	@Override
	public String toString() {
		return "Reimbursement [reimbursement_dm=" + reimbursement_dm + ", proj_dm=" + proj_dm + ", reimbursement_code="
				+ reimbursement_code + ", reimbursement_dm_fylx=" + reimbursement_dm_fylx + ", reimbursement_begintime="
				+ reimbursement_begintime + ", reimbursement_bxje=" + reimbursement_bxje + ", reimbursement_user_dm="
				+ reimbursement_user_dm + ", reimbursement_bxr=" + reimbursement_bxr + ", reimbursement_shje="
				+ reimbursement_shje + ", reimbursement_fpje=" + reimbursement_fpje + ", reimbursement_submittime="
				+ reimbursement_submittime + ", reimbursement_details=" + reimbursement_details + ", appr_status="
				+ appr_status + ", nextcz=" + nextcz + ", db_ms=" + db_ms + ", finish_time=" + finish_time
				+ ", is_ffdj=" + is_ffdj + ", proj_name=" + proj_name + ", fylx_name=" + fylx_name
				+ ", reimbursement_user_name=" + reimbursement_user_name + ", appr_status_name=" + appr_status_name
				+ ", fsrq=" + fsrq + ", tjrq=" + tjrq + ", wcrq=" + wcrq + "]";
	}

}
