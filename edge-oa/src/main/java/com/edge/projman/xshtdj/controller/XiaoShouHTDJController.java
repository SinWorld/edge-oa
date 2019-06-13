package com.edge.projman.xshtdj.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.activiti.engine.repository.ProcessDefinition;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.edge.index.service.inter.IndexService;
import com.edge.projman.approveproj.entity.Foll_up_Proj;
import com.edge.projman.approveproj.service.inter.ApproveprojService;
import com.edge.projman.xshtdj.entity.XiaoShouHT;
import com.edge.projman.xshtdj.entity.Xsht_QueryVo;
import com.edge.projman.xshtdj.service.inter.XiaoShouHTDJService;
import com.edge.system.department.entity.Department;
import com.edge.system.department.service.inter.DepartmentService;
import com.edge.system.user.entity.User;
import com.edge.system.user.service.inter.UserService;
import com.edge.utils.BP_DM_METHOD;
import com.edge.utils.Page;
import com.edge.utils.ReviewOpinion;
import com.google.gson.Gson;

/**
 * 销售合同登记控制层
 * 
 * @author NingCG
 *
 */
@Controller
@RequestMapping(value = "xshtdj")
public class XiaoShouHTDJController {
	@Resource
	private XiaoShouHTDJService xiaoShouHTDJService;
	@Resource
	private ApproveprojService approveprojService;
	@Resource
	private UserService userService;
	@Resource
	private DepartmentService departmentService;
	@Resource
	private IndexService indexService;

	// 跳转至销售合同登记列表页面
	@RequestMapping(value = "/initXshtdjList.do")
	public String initXshtdjList() {
		return "projman/xshtdj/xshtdjList";
	}

	// 分页查询销售合同
	@RequestMapping(value = "/xshtdjList.do")
	@ResponseBody
	public String xshtdjList(Integer page, Xsht_QueryVo xsht_QueryVo, String time1, String time2) {
		// new出QueryVo查询对象
		Xsht_QueryVo vo = new Xsht_QueryVo();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");// 设置日期格式
		// 获得Page对象
		Page<XiaoShouHT> pages = new Page<XiaoShouHT>();
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		// 每页数
		if (vo != null) {
			pages.setPage((page - 1) * vo.getSize() + 1);
			vo.setPage((page - 1) * vo.getSize() + 1);
			vo.setStartRow((pages.getPage()));
			vo.setSize(page * 10);
			if (xsht_QueryVo.getProj_Code() != null && xsht_QueryVo.getProj_Code() != "") {
				vo.setProj_Code(xsht_QueryVo.getProj_Code().trim());
			}
			if (xsht_QueryVo.getProj_Info_Id() != null) {
				vo.setProj_Info_Id(xsht_QueryVo.getProj_Info_Id());
			}
			if (xsht_QueryVo.getUser_Id() != null && xsht_QueryVo.getUser_Id() != "") {
				vo.setUser_Id(xsht_QueryVo.getUser_Id());
			}
			if (xsht_QueryVo.getNextCZ() != null && xsht_QueryVo.getNextCZ() != "") {
				vo.setNextCZ(xsht_QueryVo.getNextCZ().trim());
			}
			if (xsht_QueryVo.getAppr_Status() != null) {
				vo.setAppr_Status(xsht_QueryVo.getAppr_Status());
			}
			if (time1 != null && time1 != "") {
				// 将String类型转换为Date类型
				try {
					vo.setDate(sdf.parse(time1));
				} catch (ParseException e) {
					e.printStackTrace();
				}
			}
			if (time2 != null && time2 != "") {
				try {
					vo.setDate2(sdf.parse(time2));
				} catch (ParseException e) {
					e.printStackTrace();
				}
			}
		}
		// 总页数
		pages.setTotal(xiaoShouHTDJService.queryAllXiaoShouHTCount(xsht_QueryVo));
		pages.setRows(xiaoShouHTDJService.queryAllXiaoShouHt(vo));
		Gson gson = new Gson();
		map.put("code", 0);
		map.put("msg", "");
		map.put("count", xiaoShouHTDJService.queryAllXiaoShouHTCount(xsht_QueryVo));
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");// 设置日期格式
		List<XiaoShouHT> rows = pages.getRows();
		// 遍历该集合 设置审批状态和提交时间
		for (XiaoShouHT row : rows) {
			if (row.getAppr_Status() != null) {
				row.setSpzt(xiaoShouHTDJService.queryStatus(row.getAppr_Status()).getAppr_Status_Name());
			}
			row.setTjTime((df.format(row.getSubm_Time())));
		}
		map.put("data", pages.getRows());
		String json = gson.toJson(map);
		return json.toString();
	}

