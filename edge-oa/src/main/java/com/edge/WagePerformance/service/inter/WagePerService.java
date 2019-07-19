package com.edge.WagePerformance.service.inter;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import com.alibaba.fastjson.JSONArray;
import com.edge.WagePerformance.entity.WagePerformance;
import com.edge.WagePerformance.entity.Wage_QueryVo;
import com.edge.system.user.entity.User;
import com.edge.system.user.entity.User_DM_YGLX;
import com.edge.utils.ReviewOpinion;

public interface WagePerService {
	// ajax加载所有的用户
	public JSONArray querAllUser();

	// 下拉用户带出所属部门和所属岗位
	public User queryUserBMandGW(Integer user_id);

	// 加载员工类型
	public JSONArray querAllYGLX();

	// 根据id查询员工类型
	public User_DM_YGLX queryYGLXById(Integer yglx_dm);

	// 新增操作
	public void saveWage(WagePerformance wagePerformance);

	// 加载个人所填写的工资记录
	public List<WagePerformance> queryMyGZJLS(String wage_per_Tbr);

	// 编辑操作
	public void editWage(WagePerformance wagePerformance);

	// 根据id查询工资填报对象
	public WagePerformance queryWageById(Integer wage_per_Id);

	// 根据id删除工资填报对象
	public void deleteReimById(Integer wage_per_Id);

	// 启动流程实例
	public void saveStartProcess(String user_name, HttpServletRequest request, WagePerformance wagePerformance);

	// 分页显示填报记录
	public List<WagePerformance> queryAllWagePerformance(Wage_QueryVo vo);

	// 显示填报记录的数量
	public Integer queryAllWagePerformanceCount(Wage_QueryVo vo);

	// 点击报销记录查看业务数据
	public List<ReviewOpinion> wageShowById(Integer wage_per_Id, Model model, HttpSession session);

	// 新增项目信息时启动流程实例并推动流程至下一节点
	public void saveTask(String taskId, HttpServletRequest request);

}
