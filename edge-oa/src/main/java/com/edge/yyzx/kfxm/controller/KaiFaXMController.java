package com.edge.yyzx.kfxm.controller;

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
import com.edge.yyzx.kfxm.entity.KaiFaXM;
import com.edge.yyzx.kfxm.entity.KaiFaXM_QueryVo;
import com.edge.yyzx.kfxm.entity.XMJD_DM;
import com.edge.yyzx.kfxm.entity.XMZT_DM;
import com.edge.yyzx.kfxm.service.inter.KaiFaXMService;
import com.edge.yyzx.kh.entity.KeHu;
import com.edge.yyzx.kh.service.inter.KeHuService;
import com.edge.yyzx.qyzt.entity.QianYueZT;
import com.edge.yyzx.qyzt.service.inter.QianYueZTService;
import com.google.gson.Gson;

/**
 * 开发项目控制跳转层
 * 
 * @author NingCG
 *
 */
@Controller
@RequestMapping("kfxm")
public class KaiFaXMController {
	@Resource
	private KaiFaXMService kaiFaXMService;

	@Resource
	private KeHuService keHuService;

	@Resource
	private QianYueZTService qianYueZTService;

	// 分页查询开发项目
	@RequestMapping(value = "/kfxmList.do")
	@ResponseBody
	public String kfxmList(Integer page, KaiFaXM_QueryVo kfxm_QueryVo) {
		// new出QueryVo查询对象
		KaiFaXM_QueryVo vo = new KaiFaXM_QueryVo();
		// 获得Page对象
		Page<KaiFaXM> pages = new Page<KaiFaXM>();
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		// 每页数
		if (vo != null) {
			pages.setPage((page - 1) * vo.getSize() + 1);
			vo.setPage((page - 1) * vo.getSize() + 1);
			vo.setStartRow((pages.getPage()));
			vo.setSize(page * 10);
			if (kfxm_QueryVo.getKfxm_dh() != null && kfxm_QueryVo.getKfxm_dh() != "") {
				vo.setKfxm_dh(kfxm_QueryVo.getKfxm_dh().trim());
			}
			if (kfxm_QueryVo.getKfxm_mc() != null && kfxm_QueryVo.getKfxm_mc() != "") {
				vo.setKfxm_mc(kfxm_QueryVo.getKfxm_mc().trim());
			}
			if (kfxm_QueryVo.getKfxm_xmjd() != null) {
				vo.setKfxm_xmjd(kfxm_QueryVo.getKfxm_xmjd());
			}
			if (kfxm_QueryVo.getKfxm_xmzt() != null) {
				vo.setKfxm_xmzt(kfxm_QueryVo.getKfxm_xmzt());
			}
			if (kfxm_QueryVo.getKfxm_kh() != null) {
				vo.setKfxm_kh(kfxm_QueryVo.getKfxm_kh());
			}
			if (kfxm_QueryVo.getKfxm_qyzt() != null) {
				vo.setKfxm_qyzt(kfxm_QueryVo.getKfxm_qyzt());
			}
			if (kfxm_QueryVo.getKfxm_xmms() != null && kfxm_QueryVo.getKfxm_xmms() != "") {
				vo.setKfxm_xmms(kfxm_QueryVo.getKfxm_xmms().trim());
			}
		}
		// 总页数
		pages.setTotal(kaiFaXMService.queryAllkaiFaXMCount(vo));
		pages.setRows(kaiFaXMService.queryAllkaiFaXM(vo));
		Gson gson = new Gson();
		map.put("code", 0);
		map.put("msg", "");
		map.put("count", kaiFaXMService.queryAllkaiFaXMCount(vo));
		List<KaiFaXM> rows = pages.getRows();
		for (KaiFaXM row : rows) {
			if (row.getKfxm_kh() != null) {
				KeHu kh = keHuService.queryKHById(row.getKfxm_kh());
				row.setKhmc(kh.getKhmc());
			}
			if (row.getKfxm_qyzt() != null) {
				QianYueZT qyzt = qianYueZTService.queryQYZTById(row.getKfxm_qyzt());
				row.setQyztmc(qyzt.getQyztmc());
			}
			if (row.getKfxm_xmjd() != null) {
				XMJD_DM xmjd = kaiFaXMService.queryXMJDById(row.getKfxm_xmjd());
				row.setXmjdmc(xmjd.getXmjd_mc());
			}
			if (row.getKfxm_xmzt() != null) {
				XMZT_DM xmzt = kaiFaXMService.queryXMZTById(row.getKfxm_xmzt());
				row.setXmztmc(xmzt.getXmzt_mc());
			}
		}
		map.put("data", rows);
		String json = gson.toJson(map);
		return json.toString();
	}

