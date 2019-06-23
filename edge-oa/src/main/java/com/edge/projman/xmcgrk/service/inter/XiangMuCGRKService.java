package com.edge.projman.xmcgrk.service.inter;

import java.util.List;

import com.alibaba.fastjson.JSONArray;
import com.edge.projman.xmcgrk.entity.Xmcgrk_QueryVo;
import com.edge.projman.xshtdj.entity.HuoWuInFor;

public interface XiangMuCGRKService {
	// 分页查询项目采购入库数据
	public List<HuoWuInFor> queryAllHWCPNR(Xmcgrk_QueryVo vo);

	// 按条件查询项目采购入库所有数量
	public Integer queryAllXiangMuCGRKCount(Xmcgrk_QueryVo vo);

	// 查询所有的销售合同（流程已完成）
	public JSONArray queryAllXSHT();

	// 通过销售合同代码查询所属的货物采购内容
	public List<HuoWuInFor> queryHWCGNRS(Integer proj_Info_Id);

	// 根据货物产品代码查询货物产品数据
	public HuoWuInFor queryHWCPNRById(Integer hwId);

	// 入库
	public void hwrk(HuoWuInFor huoWuInFor);
}