	// 高级搜索查询所有的销售合同
	@RequestMapping(value = "queryAllXSHT.do")
	@ResponseBody
	public String queryAllXSHT() {
		JSONArray jsonArray = xiaoShouHTDJService.queryAllXSHT();
		return jsonArray.toString();
	}

	// 跳转至合同登记新增页面
	@RequestMapping(value = "/initXSHTDJAppend.do")
	public String initXSHTDJAppend() {
		return "projman/xshtdj/saveXshtdj";
	}

	// 查询所有的已立项的项目信息
	@RequestMapping(value = "/queryAllYLXXMXX.do")
	@ResponseBody
	public String queryAllYLXXMXX() {
		JSONArray jsonArray = xiaoShouHTDJService.queryAllYLXXMXX();
		return jsonArray.toString();
	}

	// 查询所有的未立项的项目信息
	@RequestMapping(value = "/queryAllWLXXMXX.do")
	@ResponseBody
	public String queryAllWLXXMXX() {
		JSONArray jsonArray = xiaoShouHTDJService.queryAllWLXXMXX();
		return jsonArray.toString();
	}

	// ajax根据Id查询对应的项目信息
	@RequestMapping(value = "/queryXMXXById.do")
	@ResponseBody
	public String queryXMXXById(@RequestParam Integer proj_Id) {
		Foll_up_Proj xmxx = approveprojService.queryXiangMuXXById(proj_Id);
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("xmxx", xmxx);
		return jsonObject.toString();
	}

	// 新增销售合同
	@RequestMapping(value = "/saveXSHT.do")
	public String saveXSHT(XiaoShouHT xiaoShouHT, HttpServletRequest request, Model model) {
		// 从session中获取用户名和用户主键
		HttpSession session = request.getSession();
		// 当前登录系统用户主键和用户名
		Integer userId = (Integer) session.getAttribute("userId");
		// 为xiaoShouHT 销售合同编号赋值
		xiaoShouHT.setProj_Code(this.bianHao());
		// 根据提交的我方负责人代码去查询用户名
		User user = userService.queryUserById(xiaoShouHT.getUser_Id());
		if (user != null) {
			// 设置我方负责人姓名
			xiaoShouHT.setUser_Name(user.getUser_name());
			// 根据我方负责人用户主键查询对应的所属部门
			Department fzrDepartMent = departmentService.queryDepartmentById(user.getUser_department_id());
			// 设置负责人部门主键
			xiaoShouHT.setDepa_Id(fzrDepartMent.getDep_id());
			// 设置负责人部门名称
			xiaoShouHT.setDepa(fzrDepartMent.getDep_name());
		}
		// 设置提交用户代码
		xiaoShouHT.setSubm_User_Id(userId);
		// 查找当前提交用户对象
		User dqUser = userService.queryUserById(userId);
		// 根据当前提交用户的部门代码去查询部门对象
		Department department = departmentService.queryDepartmentById(dqUser.getUser_department_id());
		xiaoShouHT.setSubm_Depa_Id(department.getDep_id());// 设置提交用户部门主键
		xiaoShouHT.setSubm_Depa(department.getDep_name());// 设置提交用户部门名称
		xiaoShouHT.setSubm_Time(new Date());// 设置提交时间
		xiaoShouHT.setAppr_Status(2);// 审批状态(1.完成 2.运行中 3.撤销);
		xiaoShouHT.setSubm_Flag(true);// 提交标识（0：未提交，1：提交）
		xiaoShouHT.setCheck_Flag(false);// 审核标识（0：未审核，1：已审核）
		// 设置为未中标转合同
		xiaoShouHT.setWinn_Bid(false);
		// 设置代办任务描述
		xiaoShouHT.setDb_MS("销售合同登记");
		xiaoShouHTDJService.saveXSHT(xiaoShouHT);
		model.addAttribute("flag", true);

		// 启动流程实例
		xiaoShouHTDJService.saveStartProcess(dqUser.getUser_name(), request);
		return "projman/xshtdj/saveXshtdj";
	}

