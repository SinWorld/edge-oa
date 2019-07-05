package com.edge.reimburse.bxtb.controller;

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
import com.edge.projman.xshtdj.entity.HuoWuInFor;
import com.edge.projman.xshtdj.entity.XiaoShouHT;
import com.edge.reimburse.bxtb.entity.MyReport_QueryVo;
import com.edge.reimburse.bxtb.entity.Reimburse_DM_FYLX;
import com.edge.reimburse.bxtb.entity.Reimbursement;
import com.edge.reimburse.bxtb.service.inter.ReportService;
import com.edge.system.user.entity.User;
import com.edge.system.user.service.inter.UserService;
import com.edge.utils.BP_DM_METHOD;
import com.edge.utils.Page;
import com.edge.utils.ReviewOpinion;
import com.google.gson.Gson;

/**
 * 报销填报控制层
 * 
 * @author NingCG
 *
 */
@Controller
@RequestMapping(value = "bxtb")
public class ReportController {
	@Resource
	private ReportService reportService;
	@Resource
	private ApproveprojService approveprojService;
	@Resource
	private UserService userService;
	@Resource
	private IndexService indexService;

	// 跳转至报销列表页面
	@RequestMapping(value = "/initbxtbList.do")
	public String initbxtbList() {
		return "reimburse/bxtb/bxtbList";
	}

	// 跳转至报销填报页面
	@RequestMapping(value = "/initsaveBxtb.do")
	public String initsaveBxtb() {
		return "reimburse/bxtb/saveBxtb";
	}

	// 生成编号
	@RequestMapping(value = "/scbh.do")
	@ResponseBody
	public String scbh() {
		// new出JSONObject对象
		JSONObject jsonObject = new JSONObject();
		// 生成编号
		String bh = this.bianHao();
		// 生成发生日期
		Date nowTime = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		jsonObject.put("bh", bh);
		jsonObject.put("fsrq", sdf.format(nowTime));
		return jsonObject.toString();
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
		String bh = "C" + time + x;
		return bh;
	}

	// 加载所有的费用类型
	@RequestMapping(value = "/queryAllFYLX.do")
	@ResponseBody
	public String queryAllFYLX() {
		JSONArray jsonArray = reportService.queryAllFYLX();
		return jsonArray.toString();
	}

