package com.edge.test.vacation.controller;

import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.activiti.engine.repository.ProcessDefinition;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;
import com.edge.system.user.entity.User;
import com.edge.system.user.service.inter.UserService;
import com.edge.test.vacation.entity.MyTasks;
import com.edge.test.vacation.entity.ReviewOpinions;
import com.edge.test.vacation.entity.TaskYWCS;
import com.edge.test.vacation.entity.Vacation;
import com.edge.test.vacation.service.inter.VacationService;
import com.edge.utils.Page;
import com.edge.utils.QueryVo;
import com.google.gson.Gson;

/**
 * 请假管理逻辑控制层
 * 
 * @author NingCG
 *
 */
@Controller
@RequestMapping(value = "vacation")
public class VacationController {
	@Resource
	private VacationService vacationService;

	@Resource
	private UserService userService;

	// 跳转至请假列表页面
	@RequestMapping(value = "/initVacationList.do")
	public String initVacationList() {
		return "procedure/vacation/vacationList";
	}

	// 分页查询请假列表数据
	@RequestMapping(value = "/vacationList.do")
	@ResponseBody
	public String vacationList(Integer page) {
		// new出QueryVo查询对象
		QueryVo vo = new QueryVo();
		// 获得Page对象
		Page<Vacation> pages = new Page<Vacation>();
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		// 每页数
		if (vo != null) {
			pages.setPage((page - 1) * vo.getSize() + 1);
			vo.setPage((page - 1) * vo.getSize() + 1);
			vo.setStartRow((pages.getPage()));
			vo.setSize(page * 10);
		}
		// 总页数
		pages.setTotal(vacationService.vacationCount());
		pages.setRows(vacationService.vacationList(vo));
		Gson gson = new Gson();
		map.put("code", 0);
		map.put("msg", "");
		map.put("count", vacationService.vacationCount());
		map.put("data", pages.getRows());
		String json = gson.toJson(map);
		return json.toString();
	}

	// 跳转至请假申请页面
	@RequestMapping(value = "/initAddVacation.do")
	public String initAddVacation() {
		return "procedure/vacation/addVacation";
	}

	// 添加请假申请
	@RequestMapping(value = "/addVacation.do")
	public String addVacation(Vacation vacation, HttpServletRequest request, Model model) {
		// 从session中取出当前用户主键
		HttpSession session = request.getSession();
		Integer userId = (Integer) session.getAttribute("userId");
		String user_name = (String) session.getAttribute("userName");
		// 为vacation设置属性
		vacation.setBeginDate(new Date());
		vacation.setState("提交申请");
		vacation.setUser_id(userId);
		vacationService.addVacation(vacation);
		model.addAttribute("flag", true);
		// 启动流程实例
		vacationService.saveStartProcess(vacationService.vacationMaxId(userId), user_name);
		List<MyTasks> allMyTask = vacationService.queryAllMyTask(user_name);
		// 遍历我的任务处理所有我的代办
		for (MyTasks myTask : allMyTask) {
			vacationService.saveTask(myTask.getID_(), request);
		}
		return "procedure/vacation/addVacation";
	}

