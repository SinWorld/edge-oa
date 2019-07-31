package com.edge.yyzx.shxm.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.edge.yyzx.shxm.dao.ShouHouXMDao;
import com.edge.yyzx.shxm.entity.ShouHouXM;
import com.edge.yyzx.shxm.entity.ShouHouXM_QueryVo;
import com.edge.yyzx.shxm.service.inter.ShouHouXMService;

/**
 * 售后项目业务逻辑层
 * 
 * @author NingCG
 *
 */
@Service
public class ShouHouXMServiceImpl implements ShouHouXMService {

	@Resource
	private ShouHouXMDao shouHouXMDao;

	// 分页显示售后项目列表
	public List<ShouHouXM> querySHXMS(ShouHouXM_QueryVo vo) {
		return shouHouXMDao.querySHXMS(vo);
	}

	// 分页显示售后项目列表数量
	public Integer querySHXMSCount(ShouHouXM_QueryVo vo) {
		return shouHouXMDao.querySHXMSCount(vo);
	}

	// 新增售后项目
	public void saveSHXM(ShouHouXM shxm) {
		shouHouXMDao.saveSHXM(shxm);
	}

	// 根据id查询对应的售后项目
	public ShouHouXM querySHXMById(Integer shxm_dm) {
		return shouHouXMDao.querySHXMById(shxm_dm);
	}

	// 编辑操作
	public void editSHXM(ShouHouXM shxm) {
		shouHouXMDao.editSHXM(shxm);
	}

	// 删除操作
	public void deleteSHXMById(Integer shxm_dm) {
		shouHouXMDao.deleteSHXMById(shxm_dm);
	}

}
