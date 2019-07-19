package com.edge.WagePerformance.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.alibaba.fastjson.JSONArray;
import com.edge.WagePerformance.entity.WagePerformance;
import com.edge.WagePerformance.entity.Wage_QueryVo;
import com.edge.system.user.entity.User;
import com.edge.system.user.entity.User_DM_YGLX;

public interface WagePerDao {
	// ajax加载所有的用户
	public JSONArray querAllUser();

	// 下拉用户带出所属部门和所属岗位
	public User queryUserBMandGW(@Param("user_id") Integer user_id);

	// 加载员工类型
	public JSONArray querAllYGLX();

	// 根据id查询员工类型
	public User_DM_YGLX queryYGLXById(@Param("yglx_dm") Integer yglx_dm);

	// 新增操作
	public void saveWage(WagePerformance wagePerformance);

	// 加载个人所填写的工资记录
	public List<WagePerformance> queryMyGZJLS(@Param("wage_per_Tbr") String wage_per_Tbr);

	// 编辑操作
	public void editWage(WagePerformance wagePerformance);

	// 根据id查询工资填报对象
	public WagePerformance queryWageById(@Param("wage_per_Id") Integer wage_per_Id);

	// 根据id删除工资填报对象
	public void deleteReimById(@Param("wage_per_Id") Integer wage_per_Id);

	// 分页显示填报记录
	public List<WagePerformance> queryAllWagePerformance(Wage_QueryVo vo);

	// 显示填报记录的数量
	public Integer queryAllWagePerformanceCount(Wage_QueryVo vo);
}
