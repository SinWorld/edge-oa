package com.edge.system.department.controller;

import java.util.ArrayList;
import java.util.Collection;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.edge.system.department.entity.Department;
import com.edge.system.department.service.inter.DepartmentService;
import com.edge.utils.Page;
import com.edge.utils.QueryVo;
import com.google.gson.Gson;
import com.google.gson.JsonArray;

/**
 * 部门管理控制层
 * 
 * @author NingCG
 *
 */
@Controller
@RequestMapping(value = "department")
public class DepartmentController {
	@Resource
	private DepartmentService departmentService;

	// 跳转至角色列表页
	@RequestMapping(value = "/initDepartmentList.do")
	public String initDepartmentList() {
		return "sys/department/departmentList";
	}

	// 分页查询部门机构
	@RequestMapping(value = "/department.do")
	@ResponseBody
	public String department(Integer page) {
		// new出QueryVo查询对象
		QueryVo vo = new QueryVo();
		// 获得Page对象
		Page<Department> pages = new Page<Department>();
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		// 每页数
		if (vo != null) {
			pages.setPage((page - 1) * vo.getSize() + 1);
			vo.setPage((page - 1) * vo.getSize() + 1);
			vo.setStartRow((pages.getPage()));
			vo.setSize(page * 10);
		}
		// 总页数
		pages.setTotal(departmentService.departmentCount());
		pages.setRows(departmentService.queryDepartment(vo));
		Gson gson = new Gson();
		map.put("code", 0);
		map.put("msg", "");
		map.put("count", departmentService.departmentCount());
		List<Department> rows = pages.getRows();
		// 遍历该集合
		for (Department row : rows) {
			// 取出上级部门主键值 页面显示上级部门名称
			if (row.getDep_parentid() != null) {
				Department department = departmentService.queryDepartmentById(row.getDep_parentid());
				row.setDep_parentName(department.getDep_name());
			}
		}
		map.put("data", pages.getRows());
		String json = gson.toJson(map);
		return json.toString();
	}

