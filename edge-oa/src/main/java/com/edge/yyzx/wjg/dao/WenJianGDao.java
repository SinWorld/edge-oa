package com.edge.yyzx.wjg.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.edge.projman.xshtdj.entity.XiaoShouHT;
import com.edge.projman.xshtdj.entity.Xsht_QueryVo;
import com.edge.yyzx.wjg.entity.SYS_WenJianG;
import com.edge.yyzx.wjg.entity.SYS_WenJianJ;
import com.edge.yyzx.wjg.entity.Wjg_QueryVo;

public interface WenJianGDao {

	// 查询顶级节点
	public List<SYS_WenJianJ> queryTopWJJTree();

	// 查询所有子节点
	public List<SYS_WenJianJ> queryChildrenWJJTree(@Param("parent_id") Integer parent_id);

	// 通过文件夹Id查询文件夹
	public SYS_WenJianJ queryWjjById(@Param("id") Integer id);

	// 新增文件夹
	public void saveWjj(SYS_WenJianJ wenJianJ);

	// 查询所有文件夹
	public List<SYS_WenJianJ> allWenJianJ();

	// 编辑文件夹
	public void editWJJ(SYS_WenJianJ wenJianJ);

	// 删除文件夹
	public void deleteWJJ(@Param("id") Integer id);

	// 新增文件柜
	public void saveWJG(SYS_WenJianG wjg);

	// 分页查询文件柜所有的文件
	public List<SYS_WenJianG> queryAllWenJ(Wjg_QueryVo vo);

	// 按条件查询文件柜所有数量
	public Integer queryAllWenJCount(Wjg_QueryVo vo);
	
	//根据id查询对应的文件柜文件
	public SYS_WenJianG queryWJGById(@Param("id") Integer id);
	
	//删除文件
	public void deleteWJById(@Param("id") Integer id);
	
	//根据文件夹Id查询文件柜文件
	public List<SYS_WenJianG> queryWJGByWJJDM(@Param("wjjDM") Integer wjjDM);

	
}
