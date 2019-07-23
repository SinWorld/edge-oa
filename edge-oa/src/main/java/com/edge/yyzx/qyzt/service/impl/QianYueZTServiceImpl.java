package com.edge.yyzx.qyzt.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.edge.yyzx.qyzt.dao.QianYueZTDao;
import com.edge.yyzx.qyzt.entity.QYZT_QueryVo;
import com.edge.yyzx.qyzt.entity.QianYueZT;
import com.edge.yyzx.qyzt.service.inter.QianYueZTService;

/**
 * 签约主体业务逻辑层
 * 
 * @author NingCG
 *
 */
@Service
public class QianYueZTServiceImpl implements QianYueZTService {
	@Resource
	private QianYueZTDao qianYueZTDao;

	// 分页显示签约主体列表
	public List<QianYueZT> queryQYZTS(QYZT_QueryVo vo) {
		return qianYueZTDao.queryQYZTS(vo);
	}

	// 分页显示签约主体列表数量
	public Integer queryQYZTSCount(QYZT_QueryVo vo) {
		return qianYueZTDao.queryQYZTSCount(vo);
	}

	// 新增签约主体
	public void saveQYZT(QianYueZT qyzt) {
		qianYueZTDao.saveQYZT(qyzt);
	}

	// 根据id查询对应的签约主体
	public QianYueZT queryQYZTById(Integer qyztdm) {
		return qianYueZTDao.queryQYZTById(qyztdm);
	}

	// 编辑签约主体
	public void editQYZT(QianYueZT qyzt) {
		qianYueZTDao.editQYZT(qyzt);
	}
}
