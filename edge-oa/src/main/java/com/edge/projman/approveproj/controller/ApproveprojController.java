package com.edge.projman.approveproj.controller;

import java.io.File;
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
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.junit.Test;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.edge.index.service.inter.IndexService;
import com.edge.projman.approveproj.entity.Foll_up_Proj;
import com.edge.projman.approveproj.service.inter.ApproveprojService;
import com.edge.system.department.entity.Department;
import com.edge.system.department.service.inter.DepartmentService;
import com.edge.system.user.entity.User;
import com.edge.system.user.service.inter.UserService;
import com.edge.utils.BP_DM_METHOD;
import com.edge.utils.Page;
import com.edge.projman.approveproj.entity.Foll_QueryVo;
import com.edge.utils.ReviewOpinion;
import com.google.gson.Gson;

/**
 * 项目立项控制层
 * 
 * @author NingCG
 *
 */
@Controller
@RequestMapping(value = "approveproj")
public class ApproveprojController {
	@Resource
	private ApproveprojService approveprojService;
	@Resource
	private UserService userService;
	@Resource
	private DepartmentService departmentService;
	@Resource
	private IndexService indexService;

	// 跳转至项目信息列表页
	@RequestMapping("/initApproveprojList.do")
	public String initApproveprojList() {
		return "projman/approveproj/approveprojList";
	}

	// 分页查询项目信息
	@RequestMapping(value = "/approveprojList.do")
	@ResponseBody
	public String approveprojList(Integer page,Foll_QueryVo foll_QueryVo,String time1,String time2) {
		// new出QueryVo查询对象
		Foll_QueryVo vo = new Foll_QueryVo();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");// 设置日期格式
		// 获得Page对象
		Page<Foll_up_Proj> pages = new Page<Foll_up_Proj>();
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		// 每页数
		if (vo != null) {
			pages.setPage((page - 1) * vo.getSize() + 1);
			vo.setPage((page - 1) * vo.getSize() + 1);
			vo.setStartRow((pages.getPage()));
			vo.setSize(page * 10);
			if(foll_QueryVo.getProj_Code()!=null&&foll_QueryVo.getProj_Code()!="") {
				vo.setProj_Code(foll_QueryVo.getProj_Code().trim());
			}
			if(foll_QueryVo.getProj_Id()!=null) {
				vo.setProj_Id(foll_QueryVo.getProj_Id());
			}
			if(foll_QueryVo.getUser_Id()!=null&&foll_QueryVo.getUser_Id()!="") {
				vo.setUser_Id(foll_QueryVo.getUser_Id());
			}
			if(foll_QueryVo.getNextCZ()!=null&&foll_QueryVo.getNextCZ()!="") {
				vo.setNextCZ(foll_QueryVo.getNextCZ().trim());
			}
			if(foll_QueryVo.getAppr_Status()!=null) {
				vo.setAppr_Status(foll_QueryVo.getAppr_Status());
			}
			if(time1!=null&&time1!="") {
				//将String类型转换为Date类型
				try {
					vo.setDate(sdf.parse(time1));
				} catch (ParseException e) {
					e.printStackTrace();
				}
			}
			if(time2!=null&&time2!="") {
				try {
					vo.setDate2(sdf.parse(time2));
				} catch (ParseException e) {
					e.printStackTrace();
				}
			}
		}
		// 总页数
		pages.setTotal(approveprojService.queryAllxiangMuXXCount(foll_QueryVo));
		pages.setRows(approveprojService.queryAllxiangMuXX(vo));
		Gson gson = new Gson();
		map.put("code", 0);
		map.put("msg", "");
		map.put("count", approveprojService.queryAllxiangMuXXCount(foll_QueryVo));
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");// 设置日期格式
		List<Foll_up_Proj> rows = pages.getRows();
		// 遍历该集合 设置审批状态和提交时间
		for (Foll_up_Proj row : rows) {
			if (row.getAppr_Status() != null) {
				row.setSpzt(approveprojService.queryStatus(row.getAppr_Status()).getAppr_Status_Name());
			}
			row.setTjTime(df.format(row.getSubm_Time()));
		}
		map.put("data", pages.getRows());
		String json = gson.toJson(map);
		return json.toString();
	}

	// 打开项目立项页面
	@RequestMapping(value = "/initSaveApproveproj.do")
	public String initSaveApproveproj() {
		return "projman/approveproj/saveApproveproj";
	}

	// 上传附件操作
	@RequestMapping(value = "/upload.do")
	@ResponseBody
	public JSONObject upload(@RequestParam("file") MultipartFile file, HttpServletRequest request) throws Exception {
		String fileName = file.getOriginalFilename();
		String fileSuffix = fileName.substring(fileName.lastIndexOf("."), fileName.length());
		String localFileName = System.currentTimeMillis() + fileSuffix;
		String filePath = File.separator + localFileName;

		// 文件上传到本地磁盘工厂类
		DiskFileItemFactory factory = new DiskFileItemFactory();
		// 设置内存缓冲区的大小
		factory.setSizeThreshold(20480);
		// 设置临时文件目录,供上传文件过大时临时存储
		factory.setRepository(new File("F:\\f"));

		String newFileName = null;
		return null;
	}

