package com.edge.yyzx.qyzt.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.edge.yyzx.qyzt.entity.QYZT_QueryVo;
import com.edge.yyzx.qyzt.entity.QianYueZT;

public interface QianYueZTDao {
	// 分页显示签约主体列表
	public List<QianYueZT> queryQYZTS(QYZT_QueryVo vo);

	// 分页显示签约主体列表数量
	public Integer queryQYZTSCount(QYZT_QueryVo vo);

	// 新增签约主体
	public void saveQYZT(QianYueZT qyzt);

	// 根据id查询对应的签约主体
	public QianYueZT queryQYZTById(@Param("qyztdm") Integer qyztdm);
	
	//编辑签约主体
	public void editQYZT(QianYueZT qyzt);

}
