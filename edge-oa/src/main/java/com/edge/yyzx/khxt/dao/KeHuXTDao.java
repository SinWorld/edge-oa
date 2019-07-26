package com.edge.yyzx.khxt.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.edge.yyzx.khxt.entity.KeHuXT;
import com.edge.yyzx.khxt.entity.KeHuXT_QueryVo;

public interface KeHuXTDao {
	// 分页显示客户系统列表
	public List<KeHuXT> queryKHXTS(KeHuXT_QueryVo vo);

	// 分页显示客户系统列表数量
	public Integer queryKHXTSCount(KeHuXT_QueryVo vo);

	// 新增客户系统
	public void saveKHXT(KeHuXT khxt);

	// 根据id查询客户系统
	public KeHuXT queryKHXTById(@Param("khxt_dm") Integer khxt_dm);
	
	//编辑操作
	public void editKHXT(KeHuXT khxt);
	
	//根据id删除客户系统
	public void deleteKHXTById(@Param("khxt_dm") Integer khxt_dm);
}
