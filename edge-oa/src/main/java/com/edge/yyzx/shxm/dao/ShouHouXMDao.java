package com.edge.yyzx.shxm.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.edge.yyzx.shxm.entity.ShouHouXM;
import com.edge.yyzx.shxm.entity.ShouHouXM_QueryVo;

public interface ShouHouXMDao {
	// 分页显示售后项目列表
	public List<ShouHouXM> querySHXMS(ShouHouXM_QueryVo vo);

	// 分页显示售后项目列表数量
	public Integer querySHXMSCount(ShouHouXM_QueryVo vo);

	// 新增售后项目
	public void saveSHXM(ShouHouXM shxm);
	
	//根据id查询售后项目
	public ShouHouXM querySHXMById(@Param("shxm_dm")Integer shxm_dm);
	
	//编辑操作
	public void editSHXM(ShouHouXM shxm);
	
	//根据id删除售后项目
	public void deleteSHXMById(@Param("shxm_dm")Integer shxm_dm);
}
