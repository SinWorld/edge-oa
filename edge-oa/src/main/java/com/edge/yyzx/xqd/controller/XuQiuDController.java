package com.edge.yyzx.xqd.controller;

import java.text.ParseException;
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
import com.edge.system.user.entity.User;
import com.edge.system.user.service.inter.UserService;
import com.edge.utils.Page;
import com.edge.yyzx.kfxm.entity.XMJD_DM;
import com.edge.yyzx.kfxm.entity.XMZT_DM;
import com.edge.yyzx.kfxm.service.inter.KaiFaXMService;
import com.edge.yyzx.kh.entity.KeHu;
import com.edge.yyzx.kh.service.inter.KeHuService;
import com.edge.yyzx.khxt.entity.KeHuXT;
import com.edge.yyzx.khxt.service.inter.KeHuXTService;
import com.edge.yyzx.sxwd.entity.Sxwd_DM_WTLX;
import com.edge.yyzx.sxwd.service.inter.ShangXianWdService;
import com.edge.yyzx.xmxx.entity.XiangMuXX;
import com.edge.yyzx.xmxx.service.inter.XiangMuXXService;
import com.edge.yyzx.xqd.entity.XuQiuD;
import com.edge.yyzx.xqd.entity.XuQiuD_QueryVo;
import com.edge.yyzx.xqd.service.inter.XuQiuDService;
import com.google.gson.Gson;

/**
 * 需求单逻辑控制层
 * 
 * @author NingCG
 *
 */
@Controller
@RequestMapping("xqd")
public class XuQiuDController {
	@Resource
	private XuQiuDService xuQiuDService;

	@Resource
	private XiangMuXXService xiangMuXXService;

	@Resource
	private KeHuXTService keHuXTService;

	@Resource
	private ShangXianWdService shangXianWdService;

	@Resource
	private UserService userService;

	@Resource
	private KeHuService keHuService;

	@Resource
	private KaiFaXMService KaiFaXMService;

