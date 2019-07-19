package com.edge.WagePerformance.gzff.service.inter;

import java.util.List;

import com.alibaba.fastjson.JSONArray;
import com.edge.WagePerformance.entity.WagePerformance;
import com.edge.WagePerformance.gzff.entity.Gzff_QueryVo;

public interface GzffService {
	// 分页显示填报记录
	public List<WagePerformance> queryAllWagePerformance(Gzff_QueryVo vo);

	// 显示填报记录的数量
	public Integer queryAllWagePerformanceCount(Gzff_QueryVo vo);

	// 查询所有的部门
	public JSONArray queryAllBM();
}