	// 生成编号
	private String bianHao() {
		// 1.设置项目编号 编号规则为’P’+年、月、日、时、分、秒+六位随机数 如：P20190604172610123456
		// 获取当前系统时间 并获取年月日时分秒
		Calendar now = Calendar.getInstance();
		String year = String.valueOf(now.get(Calendar.YEAR));
		String month = String.valueOf(now.get(Calendar.MONTH) + 1);
		if (now.get(Calendar.MONTH) + 1 <= 9) {
			month = 0 + month;
		}
		String day = String.valueOf(now.get(Calendar.DAY_OF_MONTH));
		if (now.get(Calendar.DAY_OF_MONTH) <= 9) {
			day = 0 + day;
		}
		String Hourse = String.valueOf(now.get(Calendar.HOUR_OF_DAY));
		if (now.get(Calendar.HOUR_OF_DAY) <= 9) {
			Hourse = 0 + Hourse;
		}
		String minute = String.valueOf(now.get(Calendar.MINUTE));
		if (now.get(Calendar.MINUTE) <= 9) {
			minute = 0 + minute;
		}
		String second = String.valueOf(now.get(Calendar.SECOND));
		if (now.get(Calendar.SECOND) <= 9) {
			second = 0 + second;
		}
		// 产生六位随机数
		Random r = new Random();
		String x = String.valueOf(r.nextInt(999999));
		String time = year + month + day + Hourse + minute + second;
		String bh = "S" + time + x;
		return bh;
	}

	// 跳转至查看页面并回显数据
	@RequestMapping(value = "/xshtdjShow.do")
	public String vacationShow(@RequestParam Integer id, String task_id, Model model) {
		// 根据id查询出销售合同数据
		XiaoShouHT xsht = xiaoShouHTDJService.queryXSHTById(id);
		// 格式化签订日期、合同计划完成日期、质保金到期日期
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		BP_DM_METHOD zbfs = null;// 招标方式
		Foll_up_Proj xmxx = null;// 所属项目
		User user = null;// 我方负责人
		if (xsht != null) {
			xsht.setQdrq(sdf.format(xsht.getCont_Date()));
			xsht.setHtjhwcrq(sdf.format(xsht.getFinish_Time()));
			xsht.setZbjdqrq(sdf.format(xsht.getQual_Expiredate()));
			// 查询所选招标方式对象
			zbfs = approveprojService.queryZBFSById(xsht.getBp_Method());
			// 查询所属项目
			xmxx = approveprojService.queryXiangMuXXById(xsht.getProj_Id());
			// 查询我方负责人
			user = userService.queryUserById(xsht.getUser_Id());
		}

		/** 二：已知任务ID，查询ProcessDefinitionEntiy对象，从而获取当前任务完成之后的连线名称，并放置到List<String>集合中 */
		// List<String> outcomeList = vacationService.queryOutComeListByTaskId(task_id);
		// model.addAttribute("outcomeList", outcomeList);
		List<ReviewOpinion> reviewOpinions = indexService.queryCommentByTaskId(task_id);
		// 流程图
		ProcessDefinition pd = indexService.queryProcessDefinitionByTaskId(task_id);
		// 流程节点高亮map
		Map<String, Object> map = indexService.queryCoordingByTask(task_id);
		model.addAttribute("reviewOpinions", reviewOpinions);
		model.addAttribute("xsht", xsht);
		model.addAttribute("taskId", task_id);
		model.addAttribute("zbfs", zbfs);
		model.addAttribute("user", user);
		model.addAttribute("xmxx", xmxx);
		model.addAttribute("deploymentId", pd.getDeploymentId());
		model.addAttribute("imageName", pd.getDiagramResourceName());
		model.addAttribute("map", map);
		return "projman/xshtdj/xshtdjShow";
	}

	// 编辑销售合同登记回显销售合同数据
	@RequestMapping(value = "/initEditXSHTDJ.do")
	public String initEditXMXX(@RequestParam Integer objId, Integer taskId, Model model) {
		// 根据Id查询销售合同对象
		XiaoShouHT xsht = xiaoShouHTDJService.queryXSHTById(objId);
		// 格式化签订日期、合同计划完成日期、质保金到期日期
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		BP_DM_METHOD zbfs = null;// 招标方式
		Foll_up_Proj xmxx = null;// 所属项目
		User user = null;// 我方负责人
		if (xsht != null) {
			xsht.setQdrq(sdf.format(xsht.getCont_Date()));
			xsht.setHtjhwcrq(sdf.format(xsht.getFinish_Time()));
			xsht.setZbjdqrq(sdf.format(xsht.getQual_Expiredate()));
			// 查询所选招标方式对象
			zbfs = approveprojService.queryZBFSById(xsht.getBp_Method());
			// 查询所属项目
			xmxx = approveprojService.queryXiangMuXXById(xsht.getProj_Id());
			// 查询我方负责人
			user = userService.queryUserById(xsht.getUser_Id());
		}
		model.addAttribute("xsht", xsht);
		model.addAttribute("zbfs", zbfs);
		model.addAttribute("user", user);
		model.addAttribute("xmxx", xmxx);
		model.addAttribute("taskId", taskId);
		return "projman/xshtdj/editXshtdj";
	}