	// 分页查询上线文档
	@RequestMapping(value = "/xqdList.do")
	@ResponseBody
	public String xqdList(Integer page, XuQiuD_QueryVo xqd_QueryVo, String time1, String time2) {
		// new出QueryVo查询对象
		XuQiuD_QueryVo vo = new XuQiuD_QueryVo();
		// 获得Page对象
		Page<XuQiuD> pages = new Page<XuQiuD>();
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");// 设置日期格式
		// 每页数
		if (vo != null) {
			pages.setPage((page - 1) * vo.getSize() + 1);
			vo.setPage((page - 1) * vo.getSize() + 1);
			vo.setStartRow((pages.getPage()));
			vo.setSize(page * 10);
			if (xqd_QueryVo.getXqd_dh() != null && xqd_QueryVo.getXqd_dh() != "") {
				vo.setXqd_dh(xqd_QueryVo.getXqd_dh().trim());
			}
			if (xqd_QueryVo.getXqd_mc() != null && xqd_QueryVo.getXqd_mc() != "") {
				vo.setXqd_mc(xqd_QueryVo.getXqd_mc().trim());
			}
			if (xqd_QueryVo.getXqd_xmxx() != null) {
				vo.setXqd_xmxx(xqd_QueryVo.getXqd_xmxx());
			}
			if (xqd_QueryVo.getXqd_ssxt() != null) {
				vo.setXqd_ssxt(xqd_QueryVo.getXqd_ssxt());
			}
			if (xqd_QueryVo.getXqd_xqlx() != null) {
				vo.setXqd_xqlx(xqd_QueryVo.getXqd_xqlx());
			}
			if (xqd_QueryVo.getXqd_fzr() != null) {
				vo.setXqd_fzr(xqd_QueryVo.getXqd_fzr());
			}
			if (xqd_QueryVo.getXqd_kh() != null) {
				vo.setXqd_kh(xqd_QueryVo.getXqd_kh());
			}
			if (xqd_QueryVo.getXqd_xqjd() != null) {
				vo.setXqd_xqjd(xqd_QueryVo.getXqd_xqjd());
			}
			if (xqd_QueryVo.getXqd_xqzt() != null) {
				vo.setXqd_xqzt(xqd_QueryVo.getXqd_xqzt());
			}
			if (time1 != null && time1 != "") {
				// 将String类型转换为Date类型
				try {
					vo.setBeginTime1(sdf.parse(time1));
				} catch (ParseException e) {
					e.printStackTrace();
				}
			}
			if (time2 != null && time2 != "") {
				// 将String类型转换为Date类型
				try {
					vo.setBeginTime2(sdf.parse(time2));
				} catch (ParseException e) {
					e.printStackTrace();
				}
			}
		}
		// 总页数
		pages.setTotal(xuQiuDService.queryXQDSCount(vo));
		pages.setRows(xuQiuDService.queryXQDS(vo));
		Gson gson = new Gson();
		map.put("code", 0);
		map.put("msg", "");
		map.put("count", xuQiuDService.queryXQDSCount(vo));
		List<XuQiuD> rows = pages.getRows();
		for (XuQiuD row : rows) {
			// 设置项目信息
			if (row.getXqd_xmxx() != null) {
				XiangMuXX xmxx = xiangMuXXService.queryXMXXById(row.getXqd_xmxx());
				row.setXmxxmc(xmxx.getXmxx_mc());
			}
			// 设置所属系统
			if (row.getXqd_ssxt() != null) {
				KeHuXT khxt = keHuXTService.queryKHXTById(row.getXqd_ssxt());
				row.setSsxtmc(khxt.getKhxt_mc());
			}
			// 设置需求类型
			if (row.getXqd_xqlx() != null) {
				Sxwd_DM_WTLX wtlx = shangXianWdService.queryWtlxById(row.getXqd_xqlx());
				row.setXqlxmc(wtlx.getWtlx_mc());
			}
			// 设置负责人
			if (row.getXqd_fzr() != null) {
				User user = userService.queryUserById(row.getXqd_fzr());
				row.setFzrmc(user.getUser_name());
			}
			// 设置客户
			if (row.getXqd_kh() != null) {
				KeHu kh = keHuService.queryKHById(row.getXqd_kh());
				row.setKhmc(kh.getKhmc());
			}
			// 需求阶段
			if (row.getXqd_xqjd() != null) {
				XMJD_DM xmjd = KaiFaXMService.queryXMJDById(row.getXqd_xqjd());
				row.setXqjdmc(xmjd.getXmjd_mc());
			}
			// 需求状态
			if (row.getXqd_xqzt() != null) {
				XMZT_DM xmzt = KaiFaXMService.queryXMZTById(row.getXqd_xqzt());
				row.setXqztmc(xmzt.getXmzt_mc());
			}
		}
		map.put("data", rows);
		String json = gson.toJson(map);
		return json.toString();
	}

	// 跳转至需求单新增页面
	@RequestMapping(value = "/initSaveXQD.do")
	public String initSaveXQD() {
		return "yyzx/xqd/savexqd";
	}

	// 查询所有的项目信息
	@RequestMapping(value = "/queryAllXMXX.do")
	@ResponseBody
	public String queryAllXMXX() {
		JSONArray jsonArray = xuQiuDService.queryAllXMXX();
		return jsonArray.toString();
	}

	// 查询所有的客户系统
	@RequestMapping(value = "/queryAllKHXT.do")
	@ResponseBody
	public String queryAllKHXT() {
		JSONArray jsonArray = xuQiuDService.queryAllKHXT();
		return jsonArray.toString();
	}

	// 查询所有的问题类型
	@RequestMapping(value = "/queryAllWTLX.do")
	@ResponseBody
	public String queryAllWTLX() {
		JSONArray jsonArray = xuQiuDService.queryAllWTLX();
		return jsonArray.toString();
	}

