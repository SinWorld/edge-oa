package com.edge.yyzx.kh.controller;

import java.util.LinkedHashMap;
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
import com.edge.yyzx.kh.entity.KeHu_QueryVo;
import com.edge.yyzx.kh.service.inter.KeHuService;
import com.google.gson.Gson;

/**
 * 客户逻辑控制层
 * 
 * @author NingCG
 *
 */
@Controller
@RequestMapping("kh")
public class KeHuController {
	@Resource
	private KeHuService keHuService;

	// 分页查询签约主体
	@RequestMapping(value = "/khList.do")
	@ResponseBody
	public String khList(Integer page, KeHu_QueryVo kh_QueryVo) {
		// new出QueryVo查询对象
		KeHu_QueryVo vo = new KeHu_QueryVo();
		// 获得Page对象
		Page<KeHu> pages = new Page<KeHu>();
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		// 每页数
		if (vo != null) {
			pages.setPage((page - 1) * vo.getSize() + 1);
			vo.setPage((page - 1) * vo.getSize() + 1);
			vo.setStartRow((pages.getPage()));
			vo.setSize(page * 10);
			if (kh_QueryVo.getKhdh() != null && kh_QueryVo.getKhdh() != "") {
				vo.setKhdh(kh_QueryVo.getKhdh().trim());
			}
			if (kh_QueryVo.getKhjc() != null && kh_QueryVo.getKhjc() != "") {
				vo.setKhjc(kh_QueryVo.getKhjc().trim());
			}
			if (kh_QueryVo.getKhmc() != null && kh_QueryVo.getKhmc() != "") {
				vo.setKhmc(kh_QueryVo.getKhmc().trim());
			}
			if (kh_QueryVo.getKhms() != null && kh_QueryVo.getKhms() != "") {
				vo.setKhms(kh_QueryVo.getKhms().trim());
			}
		}
		// 总页数
		pages.setTotal(keHuService.queryKHSCount(vo));
		pages.setRows(keHuService.queryKHS(vo));
		Gson gson = new Gson();
		map.put("code", 0);
		map.put("msg", "");
		map.put("count", keHuService.queryKHSCount(vo));
		map.put("data", pages.getRows());
		String json = gson.toJson(map);
		return json.toString();
	}

	// 跳转至客户新增页面
	@RequestMapping(value = "/initSaveKh.do")
	public String initSaveKh() {
		return "yyzx/kh/savekh";
	}

	// 新增客户
	@RequestMapping(value = "/saveKh.do")
	public String saveKh(KeHu kh, Model model) {
		keHuService.saveKH(kh);
		model.addAttribute("flag", true);
		return "yyzx/kh/savekh";
	}

	// 跳转至编辑页面
	@RequestMapping(value = "/initEditKh.do")
	public String initEditKh(@RequestParam Integer khdm, Model model) {
		// 根据id查询对应的客户
		KeHu kh = keHuService.queryKHById(khdm);
		model.addAttribute("kh", kh);
		return "yyzx/kh/editkh";
	}

	// 编辑客户
	@RequestMapping(value = "/editKh.do")
	public String editKh(KeHu kh, Model model) {
		keHuService.editKH(kh);
		model.addAttribute("flag", true);
		return "yyzx/kh/editkh";
	}

	// 查看
	@RequestMapping(value = "/khShowById.do")
	public String khShowById(@RequestParam Integer khdm, Model model) {
		// 根据id查询对应的客户
		KeHu kh = keHuService.queryKHById(khdm);
		model.addAttribute("kh", kh);
		return "yyzx/kh/khShow";
	}

	// 根据id删除客户
	@RequestMapping(value = "/deleteKhById.do")
	@ResponseBody
	public String deleteKhById(Integer khdm) {
		// new出JSONObject对象
		JSONObject jsonObject = new JSONObject();
		keHuService.deletKhById(khdm);
		jsonObject.put("flag", true);
		return jsonObject.toString();
	}
}
