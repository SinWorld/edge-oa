package com.edge.reimburse.bxff.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.edge.reimburse.bxff.dao.BxffDao;
import com.edge.reimburse.bxff.service.inter.BxffService;
import com.edge.reimburse.bxtb.entity.MyReport_QueryVo;
import com.edge.reimburse.bxtb.entity.Reimbursement;

@Service
public class BxffServiceImpl implements BxffService {
	@Resource
	private BxffDao bxffDao;

	// 分页显示我的报销(流程已启动)
	public List<Reimbursement> queryMyReimbursementLC(MyReport_QueryVo vo) {
		return bxffDao.queryMyReimbursementLC(vo);
	}

	// 显示我的报销的数量(流程已启动)
	public Integer queryMyReimbursementCountLC(MyReport_QueryVo vo) {
		return bxffDao.queryMyReimbursementCountLC(vo);
	}

	// 分页显示所有的报销(流程已启动)
	public List<Reimbursement> queryAllReimbursementLC(MyReport_QueryVo vo) {
		return bxffDao.queryAllReimbursementLC(vo);
	}

	// 显示所有的报销的数量(流程已启动)
	public Integer queryAllReimbursementCountLC(MyReport_QueryVo vo) {
		return bxffDao.queryAllReimbursementCountLC(vo);
	}

}