	// 跳转至开发项目新增页面
	@RequestMapping(value = "/initSaveKFXM.do")
	public String initSaveKFXM() {
		return "yyzx/kfxm/savekfxm";
	}

	// ajax查询所有的项目阶段
	@RequestMapping(value = "/queryAllXMJD.do")
	@ResponseBody
	public String queryAllXMJD() {
		JSONArray jsonArray = kaiFaXMService.queryAllXMJD();
		return jsonArray.toString();
	}

	// ajax查询所有的项目状态
	@RequestMapping(value = "/queryAllXMZT.do")
	@ResponseBody
	public String queryAllXMZT() {
		JSONArray jsonArray = kaiFaXMService.queryAllXMZT();
		return jsonArray.toString();
	}

	// ajax查询所有的签约主体
	@RequestMapping(value = "/queryAllQYZT.do")
	@ResponseBody
	public String queryAllQYZT() {
		JSONArray jsonArray = kaiFaXMService.queryAllQYZT();
		return jsonArray.toString();
	}

	// 新增操作
	@RequestMapping(value = "/saveKFXM.do")
	public String saveKFXM(KaiFaXM kfxm, Model model) {
		kaiFaXMService.saveKFXM(kfxm);
		model.addAttribute("flag", true);
		return "yyzx/kfxm/savekfxm";
	}

	// 跳转至编辑页面
	@RequestMapping(value = "/initEditKFXM.do")
	public String initEditKFXM(@RequestParam Integer kfxm_dm, Model model) {
		KaiFaXM kfxm = kaiFaXMService.queryKFXMById(kfxm_dm);
		model.addAttribute("kfxm", kfxm);
		return "yyzx/kfxm/editkfxm";
	}

	// 编辑操作
	@RequestMapping(value = "/editKFXM.do")
	public String editKFXM(KaiFaXM kfxm, Model model) {
		kaiFaXMService.editKFXM(kfxm);
		model.addAttribute("flag", true);
		return "yyzx/kfxm/editkfxm";
	}

	// 查看操作
	@RequestMapping(value = "/kfxmShow.do")
	public String kfxmShow(@RequestParam Integer kfxm_dm, Model model) {
		// 根据id查询开发项目
		KaiFaXM kfxm = kaiFaXMService.queryKFXMById(kfxm_dm);
		if (kfxm.getKfxm_kh() != null) {
			KeHu kh = keHuService.queryKHById(kfxm.getKfxm_kh());
			kfxm.setKhmc(kh.getKhmc());
		}
		if (kfxm.getKfxm_qyzt() != null) {
			QianYueZT qyzt = qianYueZTService.queryQYZTById(kfxm.getKfxm_qyzt());
			kfxm.setQyztmc(qyzt.getQyztmc());
		}
		if (kfxm.getKfxm_xmjd() != null) {
			XMJD_DM xmjd = kaiFaXMService.queryXMJDById(kfxm.getKfxm_xmjd());
			kfxm.setXmjdmc(xmjd.getXmjd_mc());
		}
		if (kfxm.getKfxm_xmzt() != null) {
			XMZT_DM xmzt = kaiFaXMService.queryXMZTById(kfxm.getKfxm_xmzt());
			kfxm.setXmztmc(xmzt.getXmzt_mc());
		}
		model.addAttribute("kfxm", kfxm);
		return "yyzx/kfxm/kfxmShow";
	}

	// 根据id删除开发项目
	@RequestMapping(value = "/deleteKFXMById.do")
	@ResponseBody
	public String deleteKFXMById(Integer kfxm_dm) {
		kaiFaXMService.deleteKFXMById(kfxm_dm);
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("flag", true);
		return jsonObject.toString();
	}
}
