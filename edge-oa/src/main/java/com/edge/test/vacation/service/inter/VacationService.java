package com.edge.test.vacation.service.inter;

import java.io.InputStream;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.activiti.engine.repository.ProcessDefinition;
import org.apache.ibatis.annotations.Param;
import org.springframework.ui.Model;

import com.edge.test.vacation.entity.MyTask;
import com.edge.test.vacation.entity.ReviewOpinion;
import com.edge.test.vacation.entity.TaskYWC;
import com.edge.test.vacation.entity.Vacation;
import com.edge.utils.QueryVo;

public interface VacationService {
	// 分页查询请假列表
	public List<Vacation> vacationList(QueryVo vo);

	// 查询所有请假数据
	public Integer vacationCount(@Param("user_id") Integer user_id);

	// 新增请假记录
	public void addVacation(Vacation vacation);

	// 启动流程实例
	public void saveStartProcess(Integer vacation_id, String user_name);

	// 根绝主键查询请假记录数据
	public Vacation queryVacationById(@Param("vacation_id") Integer vacation_id);

	// 分页查询我的待办
	public List<MyTask> queryMyTask(QueryVo vo);

	// 查询我的待办数量
	public Integer myTaskCount(@Param("user_name") String user_name);

	// 查询当前用户添加请假申请最大主键值
	public Integer vacationMaxId(@Param("user_id") Integer user_id);

	// 通过任务主键去得到业务主键
	public String querVacationId(String task_id);

	// 使用任务Id获取当前任务节点中对应的Form key中连接的值
	public String querTaskFromKeyByTaskId(String task_id);

	/**
	 * 已知任务ID，查询ProcessDefinitionEntiy对象， 从而获取当前任务完成之后的连线名称，并放置到List<String>集合中
	 */
	public List<String> queryOutComeListByTaskId(String taskId);

	// 办理个人任务
	public void saveSubmitTask(String taskId, HttpServletRequest request, String advice, String outcome);

	// 查询当前我的任务
	public List<MyTask> queryAllMyTask(@Param("user_name") String user_name);

	// 新增请假时启动流程实例并推动流程至下一节点
	public void saveTask(String id_, HttpServletRequest request);

	// 分页查询已完成
	public List<TaskYWC> queryTaskYWC(QueryVo vo);

	// 查询已完成数量
	public Integer TaskYWCCount();

	/** 获取批注信息，传递的是当前任务ID，获取历史任务ID对应的批注 */
	public List<ReviewOpinion> queryCommentByTaskId(String taskId);

	// 根据流程实例Id去查询历史任务批注
	public List<ReviewOpinion> queryReviewOpinions(@Param("proc_Inst_id") String proc_Inst_id);

	// 请假记录列表点击请假记录查看请假数据
	public List<ReviewOpinion> vacationShowById(Integer vacation_id, Model model);

	// 获取任务Id，获取任务对象，使用任务对象获取流程定义Id，查询流程定义对象
	public ProcessDefinition queryProcessDefinitionByTaskId(String taskId);

	/**使用部署对象ID和资源图片名称，获取图片的输入流*/
	public InputStream findImageInputStream(String deploymentId, String imageName);
}
