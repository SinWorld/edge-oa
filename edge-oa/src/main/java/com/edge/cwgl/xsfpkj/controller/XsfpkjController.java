package com.edge.cwgl.xsfpkj.controller;

import java.text.DecimalFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.edge.cwgl.xsfpkj.entity.FPLB_DM;
import com.edge.cwgl.xsfpkj.entity.JXX_DM;
import com.edge.cwgl.xsfpkj.entity.XSHTKP;
import com.edge.cwgl.xsfpkj.entity.Xshtkp_QueryVo;
import com.edge.cwgl.xsfpkj.service.inter.XshtkpService;
import com.edge.projman.approveproj.entity.Foll_up_Proj;
import com.edge.projman.approveproj.service.inter.ApproveprojService;
import com.edge.projman.xshtdj.entity.XiaoShouHT;
import com.edge.projman.xshtdj.service.inter.XiaoShouHTDJService;
import com.edge.utils.Page;
import com.google.gson.Gson;

/**
 * 销售发票开具逻辑控制层
 * 
 * @author NingCG
 *
 */
@Controller
@RequestMapping(value = "xsfpkj")
public class XsfpkjController {
	@Resource
	private XshtkpService xshtkpService;
	@Resource
	private XiaoShouHTDJService xiaoShouHTDJService;
	@Resource
	private ApproveprojService approveprojService;

	@RequestMapping(value = "/initXsfpkj.do")
	public String initXsfpkj(@RequestParam Integer xshtdm, Model model) {
		XiaoShouHT xsht = xiaoShouHTDJService.queryXSHTById(xshtdm);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");// 设置日期格式
		DecimalFormat df = new DecimalFormat("#0.00");
		Foll_up_Proj xmxx = null;
		String qdrq = null;
		Double ljkpje = 0.d;
		Double jebl = 0.d;
		Double sykpje = 0.d;
		if (xsht != null) {
			// 查询所属的项目
			xmxx = approveprojService.queryXiangMuXXById(xsht.getProj_Id());
			// 格式化签订日期
			qdrq = sdf.format(xsht.getCont_Date());
			// 查询当前合同下累计的开票金额
			ljkpje = xshtkpService.queryLJKPJE(xsht.getProj_Info_Id());
			// 计算比列
			if (ljkpje == null) {
				jebl = 0.d;
				ljkpje = 0.d;
				sykpje = xsht.getCont_Amount();
			} else {
				jebl = ljkpje / xsht.getCont_Amount();
				jebl = jebl * 100;
				sykpje = xsht.getCont_Amount() - ljkpje;
			}
		}
		model.addAttribute("xsht", xsht);
		model.addAttribute("xmxx", xmxx);
		model.addAttribute("qdrq", qdrq);
		model.addAttribute("ljkpje", ljkpje);
		model.addAttribute("jebl", jebl);
		model.addAttribute("sykpje", sykpje);
		return "cwgl/xsfpkj/xsfpkjAppend";
	}

	// 加载所有的进销项
	@RequestMapping(value = "/queryAllJXX.do")
	@ResponseBody
	public String queryAllJXX() {
		JSONArray jsonArray = new JSONArray();
		List<JXX_DM> jxxs = xshtkpService.queryAllJXX();
		for (JXX_DM jxx : jxxs) {
			jsonArray.add(jxx);
		}
		return jsonArray.toString();
	}

	// 加载所有的发票类别
	@RequestMapping(value = "/queryAllFPLB.do")
	@ResponseBody
	public String queryAllFPLB() {
		JSONArray jsonArray = new JSONArray();
		List<FPLB_DM> fplbs = xshtkpService.queryAllFPLB();
		for (FPLB_DM fplb : fplbs) {
			jsonArray.add(fplb);
		}
		return jsonArray.toString();
	}

