package com.edge.projman.xmssck.controller;

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
import com.edge.projman.xmssck.service.inter.XiangMuSSCKService;
import com.edge.projman.xshtdj.entity.XiaoShouHT;
import com.edge.projman.xshtdj.service.inter.XiaoShouHTDJService;
import com.edge.utils.Page;
import com.google.gson.Gson;

/**
 * 项目实施出库控制层
 * 
 * @author NingCG
 *
 */
@Controller
@RequestMapping(value = "xmssck")
public class XiangMuSSCKController {
	@Resource
	private XiangMuSSCKService xiangMuSSCKService;

	@Resource
	private XiangMuCGRKService xiangMuCGRKService;

	@Resource
	private XiaoShouHTDJService xiaoShouHTDJService;

	// 分页查询项目采购出库
	@RequestMapping(value = "/xmcgckList.do")
	@ResponseBody
	public String xmcgckList(Integer page, Xmcgrk_QueryVo xmcgrk_QueryVo) {
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
		}
		// 总页数
		pages.setTotal(xiangMuSSCKService.queryAllXmckInFoCount(xmcgrk_QueryVo));
		pages.setRows(xiangMuSSCKService.queryAllXmckInFo(vo));
		Gson gson = new Gson();
		map.put("code", 0);
		map.put("msg", "");
		map.put("count", xiangMuSSCKService.queryAllXmckInFoCount(xmcgrk_QueryVo));
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
						// 设置销售合同名称
						xmrkInFo.setXshtmc(xsht.getProj_Name());
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

	// 跳转至项目实施出库列表
	@RequestMapping(value = "/initXmssckList.do")
	public String initXmssckList() {
		return "projman/xmssck/xmssckList";
	}

	// 跳转至项目实施入库页面
	@RequestMapping(value = "initXMSSCK.do")
	public String initXMSSCK() {
		return "projman/xmssck/xmssck";
	}

	// 查询项目采购出库数据
	@RequestMapping(value = "/queryXMCKRKByXshtdm.do")
	@ResponseBody
	public String queryHWCPNRByXshtdm(@RequestParam Integer xshtdm) {
		// new 出JSONArray数组
		JSONArray jsonArray = new JSONArray();
		List<XiangMuCGRK> hwcpnrs = xiangMuSSCKService.queryXMSSCKByXSHTDM(xshtdm);
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
		for (int i = 0; i < hwdm.length; i++) {
			String id = hwdm[i];
			List<XmrkInFo> xmrkInfo = xiangMuSSCKService.queryXMCKXQById(Integer.parseInt(id.trim()));
			// 遍历入库集合
			for (XmrkInFo x : xmrkInfo) {
				// 设置数量
				x.setOldShuLiang(Integer.valueOf((int) (x.getJinE() / x.getPrice())));
				mrkInfos.add(x);
			}
		}
		model.addAttribute("list", mrkInfos);
		return "projman/xmssck/hwcpList";
	}

	// 出库
	@RequestMapping(value = "/ck.do")
	public String ck(@RequestParam String hwnrData, Model model) {
		Gson gson = new Gson();
		// 将hwdms进行字符截取
		String dms = hwnrData.substring(1, hwnrData.length());
		// 将其转换为数组
		String[] split = dms.split("&");
		// 遍历该集合
		for (int j = 0; j < split.length; j++) {
			// 将其转换为JSONObject对象
			JSONObject jsonObject = gson.fromJson(split[j].trim(), JSONObject.class);
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
			// 设置不重复标志
			String uuid = UUID.randomUUID().toString();
			// 根据项目入库出库外键查询所属的项目入库详情数据
			List<XmrkInFo> xmrkinfos = xiangMuSSCKService.queryXMSSCKXQByCKId(xmrkId);
			// 获得未出库的库存量
			// List<Integer> kcls = xiangMuSSCKService.queryXMCKCountXQById(xmrkId);
			// 若出库的数量等于库存量则表示该项目全部已出库则跟新项目采购入库出库是否出库字段
			if (cgsls == xmrkinfos.size()) {
				// 根据 项目入库id查询项目入库出库对象
				XiangMuCGRK xmcgrk = xiangMuCGRKService.queryXiangMuCGRKById(xmrkId);
				xmcgrk.setIs_ck(true);
				xiangMuSSCKService.editXMCGRKCK(xmcgrk);
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
				xmrkInFo.setIs_ck(true);
				xmrkInFo.setUuid(uuid);
				xiangMuCGRKService.editXmrkInFo(xmrkInFo);
			}
		}
		model.addAttribute("flag", true);
		return "projman/xmssck/hwcpList";
	}

	// 跳转至项目采购查看页
	@RequestMapping(value = "/xmcgckInforShow.do")
	public String xmcgckInforShow(@RequestParam Integer id, Model model) {
		// 根据id查询项目采购入库详情对象
		XmrkInFo xmrkif = xiangMuCGRKService.queryXmrkInFoByid(id);
		model.addAttribute("xmrkif", xmrkif);
		return "projman/xmssck/xmcgckShow";
	}
}
