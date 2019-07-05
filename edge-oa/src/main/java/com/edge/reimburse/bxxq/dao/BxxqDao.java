package com.edge.reimburse.bxxq.dao;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.edge.reimburse.bxxq.entiy.BaoXiaoInFo;

public interface BxxqDao {
	//查询所有用户的报销详情
	public List<BaoXiaoInFo> queryAllUserBxxq();
	
	//按日期检索报销详情
	public List<BaoXiaoInFo> queryAllUserBxxqByRQ(@Param("beginTime")Date beginTime,@Param("endTime")Date endTime);
}