	// 编辑操作并启动流程
	@RequestMapping(value = "/editXSHT.do")
	public String editXMXX(XiaoShouHT xsht, Model model, HttpServletRequest request, Integer taskId) {
		// 设置审核状态为运行中
		xsht.setAppr_Status(2);
		xiaoShouHTDJService.editXSHT(xsht);
		model.addAttribute("flag", true);
		// 推动流程进入下一节点
		approveprojService.saveTask(String.valueOf(taskId), request);
		return "projman/xshtdj/editXshtdj";
	}

	// 点击业务列表进入查看页面
	@RequestMapping(value = "/xiaoShouHTShowById.do")
	public String xiangMuXXShowById(@RequestParam Integer proj_Id, Model model, HttpServletRequest request) {
		// 获取session
		HttpSession session = request.getSession();
		// 根据id查询出请假记录数据(评审意见)
		List<ReviewOpinion> reviewOpinions = xiaoShouHTDJService.xiaoShouHTShowById(proj_Id, model, session);
		/** 二：已知任务ID，查询ProcessDefinitionEntiy对象，从而获取当前任务完成之后的连线名称，并放置到List<String>集合中 */
		// List<String> outcomeList = vacationService.queryOutComeListByTaskId(task_id);
		// model.addAttribute("outcomeList", outcomeList);
		// 取出reviewOpinions中的流程部署Id
		String procinstById = null;
		for (ReviewOpinion reviewOpinion : reviewOpinions) {
			procinstById = reviewOpinion.getProcinstById();
			break;
		}
		// 如果reviewOpinions为空则将model中的流程部署Id取出
		if (reviewOpinions == null || reviewOpinions.size() == 0) {
			// 从session中取出流程部署Id
			procinstById = (String) session.getAttribute("prodefById");
		}
		ProcessDefinition pd = approveprojService.queryProcessDefinitionById(procinstById);
		// 流程节点高亮map
		model.addAttribute("deploymentId", pd.getDeploymentId());
		model.addAttribute("imageName", pd.getDiagramResourceName());
		model.addAttribute("reviewOpinions", reviewOpinions);
		return "projman/xshtdj/xshtdjShow";
	}

	// 已完成代办跳转至查看页面
	@RequestMapping(value = "/ObjYWCShow.do")
	public String vacationYWCShow(@RequestParam Integer id, String proIndeId, String PROC_DEF_ID_, Model model) {
		// 根据Id查询销售合同对象
		XiaoShouHT xsht = xiaoShouHTDJService.queryXSHTById(id);
		// 格式化签订日期、合同计划完成日期、质保金到期日期
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		BP_DM_METHOD zbfs = null;// 招标方式
		Foll_up_Proj xmxx = null;// 所属项目
		User user = null;// 我方负责人
		if (xsht != null) {
			xsht.setQdrq(sdf.format(xsht.getCont_Date()));
			xsht.setHtjhwcrq(sdf.format(xsht.getFinish_Time()));
			xsht.setZbjdqrq(sdf.format(xsht.getQual_Expiredate()));
			// 查询所选招标方式对象
			zbfs = approveprojService.queryZBFSById(xsht.getBp_Method());
			// 查询所属项目
			xmxx = approveprojService.queryXiangMuXXById(xsht.getProj_Id());
			// 查询我方负责人
			user = userService.queryUserById(xsht.getUser_Id());
		}
		List<ReviewOpinion> reviewOpinions = indexService.queryReviewOpinions(proIndeId);
		// 流程图
		ProcessDefinition pd = indexService.queryProcessDefinitionById(PROC_DEF_ID_);
		model.addAttribute("reviewOpinions", reviewOpinions);
		model.addAttribute("xsht", xsht);
		model.addAttribute("taskId", id);
		model.addAttribute("zbfs", zbfs);
		model.addAttribute("user", user);
		model.addAttribute("xmxx", xmxx);
		model.addAttribute("deploymentId", pd.getDeploymentId());
		model.addAttribute("imageName", pd.getDiagramResourceName());
		return "projman/xshtdj/xshtdjShow";
	}

	@RequestMapping(value = "/test.do")
	public String test() {
		return "projman/xshtdj/test";
	}
}
