package com.edge.yyzx.bqwh.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.edge.yyzx.bqwh.dao.BiaoQianWHDao;
import com.edge.yyzx.bqwh.entity.BQWH_QueryVo;
import com.edge.yyzx.bqwh.entity.BiaoQianWH;
import com.edge.yyzx.bqwh.service.inter.BiaoQianWHService;

/**
 * 标签维护业务逻辑层
 * 
 * @author NingCG
 *
 */
@Service
public class BiaoQianWHServiceImpl implements BiaoQianWHService {
	@Resource
	private BiaoQianWHDao biaoQianWHDao;

	// 分页显示标签维护列表
	public List<BiaoQianWH> queryBQWHS(BQWH_QueryVo vo) {
		return biaoQianWHDao.queryBQWHS(vo);
	}

	// 分页显示标签维护列表数量
	public Integer queryBQWHSCount(BQWH_QueryVo vo) {
		return biaoQianWHDao.queryBQWHSCount(vo);
	}

	// 新增标签维护
	public void saveBqwh(BiaoQianWH bqwh) {
		biaoQianWHDao.saveBqwh(bqwh);
	}

	// 根据id查询对应的标签维护对象
	public BiaoQianWH queryBqwhById(Integer bqwhdm) {
		return biaoQianWHDao.queryBqwhById(bqwhdm);
	}

	// 编辑标签维护
	public void editBqwh(BiaoQianWH bqwh) {
		biaoQianWHDao.editBqwh(bqwh);
	}

	// 根据id删除标签维护对象
	public void deleteBqwhById(Integer bqwhdm) {
		biaoQianWHDao.deleteBqwhById(bqwhdm);
	}
}
