package com.edge.reimburse.bxxq.entiy;

/**
 * 报销详情实体类
 * 
 * @author NingCG
 *
 */
public class BaoXiaoInFo {
	private Double reimbursement_bxje;
	private String reimbursement_bxr;

	public Double getReimbursement_bxje() {
		return reimbursement_bxje;
	}

	public void setReimbursement_bxje(Double reimbursement_bxje) {
		this.reimbursement_bxje = reimbursement_bxje;
	}

	public String getReimbursement_bxr() {
		return reimbursement_bxr;
	}

	public void setReimbursement_bxr(String reimbursement_bxr) {
		this.reimbursement_bxr = reimbursement_bxr;
	}

	@Override
	public String toString() {
		return "BaoXiaoInFo [reimbursement_bxje=" + reimbursement_bxje + ", reimbursement_bxr=" + reimbursement_bxr
				+ "]";
	}

}
