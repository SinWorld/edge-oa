package com.edge.yyzx.khxt.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;
import com.edge.utils.Page;
import com.edge.yyzx.kh.entity.KeHu;
import com.edge.yyzx.kh.service.inter.KeHuService;
import com.edge.yyzx.khxt.entity.KeHuXT;
import com.edge.yyzx.khxt.entity.KeHuXT_QueryVo;
import com.edge.yyzx.khxt.service.inter.KeHuXTService;
import com.google.gson.Gson;

/**
 * 客户系统逻辑控制层
 * 
 * @author NingCG
 *
 */
@Controller
@RequestMapping("khxt")
public class KeHuXTController {
	@Resource
	private KeHuXTService keHuXTService;
	@Resource
	private KeHuService keHuService;

	// 分页查询客户系统
	@RequestMapping(value = "/khxtList.do")
	@ResponseBody
	public String khxtList(Integer page, KeHuXT_QueryVo khxt_QueryVo, String time1, String time2) {
		// new出QueryVo查询对象
		KeHuXT_QueryVo vo = new KeHuXT_QueryVo();
		// 获得Page对象
		Page<KeHuXT> pages = new Page<KeHuXT>();
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");// 设置日期格式
		// 每页数
		if (vo != null) {
			pages.setPage((page - 1) * vo.getSize() + 1);
			vo.setPage((page - 1) * vo.getSize() + 1);
			vo.setStartRow((pages.getPage()));
			vo.setSize(page * 10);
			if (khxt_QueryVo.getKhxt_dh() != null && khxt_QueryVo.getKhxt_dh() != "") {
				vo.setKhxt_dh(khxt_QueryVo.getKhxt_dh().trim());
			}
			if (khxt_QueryVo.getKhxt_mc() != null && khxt_QueryVo.getKhxt_mc() != "") {
				vo.setKhxt_mc(khxt_QueryVo.getKhxt_mc().trim());
			}
			if (khxt_QueryVo.getKhxt_khdm() != null) {
				vo.setKhxt_khdm(khxt_QueryVo.getKhxt_khdm());
			}
			if (khxt_QueryVo.getKhxt_khbm() != null && khxt_QueryVo.getKhxt_khbm() != "") {
				vo.setKhxt_khbm(khxt_QueryVo.getKhxt_khbm().trim());
			}
			if (khxt_QueryVo.getKhxt_khfzr() != null && khxt_QueryVo.getKhxt_khfzr() != "") {
				vo.setKhxt_khfzr(khxt_QueryVo.getKhxt_khfzr().trim());
			}
			if (time1 != null && time1 != "") {
				// 将String类型转换为Date类型
				try {
					vo.setBeginTime1(sdf.parse(time1));
				} catch (ParseException e) {
					e.printStackTrace();
				}
			}
			if (time2 != null && time2 != "") {
				// 将String类型转换为Date类型
				try {
					vo.setBeginTime2(sdf.parse(time2));
				} catch (ParseException e) {
					e.printStackTrace();
				}
			}
		}
		// 总页数
		pages.setTotal(keHuXTService.queryKHXTSCount(vo));
		pages.setRows(keHuXTService.queryKHXTS(vo));
		Gson gson = new Gson();
		map.put("code", 0);
		map.put("msg", "");
		List<KeHuXT> rows = pages.getRows();
		for (KeHuXT row : rows) {
			if (row.getKhxt_khdm() != null) {
				KeHu kh = keHuService.queryKHById(row.getKhxt_khdm());
				row.setKhxt_khmc(kh.getKhmc());
			}
		}
		map.put("count", keHuXTService.queryKHXTSCount(vo));
		map.put("data", pages.getRows());
		String json = gson.toJson(map);
		return json.toString();
	}

	// 跳转至新增页面
	@RequestMapping(value = "/initSaveKHXT.do")
	public String initSaveKHXT() {
		return "yyzx/khxt/savekhxt";
	}

	// 新增操作
	@RequestMapping(value = "/saveKHXT.do")
	public String saveKHXT(KeHuXT khxt, Model model) {
		keHuXTService.saveKHXT(khxt);
		model.addAttribute("flag", true);
		return "yyzx/khxt/savekhxt";
	}

	// 打开编辑页面
	@RequestMapping(value = "/initEditKHXT.do")
	public String initEditKHXT(@RequestParam Integer khxt_dm, Model model) {
		// 根据id查询对应的客户系统
		KeHuXT khxt = keHuXTService.queryKHXTById(khxt_dm);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");// 设置日期格式
		// 格式化日期
		khxt.setSxrq(sdf.format(khxt.getKhxt_sxrq()));
		model.addAttribute("khxt", khxt);
		return "yyzx/khxt/editkhxt";
	}

	// 编辑操作
	@RequestMapping(value = "/editKHXT.do")
	public String editKHXT(KeHuXT khxt, Model model) {
		keHuXTService.editKHXT(khxt);
		model.addAttribute("flag", true);
		return "yyzx/khxt/editkhxt";
	}

	// 查看操作
	@RequestMapping(value = "/khxtShow.do")
	public String khxtShow(@RequestParam Integer khxt_dm, Model model) {
		// 根据id查询对应的客户系统
		KeHuXT khxt = keHuXTService.queryKHXTById(khxt_dm);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");// 设置日期格式
		if (khxt != null) {
			KeHu kh = keHuService.queryKHById(khxt.getKhxt_khdm());
			khxt.setKhxt_khmc(kh.getKhmc());
			// 格式化日期
			khxt.setSxrq(sdf.format(khxt.getKhxt_sxrq()));
		}
		model.addAttribute("khxt", khxt);
		return "yyzx/khxt/khxtShow";
	}

	// 删除操作
	@RequestMapping(value = "/deleteKHXTById.do")
	@ResponseBody
	public String deleteKHXTById(Integer khxt_dm) {
		JSONObject jsonObject = new JSONObject();
		keHuXTService.deleteKHXTById(khxt_dm);
		jsonObject.put("flag", true);
		return jsonObject.toString();
	}
}
