package com.edge.index.controller;

import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.TreeSet;

import javax.annotation.Resource;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.edge.WagePerformance.entity.WagePerformance;
import com.edge.WagePerformance.service.inter.WagePerService;
import com.edge.index.service.inter.IndexService;
import com.edge.projman.approveproj.entity.Foll_up_Proj;
import com.edge.projman.approveproj.service.inter.ApproveprojService;
import com.edge.projman.xshtdj.entity.XiaoShouHT;
import com.edge.projman.xshtdj.service.inter.XiaoShouHTDJService;
import com.edge.reimburse.bxtb.entity.Reimbursement;
import com.edge.reimburse.bxtb.service.inter.ReportService;
import com.edge.system.role.entity.Privilege;
import com.edge.system.user.service.inter.UserService;
import com.edge.utils.MyTask;
import com.edge.utils.Page;
import com.edge.utils.QueryVo;
import com.edge.utils.TaskYWC;
import com.google.gson.Gson;

@Controller
@RequestMapping(value = "index")
public class IndexController {
	@Resource
	private IndexService indexService;
	@Resource
	private UserService userService;
	@Resource
	private ApproveprojService approveprojService;
	@Resource
	private XiaoShouHTDJService xiaoShouHTDJService;
	@Resource
	private ReportService reportService;
	@Resource
	private WagePerService wagePerService;

	// 跳转至登录首页
	@RequestMapping(value = "/index.do")
	public String index(HttpServletRequest request, Model model) {
		// 从request作用域中得到session
		HttpSession session = request.getSession();
		// 从session中得到当前登录用户的主键
		Integer userId = (Integer) session.getAttribute("userId");
		Boolean flag = (Boolean) session.getAttribute("kg");
		this.userAllPrivilege(userId, model, session, flag);
		return "index/index";

	}

	// 用户登录系统查询当前用户所拥有的权限
	public void userAllPrivilege(Integer userId, Model model, HttpSession session, Boolean flag) {
		// 查询当前登录用户的所有顶级权限权限
		List<Privilege> userPrivilegeList = indexService.userPrivilegeList(userId);
		TreeSet<Privilege> topList = new TreeSet<Privilege>();
		// new出JSONArry对象用于存储所有的三级权限
		JSONArray jsonArray = new JSONArray();
		// 遍历顶级权限集合
		// 查询当前登录用户的所有顶级权限下的二级子权限
		for (Privilege privilege : userPrivilegeList) {
			topList.add(privilege);
			List<Privilege> ejChildrenList = indexService.ejChildrenList(userId, privilege.getPrivilege_id());
			// 遍历二级子权限集合 将二级子权限添加到权限对象的set集合中
			for (Privilege ej : ejChildrenList) {
				if (ej.getIs_yc() == false) {
					privilege.setChildren(ej);
				}
				// 得到用户二级下所有的三级权限
				List<Privilege> sjChildrenList = indexService.ejChildrenList(userId, ej.getPrivilege_id());
				// 遍历所有的三级权限添加到JSONArray数组中
				for (Privilege sjqx : sjChildrenList) {
					jsonArray.add(sjqx);
				}
			}
		}
		// 将三级权限存入session中
		if (flag) {
			session.setAttribute("sjqxs", jsonArray.toString().trim());
			session.setAttribute("kg", false);
		}
		// 用于用户在不退出登录的情况下控制加载权限菜单
		model.addAttribute("privilegeTopList", topList);

	}

