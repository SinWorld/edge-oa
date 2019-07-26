package com.edge.yyzx.sxwd.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.alibaba.fastjson.JSONArray;
import com.edge.yyzx.sxwd.dao.ShangXianWdDao;
import com.edge.yyzx.sxwd.entity.ShangXianWD;
import com.edge.yyzx.sxwd.entity.ShangXianWD_QueryVo;
import com.edge.yyzx.sxwd.entity.Sxwd_DM_WTLX;
import com.edge.yyzx.sxwd.service.inter.ShangXianWdService;

/**
 * 上线文档业务逻辑层
 * 
 * @author NingCG
 *
 */
@Service
public class ShangXianWdServiceImpl implements ShangXianWdService {
	@Resource
	private ShangXianWdDao shangXianWdDao;

	// 分页显示上线文档列表
	public List<ShangXianWD> querySXWDS(ShangXianWD_QueryVo vo) {
		return shangXianWdDao.querySXWDS(vo);
	}

	// 分页显示上线文档列表数量
	public Integer querySXWDSCount(ShangXianWD_QueryVo vo) {
		return shangXianWdDao.querySXWDSCount(vo);
	}

	// ajax查询所有的问题类型
	public JSONArray queryAllWTLX() {
		return shangXianWdDao.queryAllWTLX();
	}

	// 新增操作
	public void saveSxwd(ShangXianWD shangXianWD) {
		shangXianWdDao.saveSxwd(shangXianWD);
	}

	// 根据id查询对应的问题类型
	public Sxwd_DM_WTLX queryWtlxById(Integer wtlx_dm) {
		return shangXianWdDao.queryWtlxById(wtlx_dm);
	}

	//根据id查询对应的上线文档
	public ShangXianWD querySXWDById(Integer sxwd_dm) {
		return shangXianWdDao.querySXWDById(sxwd_dm);
	}
}
