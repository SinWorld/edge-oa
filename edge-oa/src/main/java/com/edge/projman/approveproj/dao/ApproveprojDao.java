package com.edge.projman.approveproj.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.alibaba.fastjson.JSONArray;
import com.edge.projman.approveproj.entity.Foll_up_Proj;
import com.edge.utils.APPR_DM_STATUS;
import com.edge.utils.BP_DM_METHOD;
import com.edge.projman.approveproj.entity.Foll_QueryVo;

public interface ApproveprojDao {
	// 分页查询所有的项目信息
	public List<Foll_up_Proj> queryAllxiangMuXX(Foll_QueryVo vo);

	// 按条件查询项目信息所有数量
	public Integer queryAllxiangMuXXCount(Foll_QueryVo vo);

	// ajax查询所有的招标方式
	public JSONArray allZBFS();

	// ajax 查询所有所有用户(过滤管理员 admin)
	public JSONArray allUser(@Param("userName") String userName);

	// 根据Id查询招标方式对象
	public BP_DM_METHOD queryZBFSById(@Param("bp_Method_Id") Integer bp_Method_Id);

	// 项目立项
	public void saveXiangMuXX(Foll_up_Proj foll_up_Proj);

	// 查询立项最大主键即为新增时的主键值
	public Integer xiangMuXXId();

	// 根据Id查询项目信息对象
	public Foll_up_Proj queryXiangMuXXById(@Param("proj_Id") Integer proj_Id);


	// 跟新项目信息
	public void editXiangMuXX(Foll_up_Proj foll_up_Proj);

	// 根据Id查询审批状态
	public APPR_DM_STATUS queryStatus(@Param("appr_Status_Id") Integer appr_Status_Id);

	// 点击业务数据列表进入查看页显示对应的流程图返回流程部署Id
	public String queryProcinstById(@Param("processInstanceId") String processInstanceId);
	
	//高级搜索区查询所有的项目信息
	public JSONArray queryAllXMXX();
	
	//高级搜索区查询所有的审批状态
	public JSONArray queryAllSPZT();

}