	// 跳转至首页显示代办、已办、已完成
	@RequestMapping(value = "/headPage.do")
	public String headPage(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		String user_name = (String) session.getAttribute("userName");
		Integer dbCount = indexService.myTaskCount(user_name);
		Integer ywcCount = indexService.TaskYWCCount();
		model.addAttribute("dbCount", dbCount);
		model.addAttribute("ywcCount", ywcCount);
		return "index/headPage";
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
		Page<MyTask> pages = new Page<MyTask>();
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		// 每页数
		if (vo != null) {
			pages.setPage((page - 1) * vo.getSize() + 1);
			vo.setPage((page - 1) * vo.getSize() + 1);
			vo.setStartRow((pages.getPage()));
			vo.setSize(page * 10);
			vo.setUser_name(user_name);
		}
		pages.setTotal(indexService.myTaskCount(user_name));
		pages.setRows(indexService.queryMyTask(vo));
		// 总页数
		Gson gson = new Gson();
		map.put("code", 0);
		map.put("msg", "");
		map.put("count", indexService.myTaskCount(user_name));
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");// 设置日期格式
		List<MyTask> myTasks = pages.getRows();
		// 遍历该集合 设置代办集合
		for (MyTask myTask : myTasks) {
			String startTime = df.format(myTask.getCREATE_TIME_());
			myTask.setStartTime(startTime);
			// 得到myTask中的PROC_DEF_ID_值得到业务表数据主键
			List<String> businesskeys = indexService.queryBusinesskey(myTask.getPROC_DEF_ID_());
			// 取得businesskey
			String businesskey = businesskeys.get(0);
			String id = businesskey.substring(businesskey.indexOf(".") + 1);
			// 得到业务数据类型
			String object = businesskey.substring(0, businesskey.indexOf("."));
			if ("Foll_up_Proj".equals(object)) {// 表示项目立项
				// 获得Foll_up_Proj对象
				Foll_up_Proj foll_up_Proj = approveprojService.queryXiangMuXXById(Integer.parseInt(id));
				// 获得任务描述 设置待办任务描述
				String taskDecription = "【" + myTask.getNAME_() + "】" + "  " + "【" + "任务名称:" + foll_up_Proj.getDb_ms()
						+ "】";
				myTask.setTaskDecription(taskDecription);
			} else if ("XiaoShouHT".equals(object)) {// 表示销售合同登记
				// 获得XiaoShouHT对象
				XiaoShouHT xsht = xiaoShouHTDJService.queryXSHTById(Integer.parseInt(id));
				// 获得任务描述 设置待办任务描述
				String taskDecription = "【" + myTask.getNAME_() + "】" + "  " + "【" + "任务名称:" + xsht.getDb_MS() + "】";
				myTask.setTaskDecription(taskDecription);
			} else if ("Reimbursement".equals(object)) {// 表示报销申请
				// 获得Reimbursement对象
				Reimbursement reimbursement = reportService.queryReimbursementById(Integer.parseInt(id));
				// 获得任务描述 设置待办任务描述
				String taskDecription = "【" + myTask.getNAME_() + "】" + "  " + "【" + "任务名称:" + reimbursement.getDb_ms()
						+ "】";
				myTask.setTaskDecription(taskDecription);
			} else if ("WagePerformance".equals(object)) {// 表示工资填报
				// 获得WagePerformance对象
				WagePerformance wagePerformance = wagePerService.queryWageById(Integer.parseInt(id));
				// 获得任务描述 设置待办任务描述
				String taskDecription = "【" + myTask.getNAME_() + "】" + "  " + "【" + "任务名称:"
						+ wagePerformance.getDb_Ms() + "】";
				myTask.setTaskDecription(taskDecription);
			}
		}
		map.put("data", pages.getRows());
		String json = gson.toJson(map);
		return json.toString();
	}

	// 通过我的代办主键去关联查询运行时流程执行实例表从而得到业务数据表主键
	@RequestMapping(value = "/querObjId.do")
	@ResponseBody
	public String querObjId(@RequestParam String task_id) {
		// 得到业务数据主键
		String businessKey = indexService.querObjectId(task_id);
		String id = businessKey.substring(businessKey.indexOf(".") + 1);
		// new出JSONObject对象
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("id", id);
		jsonObject.put("taskId", task_id);
		jsonObject.put("obj", businessKey.substring(0, businessKey.indexOf(".")));
		return jsonObject.toString();
	}

