package com.edge.projman.xmcgrk.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.alibaba.fastjson.JSONArray;
import com.edge.projman.xmcgrk.entity.XiangMuCGRK;
import com.edge.projman.xmcgrk.entity.Xmcgrk_QueryVo;
import com.edge.projman.xmcgrk.entity.XmrkInFo;

public interface XiangMuCGRKDao {
	// 分页查询项目采购入库数据
	public List<XmrkInFo> queryAllXmrkInFo(Xmcgrk_QueryVo vo);

	// 查询不重复的UUID
	public List<String> queryUUId();

	// 按条件查询项目采购入库所有数量
	public Integer queryAllXmrkInFoCount(Xmcgrk_QueryVo vo);

	// 查询所有的销售合同（流程已完成）
	public JSONArray queryAllXSHT();

	// 通过销售合同代码查询所属的项目采购入库
	public List<XiangMuCGRK> queryXMCGRKByXSHTDM(@Param("proj_Info_Id") Integer proj_Info_Id);

	// 根据项目采购入库代码查询项目采购详情数据(合并相同的项目采购入库下的项目采购详情数据)
	public XmrkInFo queryXMRKXQById(@Param("xmrkorCkId") Integer xmrkorCkId);

	// 根据项目采购入库代码查询项目采购详情数据(合并相同的项目采购入库下的项目采购详情的数量)
	public Integer queryXMRKCountXQById(@Param("xmrkorCkId") Integer xmrkorCkId);

	// 根据项目采购入库代码查询采购详情对象
	public List<XmrkInFo> queryXMCGRKXQByRKId(@Param("xmrkorCkId") Integer xmrkorCkId);

	// 入库
	public void editXmrkInFo(XmrkInFo xmrkInFo);

	// 新增项目采购入库
	public void addXMCGRK(XiangMuCGRK xmcgrk);

	// 根据项目采购入库主键查询项目采购入库对象
	public XiangMuCGRK queryXiangMuCGRKById(@Param("hwId") Integer hwId);

	// 编辑项目采购入库（入库）
	public void editXMCGRKRK(XiangMuCGRK xmcgrk);

	// 新增入库详情
	public void addXmrkInFo(XmrkInFo xmrkInFo);

	// 查询新增后的项目采购入库数据
	public Integer xmcgrkMaxId();

	// 根据id查询项目入库详情对象
	public XmrkInFo queryXmrkInFoByid(@Param("rkInfoId") Integer rkInfoId);

	// 通过销售合同代码查询所属的项目采购入库(高级搜索)
	public List<XiangMuCGRK> queryXMCGRKORCKByXSHTDM(@Param("proj_Info_Id") Integer proj_Info_Id);
}
