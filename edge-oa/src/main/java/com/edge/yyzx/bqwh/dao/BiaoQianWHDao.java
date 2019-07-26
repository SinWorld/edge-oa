package com.edge.yyzx.bqwh.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.edge.yyzx.bqwh.entity.BQWH_QueryVo;
import com.edge.yyzx.bqwh.entity.BiaoQianWH;

public interface BiaoQianWHDao {
	// 分页显示标签维护列表
	public List<BiaoQianWH> queryBQWHS(BQWH_QueryVo vo);

	// 分页显示标签维护列表数量
	public Integer queryBQWHSCount(BQWH_QueryVo vo);

	// 新增标签维护
	public void saveBqwh(BiaoQianWH bqwh);

	// 根据id查询标签维护对象
	public BiaoQianWH queryBqwhById(@Param("bqwhdm") Integer bqwhdm);
	
	//编辑标签维护
	public void editBqwh(BiaoQianWH bqwh);
	
	//根据id删除标签维护
	public void deleteBqwhById(@Param("bqwhdm") Integer bqwhdm);
}
