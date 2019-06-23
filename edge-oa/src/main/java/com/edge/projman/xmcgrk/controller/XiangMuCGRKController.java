package com.edge.projman.xmcgrk.controller;

import java.util.ArrayList;
import java.util.HashMap;
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
import com.edge.projman.xmcgrk.entity.Xmcgrk_QueryVo;
import com.edge.projman.xmcgrk.service.inter.XiangMuCGRKService;
import com.edge.projman.xshtdj.entity.HuoWuInFor;
import com.edge.projman.xshtdj.entity.XiaoShouHT;
import com.edge.projman.xshtdj.service.inter.XiaoShouHTDJService;
import com.edge.system.user.entity.User;
import com.edge.utils.Page;
import com.edge.yyzx.wjg.entity.SYS_WenJianG;
import com.edge.yyzx.wjg.entity.SYS_WenJianJ;
import com.google.gson.Gson;

/**
 * 项目采购入库控制层
 * 
 * @author NingCG
 *
 */
@Controller
@RequestMapping(value = "xmcgrk")
public class XiangMuCGRKController {

	@Resource
	private XiangMuCGRKService xiangMuCGRKService;

	@Resource
	private XiaoShouHTDJService xiaoShouHTDJService;

	// 跳转至项目采购入库列表页面
	@RequestMapping(value = "/initXmcgrkList.do")
	public String initxmcgrkList() {
		return "projman/xmcgrk/xmcgrkList";
	}

	// 分页查询项目采购入库
	@RequestMapping(value = "/xmcgrkList.do")
	@ResponseBody
	public String xmcgrkList(Integer page, Xmcgrk_QueryVo xmcgrk_QueryVo) {
		// new出QueryVo查询对象
		Xmcgrk_QueryVo vo = new Xmcgrk_QueryVo();
		// 获得Page对象
		Page<HuoWuInFor> pages = new Page<HuoWuInFor>();
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		// 每页数
		if (vo != null) {
			pages.setPage((page - 1) * vo.getSize() + 1);
			vo.setPage((page - 1) * vo.getSize() + 1);
			vo.setStartRow((pages.getPage()));
			vo.setSize(page * 10);
			if (xmcgrk_QueryVo.getChanPinMC() != null && xmcgrk_QueryVo.getChanPinMC() != "") {
				vo.setChanPinMC(xmcgrk_QueryVo.getChanPinMC().trim());
			}
			if (xmcgrk_QueryVo.getPinPai() != null && xmcgrk_QueryVo.getPinPai() != "") {
				vo.setPinPai(xmcgrk_QueryVo.getPinPai().trim());
			}
			if (xmcgrk_QueryVo.getGuiGeXH() != null && xmcgrk_QueryVo.getGuiGeXH() != "") {
				vo.setGuiGeXH(xmcgrk_QueryVo.getGuiGeXH().trim());
			}
			if (xmcgrk_QueryVo.getZhuYaoPZCS() != null && xmcgrk_QueryVo.getZhuYaoPZCS() != "") {
				vo.setZhuYaoPZCS(xmcgrk_QueryVo.getZhuYaoPZCS().trim());
			}
			if (xmcgrk_QueryVo.getDanWei() != null && xmcgrk_QueryVo.getDanWei() != "") {
				vo.setDanWei(xmcgrk_QueryVo.getDanWei().trim());
			}
			if (xmcgrk_QueryVo.getShuLiang() != null) {
				vo.setShuLiang((xmcgrk_QueryVo.getShuLiang()));
			}
			if (xmcgrk_QueryVo.getPrice() != null) {
				vo.setPrice((xmcgrk_QueryVo.getPrice()));
			}
			if (xmcgrk_QueryVo.getJinE() != null) {
				vo.setJinE((xmcgrk_QueryVo.getJinE()));
			}
			if (xmcgrk_QueryVo.getProj_Info_Id() != null) {
				vo.setProj_Info_Id((xmcgrk_QueryVo.getProj_Info_Id()));
			}

		}
		// 总页数
		pages.setTotal(xiangMuCGRKService.queryAllXiangMuCGRKCount(xmcgrk_QueryVo));
		pages.setRows(xiangMuCGRKService.queryAllHWCPNR(vo));
		Gson gson = new Gson();
		map.put("code", 0);
		map.put("msg", "");
		map.put("count", xiangMuCGRKService.queryAllXiangMuCGRKCount(xmcgrk_QueryVo));
		List<HuoWuInFor> rows = pages.getRows();
		// 遍历该集合
		for (HuoWuInFor row : rows) {
			// 通过销售合同主键查询销售合同对象
			XiaoShouHT xsht = xiaoShouHTDJService.queryXSHTById(row.getProj_Info_Id());
			if (xsht != null) {
				row.setProj_Info_name(xsht.getProj_Name());// 设置销售合同名称
			}
		}
		map.put("data", pages.getRows());
		String json = gson.toJson(map);
		return json.toString();
	}

