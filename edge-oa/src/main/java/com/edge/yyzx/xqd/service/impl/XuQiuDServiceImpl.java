package com.edge.yyzx.xqd.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.alibaba.fastjson.JSONArray;
import com.edge.yyzx.xqd.dao.XuQiuDDao;
import com.edge.yyzx.xqd.entity.XuQiuD;
import com.edge.yyzx.xqd.entity.XuQiuD_QueryVo;
import com.edge.yyzx.xqd.service.inter.XuQiuDService;

/**
 * 需求单业务逻辑层
 * 
 * @author NingCG
 *
 */
@Service
public class XuQiuDServiceImpl implements XuQiuDService {
	@Resource
	private XuQiuDDao xuQiuDDao;

	// 分页显示需求单列表
	public List<XuQiuD> queryXQDS(XuQiuD_QueryVo vo) {
		return xuQiuDDao.queryXQDS(vo);
	}

	// 分页显示需求单列表数量
	public Integer queryXQDSCount(XuQiuD_QueryVo vo) {
		return xuQiuDDao.queryXQDSCount(vo);
	}

	// 查询所有的项目信息
	public JSONArray queryAllXMXX() {
		return xuQiuDDao.queryAllXMXX();
	}

	// 查询有的客户系统
	public JSONArray queryAllKHXT() {
		return xuQiuDDao.queryAllKHXT();
	}

	// 查询所有的问题类型
	public JSONArray queryAllWTLX() {
		return xuQiuDDao.queryAllWTLX();
	}

	// 新增需求单
	public void savexqd(XuQiuD xqd) {
		xuQiuDDao.savexqd(xqd);
	}

	// 根据id查询对应的需求单
	public XuQiuD queryXQdById(Integer xqd_dm) {
		return xuQiuDDao.queryXQdById(xqd_dm);
	}

	// 编辑操作
	public void editxqd(XuQiuD xqd) {
		xuQiuDDao.editxqd(xqd);
	}

	// 删除操作
	public void deletexqdById(Integer xqd_dm) {
		xuQiuDDao.deletexqdById(xqd_dm);
	}
}
