package com.edge.index.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.edge.system.role.entity.Privilege;
import com.edge.utils.MyTask;
import com.edge.utils.QueryVo;
import com.edge.utils.ReviewOpinion;
import com.edge.utils.TaskYWC;

public interface IndexDao {
	// 用户登录到首页时根据用户主键查询当前用户的顶级权限
	public List<Privilege> userPrivilegeList(@Param("user_id") Integer user_id);

	// 查询当前用户所有顶级权限下的二级子权限或三级权限
	public List<Privilege> ejChildrenList(@Param("user_id") Integer user_id, @Param("parent_id") Integer parent_id);

	// （分页）查询我的代办
	public List<MyTask> queryMyTask(QueryVo vo);

	// 查询我的代办数量
	public Integer myTaskCount(@Param("user_name") String user_name);

	// 分页查询已完成
	public List<TaskYWC> queryTaskYWC(QueryVo vo);

	// 查询已完成数量
	public Integer TaskYWCCount();

	// 查询business_key拿到业务数据主键查询业务表代办任务描述
	public List<String> queryBusinesskey(@Param("proc_def_id") String proc_def_id);

	// 根据流程实例Id去查询历史任务批注
	public List<ReviewOpinion> queryReviewOpinions(@Param("proc_Inst_id") String proc_Inst_id);

}
