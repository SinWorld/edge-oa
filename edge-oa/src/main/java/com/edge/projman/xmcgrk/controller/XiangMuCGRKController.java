package com.edge.projman.xmcgrk.controller;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.edge.projman.xmcgrk.entity.XiangMuCGRK;
import com.edge.projman.xmcgrk.entity.Xmcgrk_QueryVo;
import com.edge.projman.xmcgrk.entity.XmrkInFo;
import com.edge.projman.xmcgrk.service.inter.XiangMuCGRKService;
import com.edge.projman.xshtdj.entity.XiaoShouHT;
import com.edge.projman.xshtdj.service.inter.XiaoShouHTDJService;
import com.edge.utils.Page;
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
	public String xmcgrkList(Integer page, Xmcgrk_QueryVo xmcgrk_QueryVo,Double jinE1, Double jinE2) {
		// new出QueryVo查询对象
		Xmcgrk_QueryVo vo = new Xmcgrk_QueryVo();
		// 获得Page对象
		Page<XmrkInFo> pages = new Page<XmrkInFo>();
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		// new出List集合用于存储结果集
		List<XmrkInFo> results = new ArrayList<XmrkInFo>();
		// 每页数
		if (vo != null) {
			pages.setPage((page - 1) * vo.getSize() + 1);
			vo.setPage((page - 1) * vo.getSize() + 1);
			vo.setStartRow((pages.getPage()));
			vo.setSize(page * 10);
			if(xmcgrk_QueryVo.getProj_Info_Id()!=null) {
				//根据销售合同代码查询项目入库出库主键
				List<XiangMuCGRK> XiangMuCGRKS = xiangMuCGRKService.queryXMCGRKORCKByXSHTDM(xmcgrk_QueryVo.getProj_Info_Id());
				if(XiangMuCGRKS.size()>0) {
					vo.setProj_Info_Id(XiangMuCGRKS.get(0).getHwId());
					xmcgrk_QueryVo.setProj_Info_Id(XiangMuCGRKS.get(0).getHwId());
				}
			}
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
			if (xmcgrk_QueryVo.getPrice() != null) {
				vo.setPrice((xmcgrk_QueryVo.getPrice()));
			}
			if(jinE1!=null) {
				vo.setJinE1(jinE1);
			}
			if(jinE2!=null) {
				vo.setJinE2(jinE2);
			}
		}
		// 总页数
		pages.setTotal(xiangMuCGRKService.queryAllXmrkInFoCount(xmcgrk_QueryVo));
		pages.setRows(xiangMuCGRKService.queryAllXmrkInFo(vo));
		Gson gson = new Gson();
		map.put("code", 0);
		map.put("msg", "");
		map.put("count", xiangMuCGRKService.queryAllXmrkInFoCount(xmcgrk_QueryVo));
		List<XmrkInFo> rows = pages.getRows();
		// 遍历不重复的uuid集合
		List<String> uuids = xiangMuCGRKService.queryUUId();
		for (String u : uuids) {
			// 根据uuid值去查询结果集获得结果对象
			for (int i = 0; i < rows.size(); i++) {
				// 获得XmrkInFo对象
				XmrkInFo xmrkInFo = rows.get(i);
				if (u.equals(xmrkInFo.getUuid())) {
					xmrkInFo.setOldShuLiang(Integer.valueOf((int) (xmrkInFo.getJinE() / xmrkInFo.getPrice())));
					XiangMuCGRK xmcgrk = xiangMuCGRKService.queryXiangMuCGRKById(xmrkInFo.getXmrkorCkId());
					// 取得xmcgrk中的销售合同代码 查询销售合同对象
					XiaoShouHT xsht = xiaoShouHTDJService.queryXSHTById(xmcgrk.getProj_Info_Id());
					if (xsht != null) {
						xmrkInFo.setXshtmc(xsht.getProj_Name());
						;// 设置销售合同名称
					}
					results.add(xmrkInFo);
					break;
				}
			}
		}
		// 对results集合进行排序
		Collections.sort(results, new Comparator<XmrkInFo>() {
			public int compare(XmrkInFo x1, XmrkInFo x2) {
				// 按照XmrkInFo的年龄进行降序排列
				if (x1.getRkInfoId() > x2.getRkInfoId()) {
					return -1;
				}
				if (x1.getRkInfoId() == x2.getRkInfoId()) {
					return 0;
				}
				return 1;
			}
		});
		map.put("data", results);
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

	// 查询项目采购入库数据
	@RequestMapping(value = "/queryXMCKRKByXshtdm.do")
	@ResponseBody
	public String queryHWCPNRByXshtdm(@RequestParam Integer xshtdm) {
		// new 出JSONArray数组
		JSONArray jsonArray = new JSONArray();
		List<XiangMuCGRK> hwcpnrs = xiangMuCGRKService.queryXMCGRKByXSHTDM(xshtdm);
		// 遍历该集合
		for (XiangMuCGRK hwcpnr : hwcpnrs) {
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
		// new 出list集合用于存储所有的项目采购入库下的项目入库详情数据
		List<XmrkInFo> mrkInfos = new ArrayList<XmrkInFo>();
		// 将hwdms进行字符截取
		String dms = hwdms.substring(1, hwdms.length());
		// 将其转换为数组
		String[] hwdm = dms.split(",");
		// 遍历该集合
		for (String id : hwdm) {
			XmrkInFo xmrkInfo = xiangMuCGRKService.queryXMRKXQById(Integer.parseInt(id.trim()));
			Integer cgsl = xiangMuCGRKService.queryXMRKCountXQById(Integer.parseInt(id.trim()));
			// 设置金额
			xmrkInfo.setJinE(cgsl * xmrkInfo.getPrice());
			// 设置数量
			xmrkInfo.setOldShuLiang(cgsl);
			mrkInfos.add(xmrkInfo);
		}
		model.addAttribute("list", mrkInfos);
		return "projman/xmcgrk/hwcpList";
	}

	// 验证货物入库填写的入库数量
	@RequestMapping(value = "/yzsl.do")
	@ResponseBody
	public String yzsl(@RequestParam Integer xmrkorCkId) {
		// new出JSONObject对象
		JSONObject jsonObject = new JSONObject();
		Integer cgsl = xiangMuCGRKService.queryXMRKCountXQById(xmrkorCkId);
		jsonObject.put("cgsl", cgsl);
		return jsonObject.toString();
	}

	// 入库
	@RequestMapping(value = "/rk.do")
	public String rk(@RequestParam String hwnrData, Model model) {
		Gson gson = new Gson();
		// 将hwdms进行字符截取
		String dms = hwnrData.substring(1, hwnrData.length());
		// 将其转换为数组
		String[] split = dms.split("&");
		// 遍历该集合
		for (String s : split) {
			// 将其转换为JSONObject对象
			JSONObject jsonObject = gson.fromJson(s.trim(), JSONObject.class);
			Double id = (Double) jsonObject.get("xmrkId");
			Integer xmrkId = Integer.valueOf(id.intValue());// 项目入库出库外键
			String cpmc = (String) jsonObject.get("cpmc");// 产品名称
			String pp = (String) jsonObject.get("pp");// 品牌
			String ggxh = (String) jsonObject.get("ggxh");// 规格型号
			String zypzcs = (String) jsonObject.get("zypzcs");// 主要配置参数
			String dw = (String) jsonObject.get("dw");// 单位
			Double cgsl = (Double) jsonObject.get("cgsl");
			Integer cgsls = Integer.valueOf(cgsl.intValue());// 入库数量
			Double dj = (Double) jsonObject.get("dj");// 单价
			Double je = (Double) jsonObject.get("je");// 金额
			String cgs = (String) jsonObject.get("cgs");// 采购商
			String bz = (String) jsonObject.get("bz");// 备注
			// 设置不重复标志
			String uuid = UUID.randomUUID().toString();
			// 根据项目入库出库外键查询所属的项目入库详情数据
			List<XmrkInFo> xmrkinfos = xiangMuCGRKService.queryXMCGRKXQByRKId(xmrkId);
			// 获得未入库的库存量
			Integer kcl = xiangMuCGRKService.queryXMRKCountXQById(xmrkId);
			// 若入库的数量等于库存量则表示该项目全部已入库则跟新项目采购入库出库是否入库字段
			if (kcl == cgsls) {
				// 根据 项目入库id查询项目入库出库对象
				XiangMuCGRK xmcgrk = xiangMuCGRKService.queryXiangMuCGRKById(xmrkId);
				xmcgrk.setIs_rk(true);
				xiangMuCGRKService.editXMCGRKRK(xmcgrk);
			}
			// 遍历该集合
			for (int i = 0; i < cgsls; i++) {
				// 为集合中的属性赋值
				XmrkInFo xmrkInFo = xmrkinfos.get(i);
				xmrkInFo.setChanPinMC(cpmc);
				xmrkInFo.setPinPai(pp);
				xmrkInFo.setGuiGeXH(ggxh);
				xmrkInFo.setZhuYaoPZCS(zypzcs);
				xmrkInFo.setDanWei(dw);
				xmrkInFo.setPrice(dj);
				xmrkInFo.setJinE(je);
				xmrkInFo.setBuyer(cgs);
				xmrkInFo.setBz(bz);
				xmrkInFo.setIs_rk(true);
				xmrkInFo.setUuid(uuid);
				xiangMuCGRKService.editXmrkInFo(xmrkInFo);
			}
		}
		model.addAttribute("flag", true);
		return "projman/xmcgrk/hwcpList";
	}

	// 跳转至项目采购查看页
	@RequestMapping(value = "/xmcgrkInforShow.do")
	public String xmcgrkInforShow(@RequestParam Integer id, Model model) {
		// 根据id查询项目采购入库详情对象
		XmrkInFo xmrkif = xiangMuCGRKService.queryXmrkInFoByid(id);
		model.addAttribute("xmrkif", xmrkif);
		return "projman/xmcgrk/xmcgrkShow";
	}
}
