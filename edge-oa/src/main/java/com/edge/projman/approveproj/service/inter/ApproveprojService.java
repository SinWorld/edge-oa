package com.edge.projman.approveproj.service.inter;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.activiti.engine.repository.ProcessDefinition;
import org.apache.ibatis.annotations.Param;
import org.springframework.ui.Model;

import com.alibaba.fastjson.JSONArray;
import com.edge.projman.approveproj.entity.Foll_up_Proj;
import com.edge.utils.APPR_DM_STATUS;
import com.edge.utils.BP_DM_METHOD;
import com.edge.projman.approveproj.entity.Foll_QueryVo;
import com.edge.utils.ReviewOpinion;

public interface ApproveprojService {
	// 分页查询所有的项目信息
	public List<Foll_up_Proj> queryAllxiangMuXX(Foll_QueryVo vo);

	// 按条件查询项目信息所有数量
	public Integer queryAllxiangMuXXCount(Foll_QueryVo vo);

	// ajax查询所有的招标方式
	public JSONArray allZBFS();

	// ajax 查询所有所有用户
	public JSONArray allUser(String userName);

	// 根据Id查询招标方式对象
	public BP_DM_METHOD queryZBFSById(@Param("bp_Method_Id") Integer bp_Method_Id);

	// 项目立项
	public void saveXiangMuXX(Foll_up_Proj foll_up_Proj);

	// 查询立项最大主键即为新增时的主键值
	public Integer xiangMuXXId();

	// 根据Id查询项目信息对象
	public Foll_up_Proj queryXiangMuXXById(@Param("proj_Id") Integer proj_Id);

	// 启动流程实例
	public void saveStartProcess(String user_name, HttpServletRequest request);

	// 新增项目信息时启动流程实例并推动流程至下一节点
	public void saveTask(String id_, HttpServletRequest request);

	// 跟新项目信息
	public void editXiangMuXX(Foll_up_Proj foll_up_Proj);

	// 根据Id查询审批状态
	public APPR_DM_STATUS queryStatus(@Param("appr_Status_Id") Integer appr_Status_Id);

	// 请假记录列表点击请假记录查看请假数据
	public List<ReviewOpinion> xiangMuXXShowById(Integer proj_Id, Model model,HttpSession session);

	// 点击业务数据列表进入查看页显示对应的流程图返回流程部署Id
	public String queryProcinstById(@Param("processInstanceId") String processInstanceId);

	// 通过流程部署Id查询流程部署对象
	public ProcessDefinition queryProcessDefinitionById(String PROC_DEF_ID_);

	// 高级搜索区查询所有的项目信息
	public JSONArray queryAllXMXX();

	// 高级搜索区查询所有的审批状态
	public JSONArray queryAllSPZT();
	
}
