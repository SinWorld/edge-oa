package com.edge.yyzx.sxwd.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.alibaba.fastjson.JSONArray;
import com.edge.yyzx.sxwd.entity.ShangXianWD;
import com.edge.yyzx.sxwd.entity.ShangXianWD_QueryVo;
import com.edge.yyzx.sxwd.entity.Sxwd_DM_WTLX;

public interface ShangXianWdDao {
	// 分页显示上线文档列表
	public List<ShangXianWD> querySXWDS(ShangXianWD_QueryVo vo);

	// 分页显示上线文档列表数量
	public Integer querySXWDSCount(ShangXianWD_QueryVo vo);

	// ajax查询所有的问题类型
	public JSONArray queryAllWTLX();

	// 根据id查询对应的问题类型
	public Sxwd_DM_WTLX queryWtlxById(@Param("wtlx_dm") Integer wtlx_dm);

	// 新增操作
	public void saveSxwd(ShangXianWD shangXianWD);
	
	//根据id查询对应的上线文档
	public ShangXianWD querySXWDById(@Param("sxwd_dm")Integer sxwd_dm);
}
