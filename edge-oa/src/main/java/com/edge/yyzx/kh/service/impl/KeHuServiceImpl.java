package com.edge.yyzx.kh.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.alibaba.fastjson.JSONArray;
import com.edge.yyzx.kh.dao.KeHuDao;
import com.edge.yyzx.kh.entity.KeHu;
import com.edge.yyzx.kh.entity.KeHu_QueryVo;
import com.edge.yyzx.kh.service.inter.KeHuService;

/**
 * 客户业务逻辑层
 * 
 * @author NingCG
 *
 */
@Service
public class KeHuServiceImpl implements KeHuService {
	@Resource
	private KeHuDao keHuDao;

	// 分页显示客户列表
	public List<KeHu> queryKHS(KeHu_QueryVo vo) {
		return keHuDao.queryKHS(vo);
	}

	// 分页显示客户列表数量
	public Integer queryKHSCount(KeHu_QueryVo vo) {
		return keHuDao.queryKHSCount(vo);
	}

	// 新增客户
	public void saveKH(KeHu kh) {
		keHuDao.saveKH(kh);
	}

	// 根据id查询客户
	public KeHu queryKHById(Integer khdm) {
		return keHuDao.queryKHById(khdm);
	}

	// 编辑客户
	public void editKH(KeHu kh) {
		keHuDao.editKH(kh);
	}

	// 根据id删除客户
	public void deletKhById(Integer khdm) {
		keHuDao.deletKhById(khdm);
	}

	// 查询所有的客户
	public JSONArray queryAllKh() {
		return keHuDao.queryAllKh();
	}
}
