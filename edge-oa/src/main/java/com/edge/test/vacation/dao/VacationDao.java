package com.edge.test.vacation.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.edge.test.vacation.entity.MyTasks;
import com.edge.test.vacation.entity.ReviewOpinions;
import com.edge.test.vacation.entity.TaskYWCS;
import com.edge.test.vacation.entity.Vacation;
import com.edge.utils.QueryVo;

public interface VacationDao {
	//分页查询当前用户的请假列表
	public List<Vacation> vacationList(QueryVo vo);
	
	//查询当前用户的所有请假数据
	public Integer vacationCount();
	
	//新增请假记录
	public void addVacation(Vacation vacation);
	
	//根绝主键查询请假记录数据
	public Vacation queryVacationById(@Param("vacation_id")Integer vacation_id);
	
	//（分页）查询我的代办
	public List<MyTasks> queryMyTask(QueryVo vo);
	
	//查询我的代办数量
	public Integer myTaskCount(@Param("user_name")String user_name);
	
	//查询当前用户添加请假申请最大主键值
	public Integer vacationMaxId(@Param("user_id")Integer user_id);
	
	//查询当前我的任务
	public List<MyTasks> queryAllMyTask(@Param("user_name")String user_name);
	
	//分页查询已完成
	public List<TaskYWCS> queryTaskYWC(QueryVo vo);
	
	//查询已完成数量
	public Integer TaskYWCCount();
	
	//根据流程实例Id去查询历史任务批注
	public List<ReviewOpinions> queryReviewOpinions(@Param("proc_Inst_id")String proc_Inst_id);
	
	//点击业务数据列表进入查看页显示对应的流程图返回流程部署Id
	public String queryProcinstById(@Param("processInstanceId")String processInstanceId);
	
}
