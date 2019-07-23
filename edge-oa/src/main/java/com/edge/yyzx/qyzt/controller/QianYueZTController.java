package com.edge.yyzx.qyzt.controller;

import java.util.LinkedHashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.edge.utils.Page;
import com.edge.yyzx.qyzt.entity.QYZT_QueryVo;
import com.edge.yyzx.qyzt.entity.QianYueZT;
import com.edge.yyzx.qyzt.service.inter.QianYueZTService;
import com.google.gson.Gson;

/**
 * 签约主体逻辑控制层
 * 
 * @author NingCG
 *
 */
@Controller
@RequestMapping("qyzt")
public class QianYueZTController {
	@Resource
	private QianYueZTService qianYueZTService;

	// 分页查询签约主体
	@RequestMapping(value = "/qyztList.do")
	@ResponseBody
	public String wjgList(Integer page, QYZT_QueryVo qyzt_QueryVo) {
		// new出QueryVo查询对象
		QYZT_QueryVo vo = new QYZT_QueryVo();
		// 获得Page对象
		Page<QianYueZT> pages = new Page<QianYueZT>();
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		// 每页数
		if (vo != null) {
			pages.setPage((page - 1) * vo.getSize() + 1);
			vo.setPage((page - 1) * vo.getSize() + 1);
			vo.setStartRow((pages.getPage()));
			vo.setSize(page * 10);
			if (qyzt_QueryVo.getQyztdh() != null && qyzt_QueryVo.getQyztdh() != "") {
				vo.setQyztdh(qyzt_QueryVo.getQyztdh().trim());
			}
			if (qyzt_QueryVo.getQyztjc() != null && qyzt_QueryVo.getQyztjc() != "") {
				vo.setQyztjc(qyzt_QueryVo.getQyztjc().trim());
			}
			if (qyzt_QueryVo.getQyztmc() != null && qyzt_QueryVo.getQyztmc() != "") {
				vo.setQyztmc(qyzt_QueryVo.getQyztmc().trim());
			}
			if (qyzt_QueryVo.getQyztms() != null && qyzt_QueryVo.getQyztms() != "") {
				vo.setQyztms(qyzt_QueryVo.getQyztms().trim());
			}
		}
		// 总页数
		pages.setTotal(qianYueZTService.queryQYZTSCount(vo));
		pages.setRows(qianYueZTService.queryQYZTS(vo));
		Gson gson = new Gson();
		map.put("code", 0);
		map.put("msg", "");
		map.put("count", qianYueZTService.queryQYZTSCount(vo));
		map.put("data", pages.getRows());
		String json = gson.toJson(map);
		return json.toString();
	}

	// 跳转至签约主体新增页面
	@RequestMapping(value = "/initSaveQYZT.do")
	public String initSaveQYZT() {
		return "yyzx/qyzt/saveQyzt";
	}

	// 签约主体新增操作
	@RequestMapping(value = "/saveQyzt.do")
	public String saveQyzt(QianYueZT qyzt, Model model) {
		// 新增签约主体
		qianYueZTService.saveQYZT(qyzt);
		model.addAttribute("flag", true);
		return "yyzx/qyzt/saveQyzt";
	}

	// 根据id查询签约主体对象
	@RequestMapping(value = "/queryQYZTById.do")
	public String queryQYZTById(@RequestParam Integer qyztdm, Model model) {
		// 根据id查询签约主体对象
		QianYueZT qyzt = qianYueZTService.queryQYZTById(qyztdm);
		model.addAttribute("qyzt", qyzt);
		return "yyzx/qyzt/editQyzt";
	}

	// 编辑操作
	@RequestMapping(value = "/editQYZT.do")
	public String editQYZT(QianYueZT qyzt, Model model) {
		// 编辑签约主体
		qianYueZTService.editQYZT(qyzt);
		model.addAttribute("flag", true);
		return "yyzx/qyzt/editQyzt";
	}

	// 查看操作
	@RequestMapping(value = "/qyztdmShow.do")
	public String qyztdmShow(@RequestParam Integer qyztdm, Model model) {
		// 根据id查询签约主体对象
		QianYueZT qyzt = qianYueZTService.queryQYZTById(qyztdm);
		model.addAttribute("qyzt", qyzt);
		return "yyzx/qyzt/qyztShow";
	}

}
