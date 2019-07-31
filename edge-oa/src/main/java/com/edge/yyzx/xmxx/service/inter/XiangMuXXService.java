package com.edge.yyzx.xmxx.service.inter;

import java.util.List;

import com.edge.yyzx.xmxx.entity.XiangMuXX;
import com.edge.yyzx.xmxx.entity.XiangMuXX_QueryVo;

public interface XiangMuXXService {
	// 分页查询所有的项目信息
	public List<XiangMuXX> queryAllxiangMuXX(XiangMuXX_QueryVo vo);

	// 按条件查询项目信息所有数量
	public Integer queryAllxiangMuXXCount(XiangMuXX_QueryVo vo);

	// 新增项目信息
	public void saveXiangMuXX(XiangMuXX xmxx);

	// 根据id查询对应的项目信息
	public XiangMuXX queryXMXXById(Integer xmxx_dm);

	// 编辑项目信息
	public void editXiangMuXX(XiangMuXX xmxx);

	// 根据id删除项目信息
	public void deleteXiangMuXXById(Integer xmxx_dm);
}