	// 初始化部门组织机构树
	@RequestMapping(value = "/departmentList.do", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String initDepartMentTree() {
		// new出JSONArray数组存储部门
		JSONArray jsonArray = new JSONArray();
		// 得到所有的部门顶级部门
		List<Department> trees = departmentService.initDepartmentTree();
		// 遍历所有顶级部门集合
		for (Department tree : trees) {
			// new出map集合
			Map<String, Object> map = new LinkedHashMap<String, Object>();
			// new出JSONArray数组存储二级部门
			JSONArray jsonArrays = new JSONArray();
			// new出JSONArray数组存储三级部门
			JSONArray sunJsonArray = new JSONArray();
			// 向map中添加元素
			map.put("id", tree.getDep_id());
			map.put("name", tree.getDep_name());
			map.put("spread", true);
			// 查询当前部门的二级部门
			List<Department> childrenTrees = departmentService.initChildrenTree(tree.getDep_id());
			//遍历当前二级部门
			for (Department treeDepartment : childrenTrees) {
				// new出map集合
				Map<String, Object> childrenMap = new LinkedHashMap<String, Object>();
				// 向map中添加元素
				childrenMap.put("id", treeDepartment.getDep_id());
				childrenMap.put("name", treeDepartment.getDep_name());
				childrenMap.put("spread", true);
				jsonArrays.add(childrenMap);
				// 查询当前部门的三级部门
				List<Department> sanjiBM = departmentService.initChildrenTree(treeDepartment.getDep_id());
				//遍历三级部门
				for (Department sjbm : sanjiBM) {
					// new出map集合
					Map<String, Object> sjMap = new LinkedHashMap<String, Object>();
					// 向map中添加元素
					sjMap.put("id", sjbm.getDep_id());
					sjMap.put("name", sjbm.getDep_name());
					sjMap.put("spread", true);
					sunJsonArray.add(sjMap);
					childrenMap.put("children", sunJsonArray);
				}
				map.put("children", jsonArrays);
			}
			jsonArray.add(map);
		}
		return jsonArray.toJSONString();
	}
	
	
	

	// 点击树状菜单栏右侧表格跟随变化
	@RequestMapping(value = "/queryDepartment.do", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String queryDepartmentList(@RequestParam Integer id, Integer page) {
		// new出QueryVo查询对象
		QueryVo vo = new QueryVo();
		// 获得Page对象
		Page<Department> pages = new Page<Department>();
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		// 每页数
		if (vo != null) {
			pages.setPage((page - 1) * vo.getSize() + 1);
			vo.setPage((page - 1) * vo.getSize() + 1);
			vo.setStartRow((pages.getPage()));
			vo.setSize(page * 10);
			vo.setDep_id(id);
		}
		// 总页数
		pages.setTotal(departmentService.queryDepartCountById(id));
		pages.setRows(departmentService.queryDepartmenListById(vo));
		Gson gson = new Gson();
		map.put("code", 0);
		map.put("msg", "");
		map.put("count", departmentService.queryDepartCountById(id));
		List<Department> rows = pages.getRows();
		// 遍历该集合
		for (Department row : rows) {
			// 取出上级部门主键值 页面显示上级部门名称
			if (row.getDep_parentid() != null) {
				Department department = departmentService.queryDepartmentById(row.getDep_parentid());
				row.setDep_parentName(department.getDep_name());
			}
		}
		map.put("data", pages.getRows());
		String json = gson.toJson(map);
		return json.toString();
	}

	// 初始化新增部门页面
	@RequestMapping(value = "/initSaveDepartment.do")
	public String initSaveDepartment() {
		return "sys/department/saveDepartment";
	}

	// 新增、编辑时初始化上级部门的部门机构树
	@RequestMapping(value = "/orgDepartment.do", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String orgDepartment() {
		// new出JSONArray数组对象
		JSONArray jsonArray = new JSONArray();
		// 准备部门列表数据，用于select框显示
		List<Department> topList = departmentService.topList();
		List<Department> treeList = this.getTreeList(topList, null);
		jsonArray.add(treeList);
		return jsonArray.toString();
	}

	private List<Department> getTreeList(List<Department> topList, Long removeId) {
		List<Department> treeList = new ArrayList<Department>();
		this.walkTree(topList, treeList, "┣", removeId, departmentService);
		return treeList;
	}

	/**
	 * 组织树形部门数据
	 */
	private void walkTree(Collection<Department> topList, List<Department> treeList, String prefix, Long removeId,
			DepartmentService departmentService) {
		for (Department d : topList) {
			if (removeId != null && d.getDep_id().equals(removeId)) {
				continue;
			}
			Department copy = new Department();
			copy.setDep_id(d.getDep_id());
			copy.setDep_name(prefix + d.getDep_name());
			// 顶点
			treeList.add(copy);
			// 子树
			Integer dep_id = d.getDep_id();
			List<Department> children = departmentService.initChildrenTree(dep_id);
			walkTree(children, treeList, "　" + prefix, removeId, departmentService);
		}
	}

	// 新增部门
	@RequestMapping(value = "/saveDepartment.do")
	public String saveDepartment(Department department, Model model) {
		department.setDep_is_delete(false);
		departmentService.saveDepartment(department);
		model.addAttribute("flag", true);
		return "sys/department/saveDepartment";
	}
	
	
	//编辑时部门在页面回显
	@RequestMapping(value="/initEdgeDepartment.do")
	public String initEditDepartment(@RequestParam Integer id,Model model) {
		Department department = departmentService.queryDepartmentById(id);
		//得到上级部门的部门主键 根据该主键去查询上级部门名称
		//如果该部门为顶级部门则上级部门主键为空
		if(department.getDep_parentid()==null) {
			model.addAttribute("department", department);
			model.addAttribute("depName", "请选择部门");
		}else {
			Department dep = departmentService.queryDepartmentById(department.getDep_parentid());
			model.addAttribute("department", department);
			model.addAttribute("depName", dep.getDep_name());
		}
		return "sys/department/editDepartment";
	}
	
	//编辑部门
	@RequestMapping(value="/editDepartment.do")
	public String editDepartment(Department department,Model model) {
		department.setDep_is_delete(false);
		departmentService.editDepartment(department);
		model.addAttribute("flag", true);
		return "sys/department/editDepartment";
	}
	
	//删除部门 (逻辑删除)
	@RequestMapping(value = "/deleteDepartment.do", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String deleteDepartmentById(@RequestParam Integer id) {
		//new出JSONObject对象
		JSONObject jsonObject=new JSONObject();
		//根据id查询该部门
		Department department = departmentService.queryDepartmentById(id);
		//查询该部门下的是否存在子部门
		List<Department> childrenDepartment = departmentService.initChildrenTree(department.getDep_id());
		//如果存在子部门
		if(childrenDepartment.size()>0) {
			//提示信息  当前部门下存在子部门不允许删除
			jsonObject.put("flag",false);
			return jsonObject.toString();
		}else {
			//不存在子部门 可进行逻辑删除
			department.setDep_is_delete(true);
			departmentService.editDepartment(department);
			jsonObject.put("flag",true);
			return jsonObject.toString();
		}
	}
	
}
