package com.edge.WagePerformance.controller;

import java.math.BigDecimal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

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
import com.edge.WagePerformance.entity.WagePerformance;
import com.edge.WagePerformance.entity.Wage_QueryVo;
import com.edge.WagePerformance.service.inter.WagePerService;
import com.edge.index.service.inter.IndexService;
import com.edge.projman.approveproj.service.inter.ApproveprojService;
import com.edge.projman.xshtdj.service.inter.XiaoShouHTDJService;
import com.edge.system.department.entity.Department;
import com.edge.system.department.service.inter.DepartmentService;
import com.edge.system.user.entity.User;
import com.edge.system.user.entity.User_DM_Posittion;
import com.edge.system.user.entity.User_DM_YGLX;
import com.edge.system.user.service.inter.UserService;
import com.edge.utils.Page;
import com.edge.utils.ReviewOpinion;
import com.google.gson.Gson;

/**
 * 工资绩效控制层
 * 
 * @author NingCG
 *
 */
@Controller
@RequestMapping(value = "wage")
public class WagePerController {
	@Resource
	private WagePerService wagePerService;
	@Resource
	private DepartmentService departmentService;
	@Resource
	private UserService userService;
	@Resource
	private IndexService indexService;
	@Resource
	private ApproveprojService approveprojService;
	@Resource
	private XiaoShouHTDJService xiaoShouHTDJService;

	// 跳转至工资填报列表页面
	@RequestMapping(value = "/initWageList.do")
	public String initWageList() {
		return "wagePerformance/gztb/gztbList";
	}

	// 跳转至工资填报新增页面
	@RequestMapping(value = "/initSaveWage.do")
	public String initSaveWage() {
		return "wagePerformance/gztb/saveGztb";
	}

	// 设置编号
	@RequestMapping(value = "/setBh.do")
	@ResponseBody
	public String setBh() {
		JSONObject jsonObject = new JSONObject();
		String bh = this.bianHao();
		jsonObject.put("bh", bh);
		return jsonObject.toString();
	}

	// 分页显示工资填报记录
	@RequestMapping(value = "/queryAllGZTB.do")
	@ResponseBody
	public String queryAllGZTB(Integer page, Wage_QueryVo wage_QueryVo, Double jinE1, Double jinE2, Double jinE3,
			Double jinE4,String month) {
		// new出QueryVo查询对象
		Wage_QueryVo vo = new Wage_QueryVo();
		// 获得Page对象
		Page<WagePerformance> pages = new Page<WagePerformance>();
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM");
		Date date = null;
		// 每页数
		if (vo != null) {
			pages.setPage((page - 1) * vo.getSize() + 1);
			vo.setPage((page - 1) * vo.getSize() + 1);
			vo.setStartRow((pages.getPage()));
			vo.setSize(page * 10);
			if (wage_QueryVo.getWage_Code() != null && wage_QueryVo.getWage_Code() != "") {
				vo.setWage_Code(wage_QueryVo.getWage_Code().trim());// 审批编号
			}
			if(month!=null &&month!="") {
				try {
					date = formatter.parse(month);
				} catch (ParseException e) {
					e.printStackTrace();
				}
				vo.setWage_Month(date);// 月份
			}
			if (wage_QueryVo.getWage_Name() != null) {
				vo.setWage_Name(wage_QueryVo.getWage_Name());// 员工
			}
			if (jinE1 != null) {
				vo.setWage_Yfgz1(jinE1);// 应发工资
			}
			if (jinE2 != null) {
				vo.setWage_Yfgz2(jinE2);// 应发工资
			}
			if (jinE3 != null) {
				vo.setWage_Sfgz1(jinE3);// 实发工资
			}
			if (jinE4 != null) {
				vo.setWage_Sfgz2(jinE4);// 实发工资
			}
			if (wage_QueryVo.getWage_Yglx() != null) {
				vo.setWage_Yglx(wage_QueryVo.getWage_Yglx());// 员工类型
			}
			if (wage_QueryVo.getWage_Tbr() != null && wage_QueryVo.getWage_Tbr() != "") {
				vo.setWage_Tbr(wage_QueryVo.getWage_Tbr().trim());// 填报人
			}
			if (wage_QueryVo.getAppr_Status() != null) {
				vo.setAppr_Status(wage_QueryVo.getAppr_Status());// 审批状态
			}
			if (wage_QueryVo.getNextCz() != null && wage_QueryVo.getNextCz() != "") {
				vo.setNextCz(wage_QueryVo.getNextCz().trim());// 当前操作
			}
		}
		// 总页数
		pages.setTotal(wagePerService.queryAllWagePerformanceCount(vo));
		pages.setRows(wagePerService.queryAllWagePerformance(vo));
		Gson gson = new Gson();
		map.put("code", 0);
		map.put("msg", "");
		map.put("count", wagePerService.queryAllWagePerformanceCount(vo));
		List<WagePerformance> rows = pages.getRows();
		// 遍历该集合 设置项目名称、费用类型、费用所属
		for (WagePerformance row : rows) {
			if (row.getWage_per_Name() != null) {
				User user = userService.queryUserById(row.getWage_per_Name());
				row.setUser_Name(user.getUser_name());
			}
			if (row.getWage_per_Department() != null) {
				Department department = departmentService.queryDepartmentById(row.getWage_per_Department());
				row.setUser_Department(department.getDep_name());
			}
			if (row.getWage_per_Position() != null) {
				User_DM_Posittion posittion = userService.queryPosittionById(row.getWage_per_Position());
				row.setUser_Posittion(posittion.getPosittion_mc());
			}
			if (row.getWage_per_Yglx() != null) {
				User_DM_YGLX yglx = wagePerService.queryYGLXById(row.getWage_per_Yglx());
				row.setYglx_name(yglx.getYglx_mc());
			}
			if (row.getAppr_Status() != null) {
				row.setAppr_status_name(xiaoShouHTDJService.queryStatus(row.getAppr_Status()).getAppr_Status_Name());
			}
		}
		map.put("data", pages.getRows());
		String json = gson.toJson(map);
		return json.toString();
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
		int a = (int) ((Math.random() * 9 + 1) * 100000);
		String x = String.valueOf(a);
		String time = year + month + day + Hourse + minute + second;
		String bh = "W" + time + x;
		return bh;
	}

