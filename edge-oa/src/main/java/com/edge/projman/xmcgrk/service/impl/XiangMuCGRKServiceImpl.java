package com.edge.projman.xmcgrk.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.alibaba.fastjson.JSONArray;
import com.edge.projman.xmcgrk.dao.XiangMuCGRKDao;
import com.edge.projman.xmcgrk.entity.Xmcgrk_QueryVo;
import com.edge.projman.xmcgrk.service.inter.XiangMuCGRKService;
import com.edge.projman.xshtdj.entity.HuoWuInFor;

@Service
public class XiangMuCGRKServiceImpl implements XiangMuCGRKService {

	@Resource
	private XiangMuCGRKDao xiangMuCGRKDao;

	// 分页查询项目采购入库数据
	public List<HuoWuInFor> queryAllHWCPNR(Xmcgrk_QueryVo vo) {
		return xiangMuCGRKDao.queryAllHWCPNR(vo);
	}

	// 按条件查询项目采购入库所有数量
	public Integer queryAllXiangMuCGRKCount(Xmcgrk_QueryVo vo) {
		return xiangMuCGRKDao.queryAllXiangMuCGRKCount(vo);
	}

	// 查询所有的销售合同（流程已完成）
	public JSONArray queryAllXSHT() {
		return xiangMuCGRKDao.queryAllXSHT();
	}

	// 通过销售合同代码查询所属的货物采购内容
	public List<HuoWuInFor> queryHWCGNRS(Integer proj_Info_Id) {
		return xiangMuCGRKDao.queryHWCGNRS(proj_Info_Id);
	}

	// 根据货物产品代码查询货物产品数据
	public HuoWuInFor queryHWCPNRById(Integer hwId) {
		return xiangMuCGRKDao.queryHWCPNRById(hwId);
	}

	// 入库
	public void hwrk(HuoWuInFor huoWuInFor) {
		xiangMuCGRKDao.hwrk(huoWuInFor);
	}

}