	// 新增需求单
	@RequestMapping(value = "/saveXQD.do")
	public String saveXQD(XuQiuD xqd, Model model) {
		xuQiuDService.savexqd(xqd);
		model.addAttribute("flag", true);
		return "yyzx/xqd/savexqd";
	}

	// 跳转至编辑页面
	@RequestMapping(value = "/initEditXQD.do")
	public String initEditXQD(@RequestParam Integer xqd_dm, Model model) {
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		// 根据id查询对应的需求单对象
		XuQiuD xqd = xuQiuDService.queryXQdById(xqd_dm);
		// 设置日期
		if (xqd != null) {
			xqd.setTcrq(formatter.format(xqd.getXqd_tcrq()));
			xqd.setJhksrq(formatter.format(xqd.getXqd_jhksrq()));
			xqd.setJhjsrq(formatter.format(xqd.getXqd_jhjsrq()));
			xqd.setSsrq(formatter.format(xqd.getXqd_ssrq()));
			xqd.setYsrq(formatter.format(xqd.getXqd_ysrq()));
		}
		model.addAttribute("xqd", xqd);
		return "yyzx/xqd/editxqd";
	}

	// 编辑操作
	@RequestMapping(value = "/editXQD.do")
	public String editXQD(XuQiuD xqd, Model model) {
		xuQiuDService.editxqd(xqd);
		model.addAttribute("flag", true);
		return "yyzx/xqd/editxqd";
	}

	// 跳转至查看页
	@RequestMapping(value = "/xqdShow.do")
	public String xqdShow(@RequestParam Integer xqd_dm, Model model) {
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		// 根据id查询对应的需求单对象
		XuQiuD xqd = xuQiuDService.queryXQdById(xqd_dm);
		// 设置日期
		if (xqd != null) {
			xqd.setTcrq(formatter.format(xqd.getXqd_tcrq()));
			xqd.setJhksrq(formatter.format(xqd.getXqd_jhksrq()));
			xqd.setJhjsrq(formatter.format(xqd.getXqd_jhjsrq()));
			xqd.setSsrq(formatter.format(xqd.getXqd_ssrq()));
			xqd.setYsrq(formatter.format(xqd.getXqd_ysrq()));
			// 设置项目信息
			XiangMuXX xmxx = xiangMuXXService.queryXMXXById(xqd.getXqd_xmxx());
			xqd.setXmxxmc(xmxx.getXmxx_mc());
			// 设置所属系统
			KeHuXT khxt = keHuXTService.queryKHXTById(xqd.getXqd_ssxt());
			xqd.setSsxtmc(khxt.getKhxt_mc());
			// 设置需求类型
			Sxwd_DM_WTLX wtlx = shangXianWdService.queryWtlxById(xqd.getXqd_xqlx());
			xqd.setXqlxmc(wtlx.getWtlx_mc());
			// 设置负责人
			User user = userService.queryUserById(xqd.getXqd_fzr());
			xqd.setFzrmc(user.getUser_name());
			// 设置客户
			KeHu kh = keHuService.queryKHById(xqd.getXqd_kh());
			xqd.setKhmc(kh.getKhmc());
			// 需求阶段
			XMJD_DM xmjd = KaiFaXMService.queryXMJDById(xqd.getXqd_xqjd());
			xqd.setXqjdmc(xmjd.getXmjd_mc());
			// 需求状态
			XMZT_DM xmzt = KaiFaXMService.queryXMZTById(xqd.getXqd_xqzt());
			xqd.setXqztmc(xmzt.getXmzt_mc());
		}
		model.addAttribute("xqd", xqd);
		return "yyzx/xqd/xqdShow";
	}

	// 删除操作
	@RequestMapping(value = "/deleteXqd.do")
	@ResponseBody
	public String deleteXqd(Integer xqd_dm) {
		JSONObject jsonObject = new JSONObject();
		xuQiuDService.deletexqdById(xqd_dm);
		jsonObject.put("flag", true);
		return jsonObject.toString();
	}

}
