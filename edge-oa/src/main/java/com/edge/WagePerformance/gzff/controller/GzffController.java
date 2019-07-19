package com.edge.WagePerformance.gzff.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONArray;
import com.edge.WagePerformance.entity.WagePerformance;
import com.edge.WagePerformance.gzff.entity.Gzff_QueryVo;
import com.edge.WagePerformance.gzff.service.inter.GzffService;
import com.edge.WagePerformance.service.inter.WagePerService;
import com.edge.index.service.inter.IndexService;
import com.edge.system.department.entity.Department;
import com.edge.system.department.service.inter.DepartmentService;
import com.edge.system.user.entity.User;
import com.edge.system.user.entity.User_DM_Posittion;
import com.edge.system.user.entity.User_DM_YGLX;
import com.edge.system.user.service.inter.UserService;
import com.edge.utils.Page;
import com.google.gson.Gson;

/**
 * 工资发放控制层
 * 
 * @author NingCG
 *
 */
@Controller
@RequestMapping("gzff")
public class GzffController {
	@Resource
	private GzffService gzffService;
	@Resource
	private DepartmentService departmentService;
	@Resource
	private UserService userService;
	@Resource
	private IndexService indexService;
	@Resource
	private WagePerService wagePerService;

	// 跳转至工资发放列表页面
	@RequestMapping(value = "/initGzff.do")
	public String initGzff() {
		return "wagePerformance/gzff/gzffList";
	}

	// 分页显示工资填报记录
	@RequestMapping(value = "/queryAllGZTB.do")
	@ResponseBody
	public String queryAllGZTB(Integer page, Gzff_QueryVo gzff_QueryVo, Double jinE1, Double jinE2, Double jinE3,
			Double jinE4, String month) {
		// new出QueryVo查询对象
		Gzff_QueryVo vo = new Gzff_QueryVo();
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
			if (gzff_QueryVo.getWage_Code() != null && gzff_QueryVo.getWage_Code() != "") {
				vo.setWage_Code(gzff_QueryVo.getWage_Code().trim());// 审批编号
			}
			if (month != null && month != "") {
				try {
					date = formatter.parse(month);
				} catch (ParseException e) {
					e.printStackTrace();
				}
				vo.setWage_Month(date);// 月份
			}
			if (gzff_QueryVo.getWage_Name() != null) {
				vo.setWage_Name(gzff_QueryVo.getWage_Name());// 员工
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
			if (gzff_QueryVo.getWage_Yglx() != null) {
				vo.setWage_Yglx(gzff_QueryVo.getWage_Yglx());// 员工类型
			}
			if (gzff_QueryVo.getWage_Tbr() != null && gzff_QueryVo.getWage_Tbr() != "") {
				vo.setWage_Tbr(gzff_QueryVo.getWage_Tbr().trim());// 填报人
			}
			if (gzff_QueryVo.getBms() != null) {
				vo.setBms(gzff_QueryVo.getBms());// 所属部门
			}
			if (gzff_QueryVo.getUser_posittion() != null) {
				vo.setUser_posittion(gzff_QueryVo.getUser_posittion());// 当前操作
			}
		}
		// 总页数
		pages.setTotal(gzffService.queryAllWagePerformanceCount(vo));
		pages.setRows(gzffService.queryAllWagePerformance(vo));
		Gson gson = new Gson();
		map.put("code", 0);
		map.put("msg", "");
		map.put("count", gzffService.queryAllWagePerformanceCount(vo));
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
		}
		map.put("data", pages.getRows());
		String json = gson.toJson(map);
		return json.toString();
	}

	// ajax查询所有的部门
	@RequestMapping(value = "/queryAllBM.do")
	@ResponseBody
	public String queryAllBM() {
		JSONArray bms = gzffService.queryAllBM();
		return bms.toString();
	}
}
