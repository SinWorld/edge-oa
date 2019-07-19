package com.edge.WagePerformance.gzff.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.alibaba.fastjson.JSONArray;
import com.edge.WagePerformance.entity.WagePerformance;
import com.edge.WagePerformance.gzff.dao.GzffDao;
import com.edge.WagePerformance.gzff.entity.Gzff_QueryVo;
import com.edge.WagePerformance.gzff.service.inter.GzffService;

@Service
public class GzffServiceImpl implements GzffService {
	@Resource
	private GzffDao gzffDao;

	// 分页显示填报记录
	public List<WagePerformance> queryAllWagePerformance(Gzff_QueryVo vo) {
		return gzffDao.queryAllWagePerformance(vo);
	}

	// 显示填报记录的数量
	public Integer queryAllWagePerformanceCount(Gzff_QueryVo vo) {
		return gzffDao.queryAllWagePerformanceCount(vo);
	}

	// 查询所有的部门
	public JSONArray queryAllBM() {
		return gzffDao.queryAllBM();
	}

}
