package com.edge.projman.xmssck.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.edge.projman.xmcgrk.entity.XiangMuCGRK;
import com.edge.projman.xmcgrk.entity.Xmcgrk_QueryVo;
import com.edge.projman.xmcgrk.entity.XmrkInFo;

public interface XiangMuSSCKDao {

	// 分页查询项目采购入库数据
	public List<XmrkInFo> queryAllXmckInFo(Xmcgrk_QueryVo vo);

	// 按条件查询项目采购入库所有数量
	public Integer queryAllXmckInFoCount(Xmcgrk_QueryVo vo);

	// 通过销售合同代码查询所属的项目实施出库
	public List<XiangMuCGRK> queryXMSSCKByXSHTDM(@Param("proj_Info_Id") Integer proj_Info_Id);

	// 根据项目实施出库代码查询项目采购详情数据(合并相同的项目实施出库下的项目采购详情数据)
	public List<XmrkInFo> queryXMCKXQById(Integer xmrkorCkId);

	// 根据项目实施出库代码查询采购详情对象
	public List<XmrkInFo> queryXMSSCKXQByCKId(@Param("xmrkorCkId") Integer xmrkorCkId);

	// 编辑项目采购入库（出库）
	public void editXMCGRKCK(XiangMuCGRK xmcgrk);

}