	// 分页查询已完成
	@RequestMapping(value = "/taskListYWC.do")
	@ResponseBody
	public String taskListYWC(Integer page, HttpServletRequest request) {
		// new出QueryVo查询对象
		QueryVo vo = new QueryVo();
		// 获得Page对象
		Page<TaskYWC> pages = new Page<TaskYWC>();
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		// 每页数
		if (vo != null) {
			pages.setPage((page - 1) * vo.getSize() + 1);
			vo.setPage((page - 1) * vo.getSize() + 1);
			vo.setStartRow((pages.getPage()));
			vo.setSize(page * 10);
		}

		pages.setTotal(indexService.TaskYWCCount());
		pages.setRows(indexService.queryTaskYWC(vo));
		// 总页数
		Gson gson = new Gson();
		map.put("code", 0);
		map.put("msg", "");
		map.put("count", indexService.TaskYWCCount());
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");// 设置日期格式
		List<TaskYWC> twcs = pages.getRows();
		// 遍历该集合 设置代办集合
		for (TaskYWC ywc : twcs) {
			String startTime = df.format(ywc.getSTART_TIME_());
			ywc.setBeginTime(startTime);
			String endTime = df.format(ywc.getEND_TIME_());
			ywc.setEndTime(endTime);
			// 得到ywc中的PROC_DEF_ID_值得到业务表数据主键
			String businesskey = ywc.getBUSINESS_KEY_();
			// 取得businesskey
			String id = businesskey.substring(businesskey.indexOf(".") + 1);
			// 得到业务数据类型
			String object = businesskey.substring(0, businesskey.indexOf("."));
			if ("Foll_up_Proj".equals(object)) {// 表示项目立项
				// 获得Foll_up_Proj对象
				Foll_up_Proj foll_up_Proj = approveprojService.queryXiangMuXXById(Integer.parseInt(id));
				// 获得任务描述 设置待办任务描述
				String taskDecription = "【" + ywc.getNAME_() + "】" + "  " + "【" + "任务名称:" + foll_up_Proj.getDb_ms()
						+ "】";
				ywc.setTaskDecription(taskDecription);
			} else if ("XiaoShouHT".equals(object)) {// 表示销售合同登记
				// 获得XiaoShouHT对象
				XiaoShouHT xsht = xiaoShouHTDJService.queryXSHTById(Integer.parseInt(id));
				// 获得任务描述 设置待办任务描述
				String taskDecription = "【" + ywc.getNAME_() + "】" + "  " + "【" + "任务名称:" + xsht.getDb_MS() + "】";
				ywc.setTaskDecription(taskDecription);
			} else if ("Reimbursement".equals(object)) {// 表示报销申请
				// 获得Reimbursement对象
				Reimbursement reimbursement = reportService.queryReimbursementById(Integer.parseInt(id));
				// 获得任务描述 设置待办任务描述
				String taskDecription = "【" + ywc.getNAME_() + "】" + "  " + "【" + "任务名称:" + reimbursement.getDb_ms()
						+ "】";
				ywc.setTaskDecription(taskDecription);
			} else if ("WagePerformance".equals(object)) {// 表示工资填报
				// 获得WagePerformance对象
				WagePerformance wagePerformance = wagePerService.queryWageById(Integer.parseInt(id));
				// 获得任务描述 设置待办任务描述
				String taskDecription = "【" + ywc.getNAME_() + "】" + "  " + "【" + "任务名称:" + wagePerformance.getDb_Ms()
						+ "】";
				ywc.setTaskDecription(taskDecription);
			}
		}
		map.put("data", pages.getRows());
		String json = gson.toJson(map);
		return json.toString();
	}

	// 点击已完成查看业务数据
	@RequestMapping(value = "/querywcObjId.do")
	@ResponseBody
	public String querywcObjId(@RequestParam String task_id, String proIndeId, String PROC_DEF_ID_) {
		// 得到业务数据主键
		String id = task_id.substring(task_id.indexOf(".") + 1);
		// 得到业务数据类型
		String obj = task_id.substring(0, task_id.indexOf("."));
		// new出JSONObject对象
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("id", id);
		jsonObject.put("proIndeId", proIndeId);
		// 流程部署Id
		jsonObject.put("PROC_DEF_ID_", PROC_DEF_ID_);
		jsonObject.put("obj", obj);
		return jsonObject.toString();
	}

	// 判断任务表单的打开了页面
	@RequestMapping(value = "/result.do")
	@ResponseBody
	public String initResult(String task_id, Model model) {
		String result = indexService.querTaskFromKeyByTaskId(task_id);
		model.addAttribute("taskId", task_id);
		// new出JSONObject对象
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("address", result);
		return jsonObject.toString();
	}

	// 点击处理打开任务表单
	@RequestMapping(value = "/dealWith.do")
	public String dealWith(String task_id, Model model) {
		String result = indexService.querTaskFromKeyByTaskId(task_id);
		model.addAttribute("taskId", task_id);
		return result;
	}

	// 显示流程图
	@RequestMapping(value = "/viewImage.do")
	public void viewImage(@RequestParam String deploymentId, String imageName, HttpServletResponse response) {
		try {
			imageName = new String(imageName.getBytes("ISO8859-1"), "UTF-8");
		} catch (UnsupportedEncodingException e1) {
			e1.printStackTrace();
		}
		InputStream in = indexService.findImageInputStream(deploymentId, imageName);
		response.setContentType("image/png");
		response.setCharacterEncoding("utf-8");
		try {
			ServletOutputStream outputStream = response.getOutputStream();
			int len = 0;
			byte[] buf = new byte[1024];
			while ((len = in.read(buf, 0, 1024)) != -1) {
				outputStream.write(buf, 0, len);
			}
			outputStream.close();
			in.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	// 办理个人任务
	@RequestMapping(value = "/saveSubmitTask.do")
	public String saveSubmitTask(String task_id, HttpServletRequest request, Model model, @RequestParam String outcome,
			String advice) {
		indexService.saveSubmitTask(task_id, request, advice, outcome);
		model.addAttribute("flag", true);
		return "projman/approveproj/result";
	}

}
