package com.edge.yyzx.xmxx.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.edge.yyzx.xmxx.dao.XiangMuXXDao;
import com.edge.yyzx.xmxx.entity.XiangMuXX;
import com.edge.yyzx.xmxx.entity.XiangMuXX_QueryVo;
import com.edge.yyzx.xmxx.service.inter.XiangMuXXService;

/**
 * 项目信息业务逻辑层
 * 
 * @author NingCG
 *
 */
@Service
public class XiangMuXXServiceImpl implements XiangMuXXService {
	@Resource
	private XiangMuXXDao xiangMuXXDao;

	// 分页查询所有的项目信息
	public List<XiangMuXX> queryAllxiangMuXX(XiangMuXX_QueryVo vo) {
		return xiangMuXXDao.queryAllxiangMuXX(vo);
	}

	// 按条件查询项目信息所有数量
	public Integer queryAllxiangMuXXCount(XiangMuXX_QueryVo vo) {
		return xiangMuXXDao.queryAllxiangMuXXCount(vo);
	}

	// 新增项目信息
	public void saveXiangMuXX(XiangMuXX xmxx) {
		xiangMuXXDao.saveXiangMuXX(xmxx);
	}

	// 根据id查询对应的项目信息
	public XiangMuXX queryXMXXById(Integer xmxx_dm) {
		return xiangMuXXDao.queryXMXXById(xmxx_dm);
	}

	// 编辑项目信息
	public void editXiangMuXX(XiangMuXX xmxx) {
		xiangMuXXDao.editXiangMuXX(xmxx);
	}

	// 根据id删除项目信息
	public void deleteXiangMuXXById(Integer xmxx_dm) {
		xiangMuXXDao.deleteXiangMuXXById(xmxx_dm);
	}
}