	// 在D盘新建文件夹
	@Test
	public void addNewFile() {
		Date date = new Date();
		String path = "D:/" + "附件" + "/" + new SimpleDateFormat("yyyy/MM/dd/").format(date);
		// 如果不存在,创建文件夹
		File f = new File(path);
		if (!f.exists()) {
			f.mkdirs();
		}
	}

	// 查询所有的招标方式
	@RequestMapping(value = "/allZBFS.do")
	@ResponseBody
	public String allZBFS() {
		JSONArray jsonArray = approveprojService.allZBFS();
		return jsonArray.toString();
	}

	// 查询所有的我方用户（管理员除外）
	@RequestMapping(value = "/allUser.do")
	@ResponseBody
	public String allUser() {
		String userName = "admin";
		JSONArray jsonArray = approveprojService.allUser(userName);
		return jsonArray.toString();
	}

	// 跳转至审批结果页面
	@RequestMapping(value = "/initResult.do")
	public String initResult() {
		return "projman/approveproj/result";
	}

	// 提交表单项目立项并启动流程实例
	@RequestMapping(value = "/saveXiangMuLX.do")
	public String saveXiangMuLX(Foll_up_Proj foll_up_Proj, HttpServletRequest request, Model model) {
		// 从session中获取用户名和用户主键
		HttpSession session = request.getSession();
		// 当前登录系统用户主键和用户名
		Integer userId = (Integer) session.getAttribute("userId");
		String userName = (String) session.getAttribute("userName");
		// 为项目信息属性设置值
		foll_up_Proj.setProj_Code(this.bianHao());
		// 根据提交的我方负责人代码去查询用户名
		User user = userService.queryUserById(foll_up_Proj.getUser_Id());
		if (user != null) {
			// 设置我方负责人姓名
			foll_up_Proj.setUser_Name(user.getUser_name());
		}
		// 设置提交用户代码
		foll_up_Proj.setSubm_User_Id(userId);
		// 设置提交用户用户名
		foll_up_Proj.setSubm_Name(userName);
		// 设置提交用户部门代码
		User dqUser = userService.queryUserById(userId);
		foll_up_Proj.setDepa_Id(dqUser.getUser_department_id());
		// 根据当前用户的部门代码去查询部门名称
		Department department = departmentService.queryDepartmentById(dqUser.getUser_department_id());
		foll_up_Proj.setDepa(department.getDep_name());
		// 设置提交时间
		foll_up_Proj.setSubm_Time(new Date());
		// 设置项目状态
		foll_up_Proj.setProj_Status("未签订合同");
		// 设置代办任务描述用于首页显示代办任务内容
		foll_up_Proj.setDb_ms("申请项目立项");
		// 设置是否同意立项
		foll_up_Proj.setIS_TY(false);
		foll_up_Proj.setAppr_Status(2);// 审批状态(1.完成 2.运行中 3.撤销);
		approveprojService.saveXiangMuXX(foll_up_Proj);
		model.addAttribute("flag", true);

		// 启动流程实例
		approveprojService.saveStartProcess(userName, request);
		return "projman/approveproj/saveApproveproj";
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
		String bh = "P" + time + x;
		return bh;
	}

