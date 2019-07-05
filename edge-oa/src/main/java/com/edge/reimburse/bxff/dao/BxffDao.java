package com.edge.reimburse.bxff.dao;

import java.util.List;

import com.edge.reimburse.bxtb.entity.MyReport_QueryVo;
import com.edge.reimburse.bxtb.entity.Reimbursement;

/**
 * 报销发放dao
 * 
 * @author NingCG
 *
 */
public interface BxffDao {
	// 分页显示我的报销(流程已启动)
	public List<Reimbursement> queryMyReimbursementLC(MyReport_QueryVo vo);

	// 显示我的报销的数量(流程已启动)
	public Integer queryMyReimbursementCountLC(MyReport_QueryVo vo);

	// 分页显示所有的报销(流程已启动)
	public List<Reimbursement> queryAllReimbursementLC(MyReport_QueryVo vo);

	// 显示所有的报销的数量(流程已启动)
	public Integer queryAllReimbursementCountLC(MyReport_QueryVo vo);
}
