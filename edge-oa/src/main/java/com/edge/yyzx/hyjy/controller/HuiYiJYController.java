package com.edge.yyzx.hyjy.controller;

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

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.edge.utils.Page;
import com.edge.yyzx.hyjy.entity.HuiYiJY;
import com.edge.yyzx.hyjy.entity.HuiYiJY_QueryVo;
import com.edge.yyzx.hyjy.service.inter.HuiYiJYService;
import com.edge.yyzx.kh.entity.KeHu;
import com.edge.yyzx.kh.service.inter.KeHuService;
import com.google.gson.Gson;

/**
 * 会议纪要逻辑控制层
 * 
 * @author NingCG
 *
 */
@Controller
@RequestMapping("hyjy")
public class HuiYiJYController {
	@Resource
	private HuiYiJYService huiYiJYService;
	@Resource
	private KeHuService keHuService;

	// 分页查询会议纪要
	@RequestMapping(value = "/hyjyList.do")
	@ResponseBody
	public String hyjyList(Integer page, HuiYiJY_QueryVo hyjy_QueryVo) {
		// new出QueryVo查询对象
		HuiYiJY_QueryVo vo = new HuiYiJY_QueryVo();
		// 获得Page对象
		Page<HuiYiJY> pages = new Page<HuiYiJY>();
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		// 每页数
		if (vo != null) {
			pages.setPage((page - 1) * vo.getSize() + 1);
			vo.setPage((page - 1) * vo.getSize() + 1);
			vo.setStartRow((pages.getPage()));
			vo.setSize(page * 10);
		}
		// 总页数
		pages.setTotal(huiYiJYService.queryHYJYSCount(vo));
		pages.setRows(huiYiJYService.queryHYJYS(vo));
		List<HuiYiJY> rows = pages.getRows();
		for (HuiYiJY row : rows) {
			if (row.getKehudm() != null) {
				KeHu kh = keHuService.queryKHById(row.getKehudm());
				row.setKhmc(kh.getKhmc());
			}
		}
		Gson gson = new Gson();
		map.put("code", 0);
		map.put("msg", "");
		map.put("count", huiYiJYService.queryHYJYSCount(vo));
		map.put("data", rows);
		String json = gson.toJson(map);
		return json.toString();
	}

	// 跳转至会议纪要新增页面
	@RequestMapping(value = "/initSaveHyjy.do")
	public String initSaveHyjy() {
		return "yyzx/hyjy/savehyjy";
	}

	// ajax加载所有的客户
	@RequestMapping(value = "/queryAllKh.do")
	@ResponseBody
	public String queryAllKh() {
		JSONArray jsonArray = keHuService.queryAllKh();
		return jsonArray.toString();
	}

	// 新增会议纪要
	@RequestMapping(value = "/saveHyjy.do")
	public String saveHyjy(HuiYiJY hyjy, Model model) {
		huiYiJYService.saveHyjy(hyjy);
		model.addAttribute("flag", true);
		return "yyzx/hyjy/savehyjy";
	}

	// 根据id查询会议纪要
	@RequestMapping(value = "/queryHYJYById.do")
	public String queryHYJYById(@RequestParam Integer hyjydm, Model model) {
		// 根据id查询对应的会议纪要
		HuiYiJY hyjy = huiYiJYService.queryHYJYById(hyjydm);
		// 设置开始时间、和结束时间
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String kssj = sdf.format(hyjy.getBeginTime());
		String jssj = sdf.format(hyjy.getEndTime());
		model.addAttribute("hyjy", hyjy);
		model.addAttribute("kssj", kssj);
		model.addAttribute("jssj", jssj);
		return "yyzx/hyjy/edithyjy";
	}

	// 编辑会议纪要
	@RequestMapping(value = "/editHyjy.do")
	public String editHyjy(HuiYiJY hyjy, Model model) {
		huiYiJYService.editHYJY(hyjy);
		model.addAttribute("flag", true);
		return "yyzx/hyjy/edithyjy";
	}

	// 查看
	@RequestMapping(value = "/hyjyShowById.do")
	public String hyjyShowById(@RequestParam Integer hyjydm, Model model) {
		// 根据id查询对应的会议纪要
		HuiYiJY hyjy = huiYiJYService.queryHYJYById(hyjydm);
		// 设置开始时间、和结束时间
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String kssj = sdf.format(hyjy.getBeginTime());
		String jssj = sdf.format(hyjy.getEndTime());
		if (hyjy != null) {
			KeHu kh = keHuService.queryKHById(hyjy.getKehudm());
			hyjy.setKhmc(kh.getKhmc());
		}
		model.addAttribute("hyjy", hyjy);
		model.addAttribute("kssj", kssj);
		model.addAttribute("jssj", jssj);
		return "yyzx/hyjy/hyjyShow";
	}

	// 根据id删除会议纪要
	@RequestMapping(value = "/deleteHyjyById.do")
	@ResponseBody
	public String deleteHyjyById(@RequestParam Integer hyjydm) {
		// new出JSONObject对象
		JSONObject jsonObject = new JSONObject();
		// 根据id删除会议纪要
		huiYiJYService.deleteHyjyById(hyjydm);
		jsonObject.put("flag", true);
		return jsonObject.toString();
	}
}