	// ajax执行保存操作(新增)
	@RequestMapping(value = "/saveXshtkp.do")
	@ResponseBody
	public String saveXshtkp(Integer xshtdm, Integer jxxdm, Integer fplb, Double fpsl, String fpbh, String kprq,
			Double kpje, Double wsje, Double sj, String djr, String bz) {
		// new出销售合同开票对象
		XSHTKP xshtkp = new XSHTKP();
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		// 设置属性
		xshtkp.setXshtkp_code(this.bianHao());
		xshtkp.setXshtkp_dm_jxx(jxxdm);
		xshtkp.setXshtkp_dm_fplb(fplb);
		xshtkp.setXshtkp_fpsl(fpsl);
		xshtkp.setXshtkp_fpbh(fpbh);
		Date date = null;
		try {
			date = formatter.parse(kprq);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		xshtkp.setXshtkp_kprq(date);
		xshtkp.setXshtkp_kpje(kpje);
		xshtkp.setXshtkp_wsje(wsje);
		xshtkp.setXshtkp_sj(sj);
		xshtkp.setXshtkp_djr(djr);
		xshtkp.setXshtkp_bz(bz);
		xshtkp.setXshtkp_xshtdm(xshtdm);
		xshtkp.setIs_kp(false);
		xshtkp.setXshtkp_lxr("阮玲玲");
		xshtkp.setXshtkp_lxdh("0551-65527816");
		xshtkpService.saveXSHTKP(xshtkp);
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("flag", true);
		return jsonObject.toString();
	}

	// 生成编号
	private String bianHao() {
		// 1.设置项目编号 编号规则为’P’+年、月、日、时、分、秒+六位随机数 如：P20190604172610123456
		// 获取当前系统时间 并获取年月日时分秒
		Calendar now = Calendar.getInstance();
		String year = String.valueOf(now.get(Calendar.YEAR));
		String month = String.valueOf(now.get(Calendar.MONTH) + 1);
		if (now.get(Calendar.MONTH) + 1 <= 9) {
			month = 0 + month;
		}
		String day = String.valueOf(now.get(Calendar.DAY_OF_MONTH));
		if (now.get(Calendar.DAY_OF_MONTH) <= 9) {
			day = 0 + day;
		}
		String Hourse = String.valueOf(now.get(Calendar.HOUR_OF_DAY));
		if (now.get(Calendar.HOUR_OF_DAY) <= 9) {
			Hourse = 0 + Hourse;
		}
		String minute = String.valueOf(now.get(Calendar.MINUTE));
		if (now.get(Calendar.MINUTE) <= 9) {
			minute = 0 + minute;
		}
		String second = String.valueOf(now.get(Calendar.SECOND));
		if (now.get(Calendar.SECOND) <= 9) {
			second = 0 + second;
		}
		// 产生六位随机数
		int a = (int) ((Math.random() * 9 + 1) * 100000);
		String x = String.valueOf(a);
		String time = year + month + day + Hourse + minute + second;
		String bh = "I" + time + x;
		return bh;
	}

	// 分页显示我的报销记录
	@RequestMapping(value = "/queryAllXshtkp.do")
	@ResponseBody
	public String queryAllReimbursement(HttpServletRequest request) {
		HttpSession session = request.getSession();
		String userName = (String) session.getAttribute("userName");
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		List<XSHTKP> xsfpkjs = xshtkpService.queryMyXSHTKP(userName);
		Gson gson = new Gson();
		map.put("code", 0);
		map.put("msg", "");
		// 遍历该集合 设置项目名称、费用类型、费用所属
		for (XSHTKP xshtkp : xsfpkjs) {
			if (xshtkp.getXshtkp_dm_jxx() != null) {
				JXX_DM jxx = xshtkpService.queryjxxById(xshtkp.getXshtkp_dm_jxx());
				xshtkp.setJxxmc(jxx.getJxx_mc());
			}
			if (xshtkp.getXshtkp_dm_fplb() != null) {
				FPLB_DM fplb = xshtkpService.queryfplbById(xshtkp.getXshtkp_dm_fplb());
				xshtkp.setFplbmc(fplb.getFplb_mc());
			}

		}
		map.put("data", xsfpkjs);
		String json = gson.toJson(map);
		return json.toString();
	}

	// ajax执行编辑操作
	@RequestMapping(value = "/editXshtkp.do")
	@ResponseBody
	public String editXshtkp(Integer xshtkp_dm, Integer xshtkp_xshtdm, Integer jxxdm, Integer fplb, Double fpsl,
			String fpbh, String kprq, Double kpje, Double wsje, Double sj, String djr, String bz) {
		// 根据xshtkp_dm查询销售合同开票对象
		XSHTKP xshtkp = xshtkpService.queryXshtkpById(xshtkp_dm);
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		xshtkp.setXshtkp_dm_jxx(jxxdm);
		xshtkp.setXshtkp_dm_fplb(fplb);
		xshtkp.setXshtkp_fpsl(fpsl);
		xshtkp.setXshtkp_fpbh(fpbh);
		Date date = null;
		try {
			date = formatter.parse(kprq);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		xshtkp.setXshtkp_kprq(date);
		xshtkp.setXshtkp_kpje(kpje);
		xshtkp.setXshtkp_wsje(wsje);
		xshtkp.setXshtkp_sj(sj);
		xshtkp.setXshtkp_djr(djr);
		xshtkp.setXshtkp_bz(bz);
		xshtkp.setXshtkp_xshtdm(xshtkp_xshtdm);
		xshtkp.setIs_kp(false);
		xshtkpService.editXshtkp(xshtkp);
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("flag", true);
		return jsonObject.toString();
	}

	// 删除操作
	@RequestMapping(value = "/deleteXshtkpById.do")
	@ResponseBody
	public String deleteXshtkpById(@RequestParam String ids) {
		JSONObject jsonObject = new JSONObject();
		// 将其转换为数组
		String[] id = ids.split(",");
		for (String xshtkpdm : id) {
			xshtkpService.deleteXshtkpById(Integer.parseInt(xshtkpdm.trim()));
		}
		jsonObject.put("flag", true);
		return jsonObject.toString();
	}

	// 提交表单 进行开票
	@RequestMapping(value = "/submitXshtkp.do")
	public String submitXshtkp(@RequestParam String xshtkpdms, Model model) {
		// 将其转换为数组
		String[] id = xshtkpdms.split(",");
		// 设置不重复标志
		String xshtkp_uuid = UUID.randomUUID().toString();
		for (String xshtfpdm : id) {
			XSHTKP xshtkp = xshtkpService.queryXshtkpById(Integer.parseInt(xshtfpdm.trim()));
			xshtkp.setXshtkp_uuid(xshtkp_uuid);
			xshtkp.setIs_kp(true);
			xshtkpService.editXshtkp(xshtkp);
		}
		model.addAttribute("flag", true);
		return "cwgl/xsfpkj/xsfpkjAppend";
	}

	// 跳转至开票列表页面
	@RequestMapping(value = "/initxshtkpList.do")
	public String initxshtkpList() {
		return "cwgl/xsfpkj/xsfpkjList";
	}

	// 分页查询开票信息
	@RequestMapping(value = "/xshtkpList.do")
	@ResponseBody
	public String xshtkpList(Integer page, Xshtkp_QueryVo Xshtkp_QueryVo, String time1, String time2) {
		// new出QueryVo查询对象
		Xshtkp_QueryVo vo = new Xshtkp_QueryVo();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");// 设置日期格式
		// 获得Page对象
		Page<XSHTKP> pages = new Page<XSHTKP>();
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		// 每页数
		if (vo != null) {
			pages.setPage((page - 1) * vo.getSize() + 1);
			vo.setPage((page - 1) * vo.getSize() + 1);
			vo.setStartRow((pages.getPage()));
			vo.setSize(page * 10);
			if (Xshtkp_QueryVo.getXshtkp_xshtdm() != null) {
				vo.setXshtkp_xshtdm(Xshtkp_QueryVo.getXshtkp_xshtdm());
			}
			if(Xshtkp_QueryVo.getXshtkp_djr()!=null&&Xshtkp_QueryVo.getXshtkp_djr()!="") {
				vo.setXshtkp_djr(Xshtkp_QueryVo.getXshtkp_djr().trim());
			}
			if (time1 != null && time1 != "") {
				// 将String类型转换为Date类型
				try {
					vo.setDate(sdf.parse(time1));
				} catch (ParseException e) {
					e.printStackTrace();
				}
			}
			if (time2 != null && time2 != "") {
				try {
					vo.setDate2(sdf.parse(time2));
				} catch (ParseException e) {
					e.printStackTrace();
				}
			}
		}
		// 总页数
		pages.setTotal(xshtkpService.queryAllXshtkpCount(vo));
		pages.setRows(xshtkpService.queryAllXshtkp(vo));
		Gson gson = new Gson();
		map.put("code", 0);
		map.put("msg", "");
		map.put("count", xshtkpService.queryAllXshtkpCount(vo));
		List<XSHTKP> rows = pages.getRows();
		// 遍历该集合 设置审批状态和提交时间
		for (XSHTKP row : rows) {
			if (row.getXshtkp_xshtdm() != null) {
				XiaoShouHT xsht = xiaoShouHTDJService.queryXSHTById(row.getXshtkp_xshtdm());
				row.setXshtmc(xsht.getProj_Name());
			}
		}
		map.put("data", pages.getRows());
		String json = gson.toJson(map);
		return json.toString();
	}

	// 点击销售合同发票开具列表跳入查看页面
	@RequestMapping(value = "/xshtkpShowByuuid.do")
	public String xshtkpShowByuuid(@RequestParam String uuid, Integer xshtdm, Model model) {
		// 根据xshtdm 查询所属销售合同
		XiaoShouHT xsht = xiaoShouHTDJService.queryXSHTById(xshtdm);
		Foll_up_Proj xmxx = null;
		Double ljkpje = 0.d;
		Double jebl = 0.d;
		Double sykpje = 0.d;
		if (xsht != null) {
			// 查询所属的项目
			xmxx = approveprojService.queryXiangMuXXById(xsht.getProj_Id());
			// 查询当前合同下累计的开票金额
			ljkpje = xshtkpService.queryLJKPJE(xsht.getProj_Info_Id());
			// 计算比列
			if (ljkpje == null) {
				jebl = 0.d;
				ljkpje = 0.d;
				sykpje = xsht.getCont_Amount();
			} else {
				jebl = ljkpje / xsht.getCont_Amount();
				jebl = jebl * 100;
				sykpje = xsht.getCont_Amount() - ljkpje;
			}
		}
		model.addAttribute("xsht", xsht);
		model.addAttribute("xmxx", xmxx);
		model.addAttribute("ljkpje", ljkpje);
		model.addAttribute("jebl", jebl);
		model.addAttribute("uuid", uuid);
		model.addAttribute("sykpje", sykpje);
		return "cwgl/xsfpkj/xsfpkjShow";
	}

	// 查看页点击列表查询开票详情
	@RequestMapping(value = "/xshtkpxq.do")
	@ResponseBody
	public String xshtkpxq(@RequestParam String uuid) {
		List<XSHTKP> xshtkps = xshtkpService.queryXshtkpByuuid(uuid);
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		Gson gson = new Gson();
		map.put("code", 0);
		map.put("msg", "");
		// 遍历该集合 设置审批状态和提交时间
		for (XSHTKP xshtkp : xshtkps) {
			if (xshtkp.getXshtkp_dm_jxx() != null) {
				JXX_DM jxx = xshtkpService.queryjxxById(xshtkp.getXshtkp_dm_jxx());
				xshtkp.setJxxmc(jxx.getJxx_mc());
			}
			if (xshtkp.getXshtkp_dm_fplb() != null) {
				FPLB_DM fplb = xshtkpService.queryfplbById(xshtkp.getXshtkp_dm_fplb());
				xshtkp.setFplbmc(fplb.getFplb_mc());
			}
		}
		map.put("data", xshtkps);
		String json = gson.toJson(map);
		return json.toString();
	}

}