	// ajax加载所有的用户
	@RequestMapping(value = "/querAllUser.do")
	@ResponseBody
	public String querAllUser() {
		JSONArray jsonArray = wagePerService.querAllUser();
		return jsonArray.toString();
	}

	// 下拉用户带出所属部门和所属岗位
	@RequestMapping(value = "/queryUserBMandGW.do")
	@ResponseBody
	public String queryUserBMandGW(@RequestParam Integer yhDM) {
		// 根据用户主键查询用户对象
		User user = wagePerService.queryUserBMandGW(yhDM);
		JSONObject jsonObject = new JSONObject();
		// 得到用户部门代码和用户岗位代码
		Integer department_id = null;
		Integer posittion_id = null;
		if (user != null) {
			department_id = user.getUser_department_id();
			posittion_id = user.getUser_posittion();
			// 根据用户部门主键查询部门对象
			Department department = departmentService.queryDepartmentById(department_id);
			// 根据用户岗位主键查询岗位对象
			User_DM_Posittion posittion = userService.queryPosittionById(posittion_id);
			jsonObject.put("department", department);
			jsonObject.put("posittion", posittion);
		}
		return jsonObject.toString();
	}

	// 加载所有的员工类型
	@RequestMapping(value = "/queryAllYGLX.do")
	@ResponseBody
	public String queryAllYGLX() {
		return wagePerService.querAllYGLX().toString();
	}

	// 显示我填写的工资记录
	@RequestMapping(value = "/queryMyGZJLS.do")
	@ResponseBody
	public String queryMyGZJLS(HttpServletRequest request) {
		HttpSession session = request.getSession();
		String userName = (String) session.getAttribute("userName");
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		Gson gson = new Gson();
		map.put("code", 0);
		map.put("msg", "");
		List<WagePerformance> myGZJLS = wagePerService.queryMyGZJLS(userName);
		// 遍历该集合 设置项目名称、费用类型、费用所属
		for (WagePerformance row : myGZJLS) {
			if (row.getWage_per_Name() != null) {
				User user = userService.queryUserById(row.getWage_per_Name());
				row.setUser_Name(user.getUser_name());
			}
			if (row.getWage_per_Department() != null) {
				Department department = departmentService.queryDepartmentById(row.getWage_per_Department());
				row.setUser_Department(department.getDep_name());
			}
			if (row.getWage_per_Position() != null) {
				User_DM_Posittion posittion = userService.queryPosittionById(row.getWage_per_Position());
				row.setUser_Posittion(posittion.getPosittion_mc());
			}
			if (row.getWage_per_Yglx() != null) {
				User_DM_YGLX yglx = wagePerService.queryYGLXById(row.getWage_per_Yglx());
				row.setYglx_name(yglx.getYglx_mc());
			}
		}
		map.put("data", myGZJLS);
		String json = gson.toJson(map);
		return json.toString();
	}

