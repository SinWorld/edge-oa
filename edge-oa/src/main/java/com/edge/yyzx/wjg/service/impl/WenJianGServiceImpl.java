package com.edge.yyzx.wjg.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.edge.yyzx.wjg.dao.WenJianGDao;
import com.edge.yyzx.wjg.entity.SYS_WenJianG;
import com.edge.yyzx.wjg.entity.SYS_WenJianJ;
import com.edge.yyzx.wjg.entity.Wjg_QueryVo;
import com.edge.yyzx.wjg.service.inter.WenJianGService;

@Service
public class WenJianGServiceImpl implements WenJianGService {
	@Resource
	private WenJianGDao wenJianJDao;

	// 查询顶级节点
	public List<SYS_WenJianJ> queryTopWJJTree() {
		return wenJianJDao.queryTopWJJTree();
	}

	// 查询子节点
	public List<SYS_WenJianJ> queryChildrenWJJTree(Integer parent_id) {
		return wenJianJDao.queryChildrenWJJTree(parent_id);
	}

	// 通过Id查询文件夹
	public SYS_WenJianJ queryWjjById(Integer id) {
		return wenJianJDao.queryWjjById(id);
	}

	// 新增文件夹
	public void saveWjj(SYS_WenJianJ wenJianJ) {
		wenJianJDao.saveWjj(wenJianJ);
	}

	// 查询所有文件夹
	public List<SYS_WenJianJ> allWenJianJ() {
		return wenJianJDao.allWenJianJ();
	}

	// 编辑文件夹
	public void editWJJ(SYS_WenJianJ wenJianJ) {
		wenJianJDao.editWJJ(wenJianJ);
	}

	// 删除文件夹
	public void deleteWJJ(Integer id) {
		wenJianJDao.deleteWJJ(id);
	}

	// 新增文件柜
	public void saveWJG(SYS_WenJianG wjg) {
		wenJianJDao.saveWJG(wjg);
	}

	// 分页查询文件柜所有的文件
	public List<SYS_WenJianG> queryAllWenJ(Wjg_QueryVo vo) {
		return wenJianJDao.queryAllWenJ(vo);
	}

	// 按条件查询文件柜所有数量
	public Integer queryAllWenJCount(Wjg_QueryVo vo) {
		return wenJianJDao.queryAllWenJCount(vo);
	}

	// 根据id查询对应的文件柜
	public SYS_WenJianG queryWJGById(Integer id) {
		return wenJianJDao.queryWJGById(id);
	}

	// 删除文件
	public void deleteWJById(Integer id) {
		wenJianJDao.deleteWJById(id);
	}

	// 根据文件夹Id查询文件柜文件
	public List<SYS_WenJianG> queryWJGByWJJDM(Integer wjjDM) {
		return wenJianJDao.queryWJGByWJJDM(wjjDM);
	}

}
