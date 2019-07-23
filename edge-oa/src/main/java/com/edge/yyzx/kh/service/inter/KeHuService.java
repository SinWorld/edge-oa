package com.edge.yyzx.kh.service.inter;

import java.util.List;

import com.alibaba.fastjson.JSONArray;
import com.edge.yyzx.kh.entity.KeHu;
import com.edge.yyzx.kh.entity.KeHu_QueryVo;

public interface KeHuService {
	// 分页显示客户列表
	public List<KeHu> queryKHS(KeHu_QueryVo vo);

	// 分页显示客户列表数量
	public Integer queryKHSCount(KeHu_QueryVo vo);

	// 新增客户
	public void saveKH(KeHu kh);

	// 根据id查询客户
	public KeHu queryKHById(Integer khdm);

	// 编辑客户
	public void editKH(KeHu kh);

	// 根据id删除客户
	public void deletKhById(Integer khdm);

	// 查询所有的客户
	public JSONArray queryAllKh();
}
