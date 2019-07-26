package com.edge.yyzx.bqwh.cotroller;

import java.util.LinkedHashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.annotation.Resources;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;
import com.edge.utils.Page;
import com.edge.yyzx.bqwh.entity.BQWH_QueryVo;
import com.edge.yyzx.bqwh.entity.BiaoQianWH;
import com.edge.yyzx.bqwh.service.inter.BiaoQianWHService;
import com.google.gson.Gson;

/**
 * 标签维护逻辑控制层
 * 
 * @author NingCG
 *
 */
@Controller
@RequestMapping(value = "bqwh")
public class BiaoQianWHController {
	@Resource
	private BiaoQianWHService biaoQianWHService;

	// 分页查询签约主体
	@RequestMapping(value = "/bqwhList.do")
	@ResponseBody
	public String bqwhList(Integer page, BQWH_QueryVo bqwh_QueryVo) {
		// new出QueryVo查询对象
		BQWH_QueryVo vo = new BQWH_QueryVo();
		// 获得Page对象
		Page<BiaoQianWH> pages = new Page<BiaoQianWH>();
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		// 每页数
		if (vo != null) {
			pages.setPage((page - 1) * vo.getSize() + 1);
			vo.setPage((page - 1) * vo.getSize() + 1);
			vo.setStartRow((pages.getPage()));
			vo.setSize(page * 10);
			if (bqwh_QueryVo.getBqwhbh() != null && bqwh_QueryVo.getBqwhbh() != "") {
				vo.setBqwhbh(bqwh_QueryVo.getBqwhbh().trim());
			}
			if (bqwh_QueryVo.getBqwhdh() != null && bqwh_QueryVo.getBqwhdh() != "") {
				vo.setBqwhdh(bqwh_QueryVo.getBqwhdh().trim());
			}
			if (bqwh_QueryVo.getBqwhmc() != null && bqwh_QueryVo.getBqwhmc() != "") {
				vo.setBqwhmc(bqwh_QueryVo.getBqwhmc().trim());
			}
		}
		// 总页数
		pages.setTotal(biaoQianWHService.queryBQWHSCount(vo));
		pages.setRows(biaoQianWHService.queryBQWHS(vo));
		Gson gson = new Gson();
		map.put("code", 0);
		map.put("msg", "");
		map.put("count", biaoQianWHService.queryBQWHSCount(vo));
		map.put("data", pages.getRows());
		String json = gson.toJson(map);
		return json.toString();
	}

	// 跳转至标签维护新增页面
	@RequestMapping(value = "/initSaveBqwh.do")
	public String initSaveBqwh() {
		return "yyzx/bqwh/savebqwh";
	}

	// 新增标签维护
	@RequestMapping(value = "/saveBqwh.do")
	public String saveBqwh(BiaoQianWH bqwh, Model model) {
		biaoQianWHService.saveBqwh(bqwh);
		model.addAttribute("flag", true);
		return "yyzx/bqwh/savebqwh";
	}

	// 跳转至标签维护
	@RequestMapping(value = "/initEditBqwh.do")
	public String initEditBqwh(@RequestParam Integer bqwhdm, Model model) {
		BiaoQianWH bqwh = biaoQianWHService.queryBqwhById(bqwhdm);
		model.addAttribute("bqwh", bqwh);
		return "yyzx/bqwh/editbqwh";
	}

	// 编辑标签维护
	@RequestMapping(value = "/editBqwh.do")
	public String editBqwh(BiaoQianWH bqwh, Model model) {
		biaoQianWHService.editBqwh(bqwh);
		model.addAttribute("flag", true);
		return "yyzx/bqwh/editbqwh";
	}

	// 根据id删除标签维护对象
	@RequestMapping(value = "/deleteBqwhById.do")
	@ResponseBody
	public String deleteBqwhById(Integer bqwhdm) {
		// new出JSONObject对象
		JSONObject jsonObject = new JSONObject();
		biaoQianWHService.deleteBqwhById(bqwhdm);
		jsonObject.put("flag", true);
		return jsonObject.toString();
	}

	// 跳转至查看页
	@RequestMapping(value = "/bqwhShow.do")
	public String bqwhShow(@RequestParam Integer bqwhdm, Model model) {
		BiaoQianWH bqwh = biaoQianWHService.queryBqwhById(bqwhdm);
		model.addAttribute("bqwh", bqwh);
		return "yyzx/bqwh/bqwhShow";
	}
}
