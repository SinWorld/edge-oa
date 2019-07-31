package com.edge.yyzx.shxm.controller;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.omg.PortableInterceptor.INACTIVE;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;
import com.edge.utils.Page;
import com.edge.yyzx.kh.entity.KeHu;
import com.edge.yyzx.kh.service.inter.KeHuService;
import com.edge.yyzx.qyzt.entity.QianYueZT;
import com.edge.yyzx.qyzt.service.inter.QianYueZTService;
import com.edge.yyzx.shxm.entity.ShouHouXM;
import com.edge.yyzx.shxm.entity.ShouHouXM_QueryVo;
import com.edge.yyzx.shxm.service.inter.ShouHouXMService;
import com.google.gson.Gson;

/**
 * 售后项目控制跳转层
 * 
 * @author NingCG
 *
 */
@Controller
@RequestMapping("shxm")
public class ShouHouXMController {
	@Resource
	private ShouHouXMService shouHouXMService;

	@Resource
	private KeHuService keHuService;

	@Resource
	private QianYueZTService QianYueZTService;

	// 分页查询售后项目
	@RequestMapping(value = "/shxmList.do")
	@ResponseBody
	public String shxmList(Integer page, ShouHouXM_QueryVo shxm_QueryVo) {
		// new出QueryVo查询对象
		ShouHouXM_QueryVo vo = new ShouHouXM_QueryVo();
		// 获得Page对象
		Page<ShouHouXM> pages = new Page<ShouHouXM>();
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		// 每页数
		if (vo != null) {
			pages.setPage((page - 1) * vo.getSize() + 1);
			vo.setPage((page - 1) * vo.getSize() + 1);
			vo.setStartRow((pages.getPage()));
			vo.setSize(page * 10);
			if (shxm_QueryVo.getShxm_dh() != null && shxm_QueryVo.getShxm_dh() != "") {
				vo.setShxm_dh(shxm_QueryVo.getShxm_dh().trim());
			}
			if (shxm_QueryVo.getShxm_mc() != null && shxm_QueryVo.getShxm_mc() != "") {
				vo.setShxm_mc(shxm_QueryVo.getShxm_mc().trim());
			}
			if (shxm_QueryVo.getShxm_kh() != null) {
				vo.setShxm_kh(shxm_QueryVo.getShxm_kh());
			}
			if (shxm_QueryVo.getShxm_qyzt() != null) {
				vo.setShxm_qyzt(shxm_QueryVo.getShxm_qyzt());
			}
			if (shxm_QueryVo.getShxm_ms() != null && shxm_QueryVo.getShxm_ms() != "") {
				vo.setShxm_ms(shxm_QueryVo.getShxm_ms().trim());
			}
		}
		// 总页数
		pages.setTotal(shouHouXMService.querySHXMSCount(vo));
		pages.setRows(shouHouXMService.querySHXMS(vo));
		Gson gson = new Gson();
		map.put("code", 0);
		map.put("msg", "");
		map.put("count", shouHouXMService.querySHXMSCount(vo));
		List<ShouHouXM> rows = pages.getRows();
		for (ShouHouXM row : rows) {
			if (row.getShxm_kh() != null) {
				KeHu kh = keHuService.queryKHById(row.getShxm_kh());
				row.setKhmc(kh.getKhmc());
			}
			if (row.getShxm_qyzt() != null) {
				QianYueZT qyzt = QianYueZTService.queryQYZTById(row.getShxm_qyzt());
				row.setQyztmc(qyzt.getQyztmc());
			}
		}
		map.put("data", rows);
		String json = gson.toJson(map);
		return json.toString();
	}

	// 跳转至售后项目新增页面
	@RequestMapping(value = "/initSaveSHXM.do")
	public String initSaveSHXM() {
		return "yyzx/shxm/saveshxm";
	}

	// 新增售后项目
	@RequestMapping(value = "/saveSHXM.do")
	public String saveSHXM(ShouHouXM shxm, Model model) {
		shouHouXMService.saveSHXM(shxm);
		model.addAttribute("flag", true);
		return "yyzx/shxm/saveshxm";
	}

	// 跳转至编辑页面
	@RequestMapping(value = "/initEditSHXM.do")
	public String initEditSHXM(Integer shxm_dm, Model model) {
		ShouHouXM shxm = shouHouXMService.querySHXMById(shxm_dm);
		model.addAttribute("shxm", shxm);
		return "yyzx/shxm/editshxm";
	}

	// 编辑操作
	@RequestMapping(value = "/editSHXM.do")
	public String editSHXM(ShouHouXM shxm, Model model) {
		shouHouXMService.editSHXM(shxm);
		model.addAttribute("flag", true);
		return "yyzx/shxm/editshxm";
	}

	// 查看操作
	@RequestMapping(value = "/shxmShow.do")
	public String shxmShow(@RequestParam Integer shxm_dm, Model model) {
		ShouHouXM shxm = shouHouXMService.querySHXMById(shxm_dm);
		if (shxm.getShxm_kh() != null) {
			KeHu kh = keHuService.queryKHById(shxm.getShxm_kh());
			shxm.setKhmc(kh.getKhmc());
		}
		if (shxm.getShxm_qyzt() != null) {
			QianYueZT qyzt = QianYueZTService.queryQYZTById(shxm.getShxm_qyzt());
			shxm.setQyztmc(qyzt.getQyztmc());
		}
		model.addAttribute("shxm", shxm);
		return "yyzx/shxm/shxmShow";
	}

	// 删除操作
	@RequestMapping(value = "/deleteSHXMById.do")
	@ResponseBody
	public String deleteSHXMById(Integer shxm_dm) {
		shouHouXMService.deleteSHXMById(shxm_dm);
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("flag", true);
		return jsonObject.toString();
	}

}
