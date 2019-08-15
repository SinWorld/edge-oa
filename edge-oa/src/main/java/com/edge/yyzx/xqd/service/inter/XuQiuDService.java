package com.edge.yyzx.xqd.service.inter;

import java.util.List;

import com.alibaba.fastjson.JSONArray;
import com.edge.yyzx.xqd.entity.XuQiuD;
import com.edge.yyzx.xqd.entity.XuQiuD_QueryVo;

public interface XuQiuDService {
	// 分页显示需求单列表
	public List<XuQiuD> queryXQDS(XuQiuD_QueryVo vo);

	// 分页显示需求单列表数量
	public Integer queryXQDSCount(XuQiuD_QueryVo vo);

	// 查询项目信息
	public JSONArray queryAllXMXX();

	// 查询所有的客户系统
	public JSONArray queryAllKHXT();

	// 查询所有的问题类型
	public JSONArray queryAllWTLX();

	// 新增需求单
	public void savexqd(XuQiuD xqd);

	// 根据id查询需求单
	public XuQiuD queryXQdById(Integer xqd_dm);

	// 编辑操作
	public void editxqd(XuQiuD xqd);

	// 删除操作
	public void deletexqdById(Integer xqd_dm);
}
