package com.edge.index.service.inter;

import java.io.InputStream;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.activiti.engine.repository.ProcessDefinition;
import org.apache.ibatis.annotations.Param;

import com.edge.system.role.entity.Privilege;
import com.edge.utils.MyTask;
import com.edge.utils.QueryVo;
import com.edge.utils.ReviewOpinion;
import com.edge.utils.SYS_FUJIAN;
import com.edge.utils.TaskYWC;

public interface IndexService {
	// 用户登录到首页时根据用户主键查询当前用户的顶级权限
	public List<Privilege> userPrivilegeList(@Param("user_id") Integer user_id);

	// 查询当前用户所有顶级权限下的二级子权限
	public List<Privilege> ejChildrenList(@Param("user_id") Integer user_id, @Param("parent_id") Integer parent_id);

	// 分页查询我的待办
	public List<MyTask> queryMyTask(QueryVo vo);

	// 查询我的待办数量
	public Integer myTaskCount(@Param("user_name") String user_name);

	// 分页查询已完成
	public List<TaskYWC> queryTaskYWC(QueryVo vo);

	// 查询已完成数量
	public Integer TaskYWCCount();

	// 查询business_key拿到业务数据主键查询业务表代办任务描述
	public List<String> queryBusinesskey(@Param("proc_def_id") String proc_def_id);

	// 通过任务主键去得到业务主键
	public String querObject(String task_id);

	/** 获取批注信息，传递的是当前任务ID，获取历史任务ID对应的批注 */
	public List<ReviewOpinion> queryCommentByTaskId(String taskId);

	// 根据流程实例Id去查询历史任务批注
	public List<ReviewOpinion> queryReviewOpinions(@Param("proc_Inst_id") String proc_Inst_id);

	// 通过任务主键去得到业务主键
	public String querObjectId(String task_id);

	// 获取任务Id，获取任务对象，使用任务对象获取流程定义Id，查询流程定义对象
	public ProcessDefinition queryProcessDefinitionByTaskId(String taskId);

	// 代办已完成 使用流程部署Id查询流程定义对象
	public ProcessDefinition queryProcessDefinitionById(String PROC_DEF_ID_);

	/**
	 * 二：查看当前活动，获取当期活动对应的坐标x,y,width,height，将4个值存放到Map<String,Object>中
	 * map集合的key：表示坐标x,y,width,height map集合的value：表示坐标对应的值
	 */
	public Map<String, Object> queryCoordingByTask(String taskId);

	/** 使用部署对象ID和资源图片名称，获取图片的输入流 */
	public InputStream findImageInputStream(String deploymentId, String imageName);

	// 使用任务Id获取当前任务节点中对应的Form key中连接的值
	public String querTaskFromKeyByTaskId(String task_id);

	// 办理个人任务
	public void saveSubmitTask(String taskId, HttpServletRequest request, String advice, String outcome);

	// 向附件中插入数据
	public void addFuJ(SYS_FUJIAN fj);

	// 按业务数据查询相关附件
	public List<SYS_FUJIAN> queryFuJ(@Param("objId") String objId);
}