	// 跳转至查看页面并回显数据
	@RequestMapping(value = "/approveprojShow.do")
	public String vacationShow(@RequestParam Integer id, String task_id, Model model) {
		// 根据id查询出项目信息数据
		Foll_up_Proj foll_up_Proj = approveprojService.queryXiangMuXXById(id);
		// 格式化计划合同签订日期
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		BP_DM_METHOD zbfs = null;
		User user = null;
		if (foll_up_Proj != null) {
			foll_up_Proj.setPlan_cont_date(sdf.format(foll_up_Proj.getPlan_Cont_Date()));
			// 查询所选招标方式对象
			zbfs = approveprojService.queryZBFSById(foll_up_Proj.getBp_method());
			user = userService.queryUserById(foll_up_Proj.getUser_Id());
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
		model.addAttribute("foll_up_Proj", foll_up_Proj);
		model.addAttribute("taskId", task_id);
		model.addAttribute("zbfs", zbfs);
		model.addAttribute("user", user);
		model.addAttribute("deploymentId", pd.getDeploymentId());
		model.addAttribute("imageName", pd.getDiagramResourceName());
		model.addAttribute("map", map);
		return "projman/approveproj/approveprojShow";
	}

	// 点击业务列表进入查看页面
	@SuppressWarnings("null")
	@RequestMapping(value = "/xiangMuXXShowById.do")
	public String xiangMuXXShowById(@RequestParam Integer proj_Id, Model model,HttpServletRequest request) {
		// 获取session
		HttpSession session = request.getSession();
		// 根据id查询出请假记录数据(评审意见)
		List<ReviewOpinion> reviewOpinions = approveprojService.xiangMuXXShowById(proj_Id, model,session);
		/** 二：已知任务ID，查询ProcessDefinitionEntiy对象，从而获取当前任务完成之后的连线名称，并放置到List<String>集合中 */
		// List<String> outcomeList = vacationService.queryOutComeListByTaskId(task_id);
		// model.addAttribute("outcomeList", outcomeList);
		// 取出reviewOpinions中的流程部署Id
		String procinstById = null;
		for (ReviewOpinion reviewOpinion : reviewOpinions) {
			procinstById = reviewOpinion.getProcinstById();
			break;
		}
		//如果reviewOpinions为空则将model中的流程部署Id取出
		if(reviewOpinions==null||reviewOpinions.size()==0) {
			//从session中取出流程部署Id
			procinstById = (String) session.getAttribute("prodefById");
		}
		ProcessDefinition pd = approveprojService.queryProcessDefinitionById(procinstById);
		// 流程节点高亮map
		model.addAttribute("deploymentId", pd.getDeploymentId());
		model.addAttribute("imageName", pd.getDiagramResourceName());
		model.addAttribute("reviewOpinions", reviewOpinions);
		return "projman/approveproj/approveprojShow";
	}

	// 编辑项目信息回显项目信息数据
	@RequestMapping(value = "/initEditXMXX.do")
	public String initEditXMXX(@RequestParam Integer objId, Integer taskId, Model model) {
		// 根据Id查询项目信息对象
		Foll_up_Proj foll_up_Proj = approveprojService.queryXiangMuXXById(objId);
		// 格式化计划合同签订日期
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		BP_DM_METHOD zbfs = null;
		User user = null;
		if (foll_up_Proj != null) {
			foll_up_Proj.setPlan_cont_date(sdf.format(foll_up_Proj.getPlan_Cont_Date()));
			// 查询所选招标方式对象
			zbfs = approveprojService.queryZBFSById(foll_up_Proj.getBp_method());
			user = userService.queryUserById(foll_up_Proj.getUser_Id());
		}
		model.addAttribute("foll_up_Proj", foll_up_Proj);
		model.addAttribute("zbfs", zbfs);
		model.addAttribute("user", user);
		model.addAttribute("taskId", taskId);
		return "projman/approveproj/editApproveproj";
	}

	// 编辑操作并启动流程
	@RequestMapping(value = "/editXMXX.do")
	public String editXMXX(Foll_up_Proj foll_up_Proj, Model model, HttpServletRequest request, Integer taskId) {
		//设置审核状态为运行中
		foll_up_Proj.setAppr_Status(2);
		approveprojService.editXiangMuXX(foll_up_Proj);
		// 从session中获取用户名和用户主键
		HttpSession session = request.getSession();
		// 当前登录系统用户主键和用户名
		String userName = (String) session.getAttribute("userName");
		model.addAttribute("flag", true);

		// 推动流程进入下一节点
		approveprojService.saveTask(String.valueOf(taskId), request);
		return "projman/approveproj/editApproveproj";
	}

	// 已完成代办跳转至查看页面
	@RequestMapping(value = "/ObjYWCShow.do")
	public String vacationYWCShow(@RequestParam Integer id, String proIndeId, String PROC_DEF_ID_, Model model) {
		// 根据id查询出项目信息数据
		Foll_up_Proj foll_up_Proj = approveprojService.queryXiangMuXXById(id);
		// 格式化计划合同签订日期
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		BP_DM_METHOD zbfs = null;
		User user = null;
		if (foll_up_Proj != null) {
			foll_up_Proj.setPlan_cont_date(sdf.format(foll_up_Proj.getPlan_Cont_Date()));
			// 查询所选招标方式对象
			zbfs = approveprojService.queryZBFSById(foll_up_Proj.getBp_method());
			user = userService.queryUserById(foll_up_Proj.getUser_Id());
		}
		List<ReviewOpinion> reviewOpinions = indexService.queryReviewOpinions(proIndeId);
		// 流程图
		ProcessDefinition pd = indexService.queryProcessDefinitionById(PROC_DEF_ID_);
		model.addAttribute("reviewOpinions", reviewOpinions);
		model.addAttribute("foll_up_Proj", foll_up_Proj);
		model.addAttribute("taskId", id);
		model.addAttribute("zbfs", zbfs);
		model.addAttribute("user", user);
		model.addAttribute("deploymentId", pd.getDeploymentId());
		model.addAttribute("imageName", pd.getDiagramResourceName());
		return "projman/approveproj/approveprojShow";
	}
	
	//高级搜索区查询所有的项目信息
	@RequestMapping(value="/queryAllXMXX.do")
	@ResponseBody
	public String queryAllXMXX() {
		JSONArray jsonArray = approveprojService.queryAllXMXX();
		return jsonArray.toString();
	}
	
	//高级搜索区查询所有的审批状态
		@RequestMapping(value="/queryAllSPZT.do")
		@ResponseBody
		public String queryAllSPZT() {
			JSONArray jsonArray = approveprojService.queryAllSPZT();
			return jsonArray.toString();
		}

}