	// 新增报销填报
	@RequestMapping(value = "/saveReimbursement.do")
	@ResponseBody
	public String saveReimbursement(@RequestParam Integer xmxxdm, String spbh, Integer fylx, String fsrq, Double bxje,
			Integer fyss, String bxr, Double shje, Double fpje, String fymx) {
		// new 出Reimbursement对象
		Reimbursement reimbursement = new Reimbursement();
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		// 设置属性
		reimbursement.setProj_dm(xmxxdm);
		reimbursement.setReimbursement_code(spbh.trim());
		reimbursement.setReimbursement_dm_fylx(fylx);
		Date date = null;
		try {
			date = formatter.parse(fsrq);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		reimbursement.setReimbursement_begintime(date);
		reimbursement.setReimbursement_bxje(bxje);
		reimbursement.setReimbursement_user_dm(fyss);
		reimbursement.setReimbursement_bxr(bxr);
		reimbursement.setReimbursement_shje(shje);
		reimbursement.setReimbursement_fpje(fpje);
		reimbursement.setReimbursement_details(fymx.trim());
		reimbursement.setIs_ffdj(false);
		// 设置提交时间
		Date nowTime = new Date();
		reimbursement.setReimbursement_submittime(nowTime);
		reportService.saveReimbursement(reimbursement);
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("flag", true);
		return jsonObject.toString();
	}

	// 分页显示我的报销记录
	@RequestMapping(value = "/queryAllReimbursement.do")
	@ResponseBody
	public String queryAllReimbursement(Integer page, HttpServletRequest request) {
		// new出QueryVo查询对象
		MyReport_QueryVo vo = new MyReport_QueryVo();
		HttpSession session = request.getSession();
		String userName = (String) session.getAttribute("userName");
		// 获得Page对象
		Page<Reimbursement> pages = new Page<Reimbursement>();
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		// 每页数
		if (vo != null) {
			pages.setPage((page - 1) * vo.getSize() + 1);
			vo.setPage((page - 1) * vo.getSize() + 1);
			vo.setStartRow((pages.getPage()));
			vo.setSize(page * 10);
			vo.setUserName(userName);
		}
		// 总页数
		pages.setTotal(reportService.queryMyReimbursementCount(vo));
		pages.setRows(reportService.queryMyReimbursement(vo));
		Gson gson = new Gson();
		map.put("code", 0);
		map.put("msg", "");
		map.put("count", reportService.queryMyReimbursementCount(vo));
		List<Reimbursement> rows = pages.getRows();
		// 遍历该集合 设置项目名称、费用类型、费用所属
		for (Reimbursement row : rows) {
			if (row.getProj_dm() != null) {
				Foll_up_Proj xmxx = approveprojService.queryXiangMuXXById(row.getProj_dm());
				row.setProj_name(xmxx.getBudget_Name());
			}
			if (row.getReimbursement_dm_fylx() != null) {
				Reimburse_DM_FYLX fylx = reportService.queryFYLXById(row.getReimbursement_dm_fylx());
				row.setFylx_name(fylx.getFylx_mc());
			}
			if (row.getReimbursement_user_dm() != null) {
				User user = userService.queryUserById(row.getReimbursement_user_dm());
				row.setReimbursement_user_name(user.getUser_name());
			}
		}
		map.put("data", pages.getRows());
		String json = gson.toJson(map);
		return json.toString();
	}

	// 分页显示报销记录（阮玲玲、邓成丽、高云飞能看见所有的报销记录，其余只能看自己的）
	@RequestMapping(value = "/reimbursementList.do")
	@ResponseBody
	public String reimbursementList(Integer page, HttpServletRequest request) {
		// new出QueryVo查询对象
		MyReport_QueryVo vo = new MyReport_QueryVo();
		HttpSession session = request.getSession();
		String userName = (String) session.getAttribute("userName");
		// 获得Page对象
		Page<Reimbursement> pages = new Page<Reimbursement>();
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		// 每页数
		if (vo != null) {
			pages.setPage((page - 1) * vo.getSize() + 1);
			vo.setPage((page - 1) * vo.getSize() + 1);
			vo.setStartRow((pages.getPage()));
			vo.setSize(page * 10);
			vo.setUserName(userName);
		}
		// 总页数
		if ("阮玲玲".equals(userName) || "邓成丽".equals(userName) || "高云飞".equals(userName)) {
			// 阮玲玲、邓成丽、高云飞能看见所有的报销记录 其余只能看自己的
			pages.setTotal(reportService.queryAllReimbursementCountLC(vo));
			pages.setRows(reportService.queryAllReimbursementLC(vo));
			map.put("count", reportService.queryAllReimbursementCountLC(vo));
		} else {
			pages.setTotal(reportService.queryMyReimbursementCountLC(vo));
			pages.setRows(reportService.queryMyReimbursementLC(vo));
			map.put("count", reportService.queryMyReimbursementCountLC(vo));
		}
		Gson gson = new Gson();
		map.put("code", 0);
		map.put("msg", "");
		List<Reimbursement> rows = pages.getRows();
		// 遍历该集合 设置项目名称、费用类型、费用所属
		for (Reimbursement row : rows) {
			if (row.getProj_dm() != null) {
				// 项目信息
				Foll_up_Proj xmxx = approveprojService.queryXiangMuXXById(row.getProj_dm());
				row.setProj_name(xmxx.getBudget_Name());
			}
			if (row.getReimbursement_dm_fylx() != null) {
				// 费用类型
				Reimburse_DM_FYLX fylx = reportService.queryFYLXById(row.getReimbursement_dm_fylx());
				row.setFylx_name(fylx.getFylx_mc());
			}
			if (row.getReimbursement_user_dm() != null) {
				// 费用所属
				User user = userService.queryUserById(row.getReimbursement_user_dm());
				row.setReimbursement_user_name(user.getUser_name());
			}
			if (row.getAppr_status() != null) {
				row.setAppr_status_name(approveprojService.queryStatus(row.getAppr_status()).getAppr_Status_Name());
			}
		}
		map.put("data", pages.getRows());
		String json = gson.toJson(map);
		return json.toString();
	}

	// 编辑操作
	@RequestMapping(value = "/editReimbursement.do")
	@ResponseBody
	public String editReimbursement(@RequestParam Integer rei_dm, Integer xmxxdm, Integer fylx, String fsrq,
			Double bxje, Integer fyss, Double shje, Double fpje, String fymx) {
		JSONObject jsonObject = new JSONObject();
		// 根据rei_dm 查询 Reimbursement 对象
		Reimbursement reimbursement = reportService.queryReimbursementById(rei_dm);
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		Date date = null;
		try {
			date = formatter.parse(fsrq);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		// 设置属性
		reimbursement.setProj_dm(xmxxdm);
		reimbursement.setReimbursement_dm_fylx(fylx);
		reimbursement.setReimbursement_begintime(date);
		reimbursement.setReimbursement_bxje(bxje);
		reimbursement.setReimbursement_user_dm(fyss);
		reimbursement.setReimbursement_shje(shje);
		reimbursement.setReimbursement_fpje(fpje);
		reimbursement.setReimbursement_details(fymx);
		reportService.editReimbursement(reimbursement);
		jsonObject.put("flag", true);
		return jsonObject.toString();
	}

	// 批量删除报销填报
	@RequestMapping(value = "/deleteReimById.do")
	@ResponseBody
	public String deleteReimById(@RequestParam String ReimbursementIds) {
		JSONObject jsonObject = new JSONObject();
		// 将其转换为数组
		String[] reimdms = ReimbursementIds.split(",");
		// 遍历该集合
		for (String dm : reimdms) {
			// 根据id删除该记录
			reportService.deleteReimbursementById(Integer.parseInt(dm.trim()));
		}
		jsonObject.put("flag", true);
		return jsonObject.toString();
	}

	// 提交报销申请表单 并启动流程实例
	@RequestMapping(value = "/startBxtb.do")
	public String startBxtb(@RequestParam String remId, HttpServletRequest request, Model model) {
		// 从session中获取用户名和用户主键
		HttpSession session = request.getSession();
		// 当前登录系统用户主键和用户名
		String userName = (String) session.getAttribute("userName");
		// 将其转换为数组
		String[] reimdms = remId.split(",");
		// 遍历该数组
		for (String dm : reimdms) {
			// 根据dm 查询 Reimbursement 对象
			Reimbursement reimbursement = reportService.queryReimbursementById(Integer.parseInt(dm.trim()));
			// 审批状态(1.完成 2.运行中 3.撤销);
			reimbursement.setAppr_status(2);
			// 设置代办描述
			reimbursement.setDb_ms("差旅费报销");
			reportService.editReimbursement(reimbursement);
			// 启动流程实例
			reportService.saveStartProcess(userName, request, reimbursement);
		}
		model.addAttribute("flag", true);
		return "reimburse/bxtb/saveBxtb";
	}

	// 跳转至查看页面并回显数据点击代办
	@RequestMapping(value = "/reimburseShow.do")
	public String reimburseShow(@RequestParam Integer id, String task_id, Model model) {
		// 根据id 查询 Reimbursement 对象
		Reimbursement reimbursement = reportService.queryReimbursementById(id);
		// 格式化发生日期、提交日期、完成日期
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Foll_up_Proj xmxx = null;// 所属项目
		User user = null;// 费用所属
		Reimburse_DM_FYLX fylx = null;// 费用类型
		if (reimbursement != null) {
			reimbursement.setFsrq(sdf.format(reimbursement.getReimbursement_begintime()));
			reimbursement.setTjrq(sdf.format(reimbursement.getReimbursement_submittime()));
			if (reimbursement.getFinish_time() != null) {
				reimbursement.setWcrq(sdf.format(reimbursement.getFinish_time()));
			} else {
				reimbursement.setWcrq(null);
			}
			// 查询所属项目
			xmxx = approveprojService.queryXiangMuXXById(reimbursement.getProj_dm());
			// 查询费用所属
			user = userService.queryUserById(reimbursement.getReimbursement_user_dm());
			// 查询费用类型
			fylx = reportService.queryFYLXById(reimbursement.getReimbursement_dm_fylx());

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
		model.addAttribute("reimbursement", reimbursement);
		model.addAttribute("taskId", task_id);
		model.addAttribute("user", user);
		model.addAttribute("xmxx", xmxx);
		model.addAttribute("fylx", fylx);
		model.addAttribute("deploymentId", pd.getDeploymentId());
		model.addAttribute("imageName", pd.getDiagramResourceName());
		model.addAttribute("map", map);
		return "reimburse/bxtb/bxtbShow";
	}

	// 点击业务列表进入查看页面
	@RequestMapping(value = "/reimburseShowById.do")
	public String reimburseShowById(@RequestParam Integer reimbursement_dm, Model model, HttpServletRequest request) {
		// 获取session
		HttpSession session = request.getSession();
		// 根据id查询出请假记录数据(评审意见)
		List<ReviewOpinion> reviewOpinions = reportService.reimburseShowByIdShowById(reimbursement_dm, model, session);
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
		return "reimburse/bxtb/bxtbShow";
	}

	// 编辑报销填报回显报销数据
	@RequestMapping(value = "/initEditBxtb.do")
	public String initEditBxtb(@RequestParam Integer objId, Integer taskId, Model model) {
		// 根据Id查询报销填报对象
		Reimbursement reimbursement = reportService.queryReimbursementById(objId);
		// 格式化发生日期、提交日期、完成日期
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Foll_up_Proj xmxx = null;// 所属项目
		User user = null;// 费用所属
		Reimburse_DM_FYLX fylx = null;// 费用类型
		if (reimbursement != null) {
			reimbursement.setFsrq(sdf.format(reimbursement.getReimbursement_begintime()));
			reimbursement.setTjrq(sdf.format(reimbursement.getReimbursement_submittime()));
			if (reimbursement.getFinish_time() != null) {
				reimbursement.setWcrq(sdf.format(reimbursement.getFinish_time()));
			} else {
				reimbursement.setWcrq(null);
			}
			// 查询所属项目
			xmxx = approveprojService.queryXiangMuXXById(reimbursement.getProj_dm());
			// 查询费用所属
			user = userService.queryUserById(reimbursement.getReimbursement_user_dm());
			// 查询费用类型
			fylx = reportService.queryFYLXById(reimbursement.getReimbursement_dm_fylx());

		}
		model.addAttribute("reimbursement", reimbursement);
		model.addAttribute("user", user);
		model.addAttribute("xmxx", xmxx);
		model.addAttribute("fylx", fylx);
		model.addAttribute("taskId", taskId);
		return "reimburse/bxtb/editBxtb";
	}

	// 编辑操作并启动流程
	@RequestMapping(value = "/editBxtb.do")
	public String editBxtb(Reimbursement reimbursement, Model model, HttpServletRequest request, Integer taskId) {
		// 设置审核状态为运行中
		reimbursement.setAppr_status(2);
		reportService.editReimbursement(reimbursement);
		model.addAttribute("flag", true);
		// 推动流程进入下一节点
		reportService.saveTask(String.valueOf(taskId), request);
		return "reimburse/bxtb/editBxtb";
	}

	// 已完成代办跳转至查看页面
	@RequestMapping(value = "/ObjYWCShow.do")
	public String objYWCShow(@RequestParam Integer id, String proIndeId, String PROC_DEF_ID_, Model model) {
		// 根据Id查询报销填报对象
		Reimbursement reimbursement = reportService.queryReimbursementById(id);
		// 格式化发生日期、提交日期、完成日期
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Foll_up_Proj xmxx = null;// 所属项目
		User user = null;// 费用所属
		Reimburse_DM_FYLX fylx = null;// 费用类型
		if (reimbursement != null) {
			reimbursement.setFsrq(sdf.format(reimbursement.getReimbursement_begintime()));
			reimbursement.setTjrq(sdf.format(reimbursement.getReimbursement_submittime()));
			if (reimbursement.getFinish_time() != null) {
				reimbursement.setWcrq(sdf.format(reimbursement.getFinish_time()));
			} else {
				reimbursement.setWcrq(null);
			}
			// 查询所属项目
			xmxx = approveprojService.queryXiangMuXXById(reimbursement.getProj_dm());
			// 查询费用所属
			user = userService.queryUserById(reimbursement.getReimbursement_user_dm());
			// 查询费用类型
			fylx = reportService.queryFYLXById(reimbursement.getReimbursement_dm_fylx());

		}
		List<ReviewOpinion> reviewOpinions = indexService.queryReviewOpinions(proIndeId);
		// 流程图
		ProcessDefinition pd = indexService.queryProcessDefinitionById(PROC_DEF_ID_);
		model.addAttribute("reviewOpinions", reviewOpinions);
		model.addAttribute("taskId", id);
		model.addAttribute("deploymentId", pd.getDeploymentId());
		model.addAttribute("imageName", pd.getDiagramResourceName());
		model.addAttribute("reimbursement", reimbursement);
		model.addAttribute("user", user);
		model.addAttribute("xmxx", xmxx);
		model.addAttribute("fylx", fylx);
		return "reimburse/bxtb/bxtbShow";
	}

}