	// 启动流程实例
	@RequestMapping(value = "/saveStartProcess.do", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String saveStartProcess(@RequestParam Integer vacation_id, HttpServletRequest request) {
		// new出JSONObject对象
		JSONObject jsonObject = new JSONObject();
		// 从session中取出当前用户主键
		HttpSession session = request.getSession();
		Integer userId = (Integer) session.getAttribute("userId");
		User user = userService.queryUserById(userId);
		String user_name = user.getUser_name();
		// 启动流程实例
		vacationService.saveStartProcess(vacation_id, user_name);
		jsonObject.put("flag", true);
		return jsonObject.toString();
	}

	// 分页查询我的代办
	@RequestMapping(value = "/myTaskList.do")
	@ResponseBody
	public String myTaskList(Integer page, HttpServletRequest request) {
		HttpSession session = request.getSession();
		String user_name = (String) session.getAttribute("userName");
		// new出QueryVo查询对象
		QueryVo vo = new QueryVo();
		// 获得Page对象
		Page<MyTasks> pages = new Page<MyTasks>();
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		// 每页数
		if (vo != null) {
			pages.setPage((page - 1) * vo.getSize() + 1);
			vo.setPage((page - 1) * vo.getSize() + 1);
			vo.setStartRow((pages.getPage()));
			vo.setSize(page * 10);
			vo.setUser_name(user_name);
		}
		pages.setTotal(vacationService.myTaskCount(user_name));
		pages.setRows(vacationService.queryMyTask(vo));
		// 总页数
		Gson gson = new Gson();
		map.put("code", 0);
		map.put("msg", "");
		map.put("count", vacationService.myTaskCount(user_name));
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");// 设置日期格式
		List<MyTasks> myTasks = pages.getRows();
		// 遍历该集合 设置代办集合
		for (MyTasks myTask : myTasks) {
			String taskDecription = "【" + myTask.getNAME_() + "】" + "  " + "【" + "任务名称:员工请假" + "】";
			String startTime = df.format(myTask.getCREATE_TIME_());
			myTask.setTaskDecription(taskDecription);
			myTask.setStartTime(startTime);
		}
		map.put("data", pages.getRows());
		String json = gson.toJson(map);
		return json.toString();
	}

	// 分页查询已完成
	@RequestMapping(value = "/taskListYWC.do")
	@ResponseBody
	public String taskListYWC(Integer page, HttpServletRequest request) {
		// new出QueryVo查询对象
		QueryVo vo = new QueryVo();
		// 获得Page对象
		Page<TaskYWCS> pages = new Page<TaskYWCS>();
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		// 每页数
		if (vo != null) {
			pages.setPage((page - 1) * vo.getSize() + 1);
			vo.setPage((page - 1) * vo.getSize() + 1);
			vo.setStartRow((pages.getPage()));
			vo.setSize(page * 10);
		}

		pages.setRows(vacationService.queryTaskYWC(vo));
		// 总页数
		Gson gson = new Gson();
		map.put("code", 0);
		map.put("msg", "");
		map.put("count", vacationService.TaskYWCCount());
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");// 设置日期格式
		List<TaskYWCS> ywcs = pages.getRows();
		// 遍历该集合 设置代办集合
		for (TaskYWCS ywc : ywcs) {
			String taskDecription = "【" + ywc.getNAME_() + "】" + "  " + "【" + "任务名称:员工请假" + "】";
			String startTime = df.format(ywc.getSTART_TIME_());
			String endTime = df.format(ywc.getEND_TIME_());
			ywc.setTaskDecription(taskDecription);
			ywc.setBeginTime(startTime);
			ywc.setEndTime(endTime);
		}
		map.put("data", pages.getRows());
		String json = gson.toJson(map);
		return json.toString();
	}

	// 通过我的代办主键去关联查询运行时流程执行实例表从而得到业务数据表主键
	@RequestMapping(value = "/querVacationId.do")
	@ResponseBody
	public String querVacationId(@RequestParam String task_id) {
		// 得到业务数据主键
		String businessKey = vacationService.querVacationId(task_id);
		String id = businessKey.substring(businessKey.indexOf(".") + 1);
		// new出JSONObject对象
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("id", id);
		jsonObject.put("taskId", task_id);
		return jsonObject.toString();
	}

	// 点击已完成查看业务数据
	@RequestMapping(value = "/querywcVacationId.do")
	@ResponseBody
	public String querywcVacationId(@RequestParam String task_id, String proIndeId,String PROC_DEF_ID_) {
		// 得到业务数据主键
		String id = task_id.substring(task_id.indexOf(".") + 1);
		// new出JSONObject对象
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("id", id);
		jsonObject.put("proIndeId", proIndeId);
		//流程部署Id
		jsonObject.put("PROC_DEF_ID_", PROC_DEF_ID_);
		return jsonObject.toString();
	}

	// 已完成代办跳转至查看页面
	@RequestMapping(value = "/vacationYWCShow.do")
	public String vacationYWCShow(@RequestParam Integer id, String proIndeId,String PROC_DEF_ID_, Model model) {
		// 根据id查询出请假记录数据
		Vacation vacation = vacationService.queryVacationById(id);
		List<ReviewOpinions> reviewOpinions = vacationService.queryReviewOpinions(proIndeId);
		ProcessDefinition pd = vacationService.queryProcessDefinitionById(PROC_DEF_ID_);
		model.addAttribute("ywcflag",true);
		model.addAttribute("reviewOpinions", reviewOpinions);
		model.addAttribute("vacation", vacation);
		model.addAttribute("deploymentId", pd.getDeploymentId());
		model.addAttribute("imageName", pd.getDiagramResourceName());
		return "procedure/vacation/vacationShow";
	}

	// 跳转至查看页面并回显数据
	@RequestMapping(value = "/vacationShow.do")
	public String vacationShow(@RequestParam Integer id, String task_id, Model model) {
		// 根据id查询出请假记录数据
		Vacation vacation = vacationService.queryVacationById(id);
		/** 二：已知任务ID，查询ProcessDefinitionEntiy对象，从而获取当前任务完成之后的连线名称，并放置到List<String>集合中 */
		// List<String> outcomeList = vacationService.queryOutComeListByTaskId(task_id);
		// model.addAttribute("outcomeList", outcomeList);
		List<ReviewOpinions> reviewOpinions = vacationService.queryCommentByTaskId(task_id);
		// 流程图
		ProcessDefinition pd = vacationService.queryProcessDefinitionByTaskId(task_id);
		//流程节点高亮map
		Map<String, Object> map = vacationService.queryCoordingByTask(task_id);
		model.addAttribute("reviewOpinions", reviewOpinions);
		model.addAttribute("vacation", vacation);
		model.addAttribute("taskId", task_id);
		model.addAttribute("deploymentId", pd.getDeploymentId());
		model.addAttribute("imageName", pd.getDiagramResourceName());
		model.addAttribute("map", map);
		return "procedure/vacation/vacationShow";
	}

	// 点击业务列表进入查看页面
	@RequestMapping(value = "/vacationShowById.do")
	public String vacationShowById(@RequestParam Integer vacation_id, Model model) {
		// 根据id查询出请假记录数据(评审意见)
		List<ReviewOpinions> reviewOpinions = vacationService.vacationShowById(vacation_id, model);
		/** 二：已知任务ID，查询ProcessDefinitionEntiy对象，从而获取当前任务完成之后的连线名称，并放置到List<String>集合中 */
		// List<String> outcomeList = vacationService.queryOutComeListByTaskId(task_id);
		// model.addAttribute("outcomeList", outcomeList);
		//取出reviewOpinions中的流程部署Id
		String procinstById=null;
		for (ReviewOpinions reviewOpinion : reviewOpinions) {
			procinstById=reviewOpinion.getProcinstById();
		}
		ProcessDefinition pd = vacationService.queryProcessDefinitionById(procinstById);
		model.addAttribute("showFlag", true);
		model.addAttribute("deploymentId", pd.getDeploymentId());
		model.addAttribute("imageName", pd.getDiagramResourceName());
		model.addAttribute("reviewOpinions", reviewOpinions);
		return "procedure/vacation/vacationShow";
	}

	// 点击处理打开任务表单
	@RequestMapping(value = "/initResult.do")
	public String initResult(String task_id, Model model) {
		String url = vacationService.querTaskFromKeyByTaskId(task_id);
		model.addAttribute("taskId", task_id);
		if(url==null) {
			return "procedure/vacation/result";
		}
		if (url.equals("vacation/initResult.do")) {
			return "procedure/vacation/result";
		}
		return null;
	}

	// 办理个人任务
	@RequestMapping(value = "/saveSubmitTask.do")
	public String saveSubmitTask(String task_id, HttpServletRequest request, Model model, @RequestParam String outcome,
			String advice) {
		vacationService.saveSubmitTask(task_id, request, advice, outcome);
		model.addAttribute("flag", true);
		return "procedure/vacation/result";
	}
	
	//显示流程图
	@RequestMapping(value = "/viewImage.do")
	public void viewImage(@RequestParam String deploymentId,String imageName,HttpServletResponse response) {
		try {
			imageName=new String(imageName.getBytes("ISO8859-1"),"UTF-8");
		} catch (UnsupportedEncodingException e1) {
			e1.printStackTrace();
		}
		InputStream in = vacationService.findImageInputStream(deploymentId, imageName);
		response.setContentType("image/png");
		response.setCharacterEncoding("utf-8");
		try {
			ServletOutputStream outputStream = response.getOutputStream();
			int len=0;
			byte[]buf=new byte[1024];
			while((len=in.read(buf,0,1024))!=-1){
				outputStream.write(buf, 0, len);
			}
			outputStream.close();
			in.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
}