	// 新增操作
	@RequestMapping(value = "/saveWage.do")
	@ResponseBody
	public String saveWage(@RequestParam String spbh, String yf, Integer yg, Integer bm, Integer gw, Double jbgz,
			Double gwgz, Double jxjj, Double jiabangz, Double sbjfjs, Double dhf, Double sbgrbf, Double sbdwbf,
			Double sbbt, Double qt, Double yfgz, Double wcqkk, Double qtkk, Double sbdk, Double gsdk, Double sfgz,
			Integer yglx, String tbr, String bz) {
		// new出WagePerformance对象
		WagePerformance wagePerformance = new WagePerformance();
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM");
		JSONObject jsonObject = new JSONObject();
		// 设置属性
		wagePerformance.setWage_per_Code(spbh);
		Date date = null;
		try {
			date = formatter.parse(yf);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		wagePerformance.setWage_per_Month(date);
		wagePerformance.setWage_per_Name(yg);
		wagePerformance.setWage_per_Department(bm);
		wagePerformance.setWage_per_Position(gw);
		wagePerformance.setWage_per_BaseWage(jbgz);
		wagePerformance.setWage_per_PositionWage(gwgz);
		wagePerformance.setWage_per_AchievementBonus(jxjj);
		wagePerformance.setWage_per_OverTimePay(jiabangz);
		wagePerformance.setWage_per_Sbjfjs(sbjfjs);
		wagePerformance.setWage_per_dhf(dhf);
		wagePerformance.setWage_per_Sbgrbf(sbgrbf);
		wagePerformance.setWage_per_Sbdwbf(sbdwbf);
		wagePerformance.setWage_per_Sbbt(sbbt);
		wagePerformance.setWage_per_Qt(qt);
		wagePerformance.setWage_per_Yfgz(yfgz);
		wagePerformance.setWage_per_Wcqkk(wcqkk);
		wagePerformance.setWage_per_Qtkk(qtkk);
		wagePerformance.setWage_per_Sbdk(sbdk);
		wagePerformance.setWage_per_Gsdk(gsdk);
		wagePerformance.setWage_per_Sfgz(sfgz);
		wagePerformance.setWage_per_Yglx(yglx);
		wagePerformance.setWage_per_Tbr(tbr);
		wagePerformance.setWage_per_Bz(bz);
		wagePerformance.setIs_wcgztb(false);
		wagePerformance.setIs_ffdj(false);
		wagePerService.saveWage(wagePerformance);
		jsonObject.put("flag", true);
		return jsonObject.toString();
	}

	// 编辑操作
	@RequestMapping(value = "/editWage.do")
	@ResponseBody
	public String editWage(@RequestParam Integer rei_dm, String spbh, String yf, Integer yg, Integer bm, Integer gw,
			Double jbgz, Double gwgz, Double jxjj, Double jiabangz, Double sbjfjs, Double dhf, Double sbgrbf,
			Double sbdwbf, Double sbbt, Double qt, Double yfgz, Double wcqkk, Double qtkk, Double sbdk, Double gsdk,
			Double sfgz, Integer yglx, String tbr, String bz) {
		// 根据rei_dm获得wagePerformance对象
		WagePerformance wagePerformance = wagePerService.queryWageById(rei_dm);
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM");
		JSONObject jsonObject = new JSONObject();
		// 设置属性
		Date date = null;
		try {
			date = formatter.parse(yf);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		wagePerformance.setWage_per_Month(date);
		wagePerformance.setWage_per_Name(yg);
		wagePerformance.setWage_per_Department(bm);
		wagePerformance.setWage_per_Position(gw);
		wagePerformance.setWage_per_BaseWage(jbgz);
		wagePerformance.setWage_per_PositionWage(gwgz);
		wagePerformance.setWage_per_AchievementBonus(jxjj);
		wagePerformance.setWage_per_OverTimePay(jiabangz);
		wagePerformance.setWage_per_Sbjfjs(sbjfjs);
		wagePerformance.setWage_per_dhf(dhf);
		wagePerformance.setWage_per_Sbgrbf(sbgrbf);
		wagePerformance.setWage_per_Sbdwbf(sbdwbf);
		wagePerformance.setWage_per_Sbbt(sbbt);
		wagePerformance.setWage_per_Qt(qt);
		wagePerformance.setWage_per_Yfgz(yfgz);
		wagePerformance.setWage_per_Wcqkk(wcqkk);
		wagePerformance.setWage_per_Qtkk(qtkk);
		wagePerformance.setWage_per_Sbdk(sbdk);
		wagePerformance.setWage_per_Gsdk(gsdk);
		wagePerformance.setWage_per_Sfgz(sfgz);
		wagePerformance.setWage_per_Yglx(yglx);
		wagePerformance.setWage_per_Bz(bz);
		wagePerformance.setIs_wcgztb(false);
		wagePerformance.setIs_ffdj(false);
		wagePerService.editWage(wagePerformance);
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
			wagePerService.deleteReimById(Integer.parseInt(dm.trim()));
		}
		jsonObject.put("flag", true);
		return jsonObject.toString();
	}

	// 提交工资填报表单 并启动流程实例
	@RequestMapping(value = "/startGztb.do")
	public String startGztb(@RequestParam String remId, HttpServletRequest request, Model model) {
		// 从session中获取用户名和用户主键
		HttpSession session = request.getSession();
		// 当前登录系统用户主键和用户名
		String userName = (String) session.getAttribute("userName");
		// 将其转换为数组
		String[] reimdms = remId.split(",");
		// 遍历该数组
		for (String dm : reimdms) {
			// 根据dm 查询 WagePerformance 对象
			WagePerformance wagePerformance = wagePerService.queryWageById(Integer.parseInt(dm.trim()));
			// 审批状态(1.完成 2.运行中 3.撤销);
			wagePerformance.setAppr_Status(2);
			// 设置代办描述
			wagePerformance.setDb_Ms("工资填报");
			wagePerformance.setIs_wcgztb(true);
			wagePerformance.setIs_ffdj(false);
			wagePerService.editWage(wagePerformance);
			// 启动流程实例
			wagePerService.saveStartProcess(userName, request, wagePerformance);
		}
		model.addAttribute("flag", true);
		return "reimburse/bxtb/saveBxtb";
	}

	// 跳转至查看页面并回显数据点击代办
	@RequestMapping(value = "/wagePerformanceShow.do")
	public String wagePerformanceShow(@RequestParam Integer id, String task_id, Model model) {
		// 根据id 查询 wagePerformance 对象
		WagePerformance wagePerformance = wagePerService.queryWageById(id);
		// 格式化月份
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM");
		User user = null;// 员工
		Department department = null;// 部门
		User_DM_Posittion posittion = null;// 岗位
		User_DM_YGLX yglx = null;// 员工类型
		if (wagePerformance != null) {
			wagePerformance.setMonth(sdf.format(wagePerformance.getWage_per_Month()));
			// 查询员工
			user = userService.queryUserById(wagePerformance.getWage_per_Name());
			if (user != null) {
				wagePerformance.setUser_Name(user.getUser_name());
			}
			// 查询部门
			department = departmentService.queryDepartmentById(wagePerformance.getWage_per_Department());
			if (department != null) {
				wagePerformance.setUser_Department(department.getDep_name());
			}
			// 查询岗位
			posittion = userService.queryPosittionById(wagePerformance.getWage_per_Position());
			if (posittion != null) {
				wagePerformance.setUser_Posittion(posittion.getPosittion_mc());
			}
			// 查询员工类型
			yglx = wagePerService.queryYGLXById(wagePerformance.getWage_per_Yglx());
			if (yglx != null) {
				wagePerformance.setYglx_name(yglx.getYglx_mc());
			}
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
		model.addAttribute("wagePerformance", wagePerformance);
		model.addAttribute("taskId", task_id);
		model.addAttribute("deploymentId", pd.getDeploymentId());
		model.addAttribute("imageName", pd.getDiagramResourceName());
		model.addAttribute("map", map);
		return "wagePerformance/gztb/gztbShow";
	}

	// 点击业务列表进入查看页面
	@RequestMapping(value = "/wagePerformanceShowById.do")
	public String wagePerformanceShowById(@RequestParam Integer wage_per_Id, Model model, HttpServletRequest request) {
		// 获取session
		HttpSession session = request.getSession();
		// 根据id查询出请假记录数据(评审意见)
		List<ReviewOpinion> reviewOpinions = wagePerService.wageShowById(wage_per_Id, model, session);
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
		return "wagePerformance/gztb/gztbShow";
	}

	// 编辑工资填报回显填报数据
	@RequestMapping(value = "/initEditGztb.do")
	public String initEditGztb(@RequestParam Integer objId, Integer taskId, Model model) {
		// 根据id 查询 wagePerformance 对象
		WagePerformance wagePerformance = wagePerService.queryWageById(objId);
		// 格式化月份
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM");
		User user = null;// 员工
		Department department = null;// 部门
		User_DM_Posittion posittion = null;// 岗位
		User_DM_YGLX yglx = null;// 员工类型
		if (wagePerformance != null) {
			wagePerformance.setMonth(sdf.format(wagePerformance.getWage_per_Month()));
			// 查询员工
			user = userService.queryUserById(wagePerformance.getWage_per_Name());
			if (user != null) {
				wagePerformance.setUser_Name(user.getUser_name());
			}
			// 查询部门
			department = departmentService.queryDepartmentById(wagePerformance.getWage_per_Department());
			if (department != null) {
				wagePerformance.setUser_Department(department.getDep_name());
			}
			// 查询岗位
			posittion = userService.queryPosittionById(wagePerformance.getWage_per_Position());
			if (posittion != null) {
				wagePerformance.setUser_Posittion(posittion.getPosittion_mc());
			}
			// 查询员工类型
			yglx = wagePerService.queryYGLXById(wagePerformance.getWage_per_Yglx());
			if (yglx != null) {
				wagePerformance.setYglx_name(yglx.getYglx_mc());
			}
		}
		model.addAttribute("wagePerformance", wagePerformance);
		model.addAttribute("taskId", taskId);
		return "wagePerformance/gztb/editGztb";
	}

	// 编辑操作并启动流程
	@RequestMapping(value = "/editGztb.do")
	@ResponseBody
	public String editGztb(Integer rei_dm, String spbh, String yf, Integer yg, Integer bm, Integer gw, Double jbgz,
			Double gwgz, Double jxjj, Double jiabangz, Double sbjfjs, Double dhf, Double sbgrbf, Double sbdwbf,
			Double sbbt, Double qt, Double yfgz, Double wcqkk, Double qtkk, Double sbdk, Double gsdk, Double sfgz,
			Integer yglx, String tbr, String bz, Integer taskId, HttpServletRequest request) {
		// 根据rei_dm获得wagePerformance对象
		JSONObject jsonObject = new JSONObject();
		WagePerformance wagePerformance = wagePerService.queryWageById(rei_dm);
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM");
		// 设置属性
		Date date = null;
		try {
			date = formatter.parse(yf);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		wagePerformance.setWage_per_Month(date);
		wagePerformance.setWage_per_Name(yg);
		wagePerformance.setWage_per_Department(bm);
		wagePerformance.setWage_per_Position(gw);
		wagePerformance.setWage_per_BaseWage(jbgz);
		wagePerformance.setWage_per_PositionWage(gwgz);
		wagePerformance.setWage_per_AchievementBonus(jxjj);
		wagePerformance.setWage_per_OverTimePay(jiabangz);
		wagePerformance.setWage_per_Sbjfjs(sbjfjs);
		wagePerformance.setWage_per_dhf(dhf);
		wagePerformance.setWage_per_Sbgrbf(sbgrbf);
		wagePerformance.setWage_per_Sbdwbf(sbdwbf);
		wagePerformance.setWage_per_Sbbt(sbbt);
		wagePerformance.setWage_per_Qt(qt);
		wagePerformance.setWage_per_Yfgz(yfgz);
		wagePerformance.setWage_per_Wcqkk(wcqkk);
		wagePerformance.setWage_per_Qtkk(qtkk);
		wagePerformance.setWage_per_Sbdk(sbdk);
		wagePerformance.setWage_per_Gsdk(gsdk);
		wagePerformance.setWage_per_Sfgz(sfgz);
		wagePerformance.setWage_per_Yglx(yglx);
		wagePerformance.setWage_per_Bz(bz);
		wagePerformance.setAppr_Status(2);
		wagePerService.editWage(wagePerformance);
		// 推动流程进入下一节点
		wagePerService.saveTask(String.valueOf(taskId), request);
		jsonObject.put("flag", true);
		return jsonObject.toString();
	}

	// 已完成代办跳转至查看页面
	@RequestMapping(value = "/ObjYWCShow.do")
	public String objYWCShow(@RequestParam Integer id, String proIndeId, String PROC_DEF_ID_, Model model) {
		// 根据id 查询 wagePerformance 对象
		WagePerformance wagePerformance = wagePerService.queryWageById(id);
		// 格式化月份
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM");
		User user = null;// 员工
		Department department = null;// 部门
		User_DM_Posittion posittion = null;// 岗位
		User_DM_YGLX yglx = null;// 员工类型
		if (wagePerformance != null) {
			wagePerformance.setMonth(sdf.format(wagePerformance.getWage_per_Month()));
			// 查询员工
			user = userService.queryUserById(wagePerformance.getWage_per_Name());
			if (user != null) {
				wagePerformance.setUser_Name(user.getUser_name());
			}
			// 查询部门
			department = departmentService.queryDepartmentById(wagePerformance.getWage_per_Department());
			if (department != null) {
				wagePerformance.setUser_Department(department.getDep_name());
			}
			// 查询岗位
			posittion = userService.queryPosittionById(wagePerformance.getWage_per_Position());
			if (posittion != null) {
				wagePerformance.setUser_Posittion(posittion.getPosittion_mc());
			}
			// 查询员工类型
			yglx = wagePerService.queryYGLXById(wagePerformance.getWage_per_Yglx());
			if (yglx != null) {
				wagePerformance.setYglx_name(yglx.getYglx_mc());
			}
		}
		List<ReviewOpinion> reviewOpinions = indexService.queryReviewOpinions(proIndeId);
		// 流程图
		ProcessDefinition pd = indexService.queryProcessDefinitionById(PROC_DEF_ID_);
		model.addAttribute("reviewOpinions", reviewOpinions);
		model.addAttribute("taskId", id);
		model.addAttribute("deploymentId", pd.getDeploymentId());
		model.addAttribute("imageName", pd.getDiagramResourceName());
		model.addAttribute("wagePerformance", wagePerformance);
		return "wagePerformance/gztb/gztbShow";
	}

	// ajax自动计算应发工资、实发工资
	@RequestMapping(value = "/yfgzOrsfgzjs.do")
	@ResponseBody
	public String yfgzjs(String jbgzs, String gwgzs, String jxjjs, String jiabangzs, String sbbts, String qts,
			String dhfs, String yfgz, String wcqkks, String qtkks, String sbdks, String gsdks) {
		JSONObject jsonObject = new JSONObject();
		BigDecimal bd1 = new BigDecimal(jbgzs);
		BigDecimal bd2 = new BigDecimal(gwgzs);
		BigDecimal bd3 = new BigDecimal(jxjjs);
		BigDecimal bd4 = new BigDecimal(jiabangzs);
		BigDecimal bd5 = new BigDecimal(sbbts);
		BigDecimal bd6 = new BigDecimal(qts);
		BigDecimal bd7 = new BigDecimal(dhfs);
		BigDecimal bd8 = new BigDecimal(yfgz);
		BigDecimal bd9 = new BigDecimal(wcqkks);
		BigDecimal bd10 = new BigDecimal(qtkks);
		BigDecimal bd11 = new BigDecimal(sbdks);
		BigDecimal bd12 = new BigDecimal(gsdks);
		double yfgzs = bd1.add(bd2).add(bd3).add(bd4).add(bd5).add(bd6).add(bd7).doubleValue();
		double sfgz = 0.00;
		if ("0".equals(yfgz)) {
			sfgz = yfgzs - ((bd9.add(bd10).add(bd11).add(bd12))).doubleValue();
		} else {
			sfgz = bd8.subtract((bd9.add(bd10).add(bd11).add(bd12))).doubleValue();
		}
		jsonObject.put("yfgzs", yfgzs);
		jsonObject.put("sfgz", sfgz);
		return jsonObject.toString();
	}

}
