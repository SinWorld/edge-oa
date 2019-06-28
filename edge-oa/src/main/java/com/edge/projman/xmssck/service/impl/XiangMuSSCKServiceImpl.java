package com.edge.projman.xmssck.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.edge.projman.xmcgrk.entity.XiangMuCGRK;
import com.edge.projman.xmcgrk.entity.Xmcgrk_QueryVo;
import com.edge.projman.xmcgrk.entity.XmrkInFo;
import com.edge.projman.xmssck.dao.XiangMuSSCKDao;
import com.edge.projman.xmssck.service.inter.XiangMuSSCKService;

@Service
public class XiangMuSSCKServiceImpl implements XiangMuSSCKService {
	@Resource
	private XiangMuSSCKDao xiangMuSSCKDao;

	// 分页查询项目采购入库数据
	public List<XmrkInFo> queryAllXmckInFo(Xmcgrk_QueryVo vo) {
		return xiangMuSSCKDao.queryAllXmckInFo(vo);
	}

	// 按条件查询项目采购入库所有数量
	public Integer queryAllXmckInFoCount(Xmcgrk_QueryVo vo) {
		return xiangMuSSCKDao.queryAllXmckInFoCount(vo);
	}

	public List<XiangMuCGRK> queryXMSSCKByXSHTDM(Integer proj_Info_Id) {
		return xiangMuSSCKDao.queryXMSSCKByXSHTDM(proj_Info_Id);
	}

	// 根据项目实施出库代码查询项目采购详情数据(合并相同的项目实施出库下的项目采购详情数据)
	public List<XmrkInFo> queryXMCKXQById(Integer xmrkorCkId) {
		return xiangMuSSCKDao.queryXMCKXQById(xmrkorCkId);
	}

	// 根据项目实施出库代码查询采购详情对象
	public List<XmrkInFo> queryXMSSCKXQByCKId(Integer xmrkorCkId) {
		return xiangMuSSCKDao.queryXMSSCKXQByCKId(xmrkorCkId);
	}

	// 编辑项目采购入库（出库）
	public void editXMCGRKCK(XiangMuCGRK xmcgrk) {
		xiangMuSSCKDao.editXMCGRKCK(xmcgrk);

	}
}