	// 跳转至入库新增页面
	@RequestMapping(value = "/initXMCGRK.do")
	public String initXMCGRK() {
		return "projman/xmcgrk/xmcgrk";
	}

	@RequestMapping(value = "/queryAllXSHT.do")
	@ResponseBody
	public String queryAllXSHT() {
		JSONArray jsonArray = xiangMuCGRKService.queryAllXSHT();
		return jsonArray.toString();
	}

	// 查询货物内容
	@RequestMapping(value = "/queryHWCPNRByXshtdm.do")
	@ResponseBody
	public String queryHWCPNRByXshtdm(@RequestParam Integer xshtdm) {
		// new 出JSONArray数组
		JSONArray jsonArray = new JSONArray();
		List<HuoWuInFor> hwcpnrs = xiangMuCGRKService.queryHWCGNRS(xshtdm);
		// 遍历该集合
		for (HuoWuInFor hwcpnr : hwcpnrs) {
			// new 出JSONObject对象
			JSONObject jsonObject = new JSONObject();
			jsonObject.put("value", hwcpnr.getHwId());
			jsonObject.put("title", hwcpnr.getChanPinMC());
			jsonArray.add(jsonObject);
		}
		return jsonArray.toString();
	}

	// 跳转至货物内容显示页面
	@RequestMapping("/hwnrShow.do")
	public String hwnrShow(@RequestParam String hwdms, Model model) {
		model.addAttribute("hwdms", hwdms);
		return "projman/xmcgrk/hwcpList";
	}

	@RequestMapping(value = "/queryHWCPNRById.do")
	@ResponseBody
	public String queryHWCPNRById(@RequestParam String hwdms) {
		List<HuoWuInFor> list = new ArrayList<HuoWuInFor>();
		// 将hwdms进行字符截取
		String dms = hwdms.substring(1, hwdms.length());
		// 将其转换为数组
		String[] hwdm = dms.split(",");
		// 遍历该集合
		for (String id : hwdm) {
			HuoWuInFor hwcp = xiangMuCGRKService.queryHWCPNRById(Integer.parseInt(id.trim()));
			list.add(hwcp);
		}
		// new 出JSONObject对象
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("code", 0);
		jsonObject.put("msg", "");
		jsonObject.put("data", list);
		return jsonObject.toString();
	}

	@RequestMapping(value = "/rk.do")
	public String rk(@RequestParam String hwdms, Model model) {
		// 将hwdms进行字符截取
		String dms = hwdms.substring(1, hwdms.length());
		// 将其转换为数组
		String[] hwdm = dms.split(",");
		// 遍历该集合
		for (String id : hwdm) {
			HuoWuInFor hwcp = xiangMuCGRKService.queryHWCPNRById(Integer.parseInt(id.trim()));
			xiangMuCGRKService.hwrk(hwcp);
		}
		model.addAttribute("flag", true);
		return "projman/xmcgrk/xmcgrk";
	}

}
