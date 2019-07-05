package com.edge.reimburse.bxtb.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.alibaba.fastjson.JSONArray;
import com.edge.reimburse.bxtb.entity.MyReport_QueryVo;
import com.edge.reimburse.bxtb.entity.Reimburse_DM_FYLX;
import com.edge.reimburse.bxtb.entity.Reimbursement;

public interface ReportDao {
	// 加载所有的费用类型
	public JSONArray queryAllFYLX();

	// 新增报销填报
	public void saveReimbursement(Reimbursement reimbursement);

	// 编辑报销填报
	public void editReimbursement(Reimbursement reimbursement);

	// 分页显示我的报销
	public List<Reimbursement> queryMyReimbursement(MyReport_QueryVo vo);

	// 显示我的报销的数量
	public Integer queryMyReimbursementCount(MyReport_QueryVo vo);

	// 根据id查询费用类型
	public Reimburse_DM_FYLX queryFYLXById(@Param("fylx_dm") Integer fylx_dm);

	// 根据id查询报销填报对象
	public Reimbursement queryReimbursementById(@Param("reimbursement_dm") Integer reimbursement_dm);

	// 根据Id删除报销填报记录
	public void deleteReimbursementById(@Param("reimbursement_dm") Integer reimbursement_dm);

	// 分页显示我的报销(流程已启动)
	public List<Reimbursement> queryMyReimbursementLC(MyReport_QueryVo vo);

	// 显示我的报销的数量(流程已启动)
	public Integer queryMyReimbursementCountLC(MyReport_QueryVo vo);

	// 分页显示所有的报销(流程已启动)
	public List<Reimbursement> queryAllReimbursementLC(MyReport_QueryVo vo);

	// 显示所有的报销的数量(流程已启动)
	public Integer queryAllReimbursementCountLC(MyReport_QueryVo vo);
}
