package com.edge.yyzx.kfxm.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.alibaba.fastjson.JSONArray;
import com.edge.yyzx.kfxm.entity.KaiFaXM;
import com.edge.yyzx.kfxm.entity.KaiFaXM_QueryVo;
import com.edge.yyzx.kfxm.entity.XMJD_DM;
import com.edge.yyzx.kfxm.entity.XMZT_DM;

public interface KaiFaXMDao {
	// 分页查询所有的开发项目
	public List<KaiFaXM> queryAllkaiFaXM(KaiFaXM_QueryVo vo);

	// 按条件查询开发项目所有数量
	public Integer queryAllkaiFaXMCount(KaiFaXM_QueryVo vo);

	// ajax查询所有的项目阶段
	public JSONArray queryAllXMJD();

	// ajax 查询所有的项目状态
	public JSONArray queryAllXMZT();

	// ajax查询所有的签约主体
	public JSONArray queryAllQYZT();

	// 新增开发项目
	public void saveKFXM(KaiFaXM kfxm);

	// 根据id查询对应的项目阶段
	public XMJD_DM queryXMJDById(@Param("xmjd_dm") Integer xmjd_dm);

	// 根据id查询对应的项目状态
	public XMZT_DM queryXMZTById(@Param("xmzt_dm") Integer xmzt_dm);

	// 根据id查询对应的开发项目
	public KaiFaXM queryKFXMById(@Param("kfxm_dm") Integer kfxm_dm);

	// 编辑开发项目
	public void editKFXM(KaiFaXM kfxm);

	// 根据id删除数据
	public void deleteKFXMById(@Param("kfxm_dm") Integer kfxm_dm);
}
