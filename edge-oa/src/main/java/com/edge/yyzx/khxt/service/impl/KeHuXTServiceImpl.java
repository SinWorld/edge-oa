package com.edge.yyzx.khxt.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.edge.yyzx.khxt.dao.KeHuXTDao;
import com.edge.yyzx.khxt.entity.KeHuXT;
import com.edge.yyzx.khxt.entity.KeHuXT_QueryVo;
import com.edge.yyzx.khxt.service.inter.KeHuXTService;

@Service
public class KeHuXTServiceImpl implements KeHuXTService {
	@Resource
	private KeHuXTDao keHuXTDao;

	// 分页显示客户系统列表
	public List<KeHuXT> queryKHXTS(KeHuXT_QueryVo vo) {
		return keHuXTDao.queryKHXTS(vo);
	}

	// 分页显示客户系统列表数量
	public Integer queryKHXTSCount(KeHuXT_QueryVo vo) {
		return keHuXTDao.queryKHXTSCount(vo);
	}

	// 新增客户系统
	public void saveKHXT(KeHuXT khxt) {
		keHuXTDao.saveKHXT(khxt);
	}

	// 根据id查询对应的客户系统
	public KeHuXT queryKHXTById(Integer khxt_dm) {
		return keHuXTDao.queryKHXTById(khxt_dm);
	}

	// 编辑操作
	public void editKHXT(KeHuXT khxt) {
		keHuXTDao.editKHXT(khxt);
	}

	// 根据id删除客户
	public void deleteKHXTById(Integer khxt_dm) {
		keHuXTDao.deleteKHXTById(khxt_dm);
	}
}
