package com.edge.yyzx.hyjy.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.alibaba.fastjson.JSONArray;
import com.edge.yyzx.hyjy.dao.HuiYiJYDao;
import com.edge.yyzx.hyjy.entity.HuiYiJY;
import com.edge.yyzx.hyjy.entity.HuiYiJY_QueryVo;
import com.edge.yyzx.hyjy.service.inter.HuiYiJYService;

/**
 * 业务逻辑层
 * 
 * @author NingCG
 *
 */
@Service
public class HuiYiJYServiceImpl implements HuiYiJYService {
	@Resource
	private HuiYiJYDao huiYiJYDao;

	// 分页显示会议纪要列表
	public List<HuiYiJY> queryHYJYS(HuiYiJY_QueryVo vo) {
		return huiYiJYDao.queryHYJYS(vo);
	}

	// 分页显示会议纪要列表数量
	public Integer queryHYJYSCount(HuiYiJY_QueryVo vo) {
		return huiYiJYDao.queryHYJYSCount(vo);
	}

	// 新增会议纪要
	public void saveHyjy(HuiYiJY hyjy) {
		huiYiJYDao.saveHyjy(hyjy);
	}

	// 根据id查询对应的会议纪要
	public HuiYiJY queryHYJYById(Integer hyjydm) {
		return huiYiJYDao.queryHYJYById(hyjydm);
	}

	// 编辑会议纪要
	public void editHYJY(HuiYiJY hyjy) {
		huiYiJYDao.editHYJY(hyjy);
	}

	// 根据id删除会议纪要
	public void deleteHyjyById(Integer hyjydm) {
		huiYiJYDao.deleteHyjyById(hyjydm);
	}

	
}
