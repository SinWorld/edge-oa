package com.edge.yyzx.sxwd.service.inter;

import java.util.List;

import com.alibaba.fastjson.JSONArray;
import com.edge.yyzx.sxwd.entity.ShangXianWD;
import com.edge.yyzx.sxwd.entity.ShangXianWD_QueryVo;
import com.edge.yyzx.sxwd.entity.Sxwd_DM_WTLX;

public interface ShangXianWdService {
	// 分页显示上线文档列表
	public List<ShangXianWD> querySXWDS(ShangXianWD_QueryVo vo);

	// 分页显示上线文档列表数量
	public Integer querySXWDSCount(ShangXianWD_QueryVo vo);

	// ajax查询所有的问题类型
	public JSONArray queryAllWTLX();

	// 根据id查询对应的问题类型
	public Sxwd_DM_WTLX queryWtlxById(Integer wtlx_dm);

	// 新增操作
	public void saveSxwd(ShangXianWD shangXianWD);

	// 根据id查询对应的上线文档
	public ShangXianWD querySXWDById(Integer sxwd_dm);
}
