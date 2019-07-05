package com.edge.reimburse.bxxq.service.impl;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.edge.reimburse.bxxq.dao.BxxqDao;
import com.edge.reimburse.bxxq.entiy.BaoXiaoInFo;
import com.edge.reimburse.bxxq.service.inter.BxxqService;

@Service
public class BxxqServiceImpl implements BxxqService {
	@Resource
	private BxxqDao bxxqDao;

	// 查询所有用户的报销详情
	public List<BaoXiaoInFo> queryAllUserBxxq() {
		return bxxqDao.queryAllUserBxxq();
	}

	//按日期检索用户报销详情
	public List<BaoXiaoInFo> queryAllUserBxxqByRQ(Date beginTime, Date endTime) {
		return bxxqDao.queryAllUserBxxqByRQ(beginTime, endTime);
	}

}
