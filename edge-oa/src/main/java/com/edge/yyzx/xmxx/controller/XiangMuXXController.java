package com.edge.yyzx.xmxx.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;
import com.edge.system.user.entity.User;
import com.edge.system.user.service.inter.UserService;
import com.edge.utils.Page;
import com.edge.yyzx.kh.entity.KeHu;
import com.edge.yyzx.kh.service.inter.KeHuService;
import com.edge.yyzx.xmxx.entity.XiangMuXX;
import com.edge.yyzx.xmxx.entity.XiangMuXX_QueryVo;
import com.edge.yyzx.xmxx.service.inter.XiangMuXXService;
import com.google.gson.Gson;

/**
 * 项目信息控制跳转层
 * 
 * @author NingCG
 *
 */
@Controller
@RequestMapping("xmxx")
public class XiangMuXXController {
	@Resource
	private XiangMuXXService xiangMuXXService;
	@Resource
	private KeHuService keHuService;
	@Resource
	private UserService userService;

	// 分页查询项目信息
	@RequestMapping(value = "/xmxxList.do")
	@ResponseBody
	public String xmxxList(Integer page, XiangMuXX_QueryVo xmxx_QueryVo, Double jinE1, Double jinE2, String time1,
			String time2) {
		// new出QueryVo查询对象
		XiangMuXX_QueryVo vo = new XiangMuXX_QueryVo();
		// 获得Page对象
		Page<XiangMuXX> pages = new Page<XiangMuXX>();
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		Date date = null;
		// 每页数
		if (vo != null) {
			pages.setPage((page - 1) * vo.getSize() + 1);
			vo.setPage((page - 1) * vo.getSize() + 1);
			vo.setStartRow((pages.getPage()));
			vo.setSize(page * 10);
			if (xmxx_QueryVo.getXmxx_ysbh() != null && xmxx_QueryVo.getXmxx_ysbh() != "") {
				vo.setXmxx_ysbh(xmxx_QueryVo.getXmxx_ysbh().trim());
			}
			if (xmxx_QueryVo.getXmxx_dh() != null && xmxx_QueryVo.getXmxx_dh() != "") {
				vo.setXmxx_dh(xmxx_QueryVo.getXmxx_dh().trim());
			}
			if (xmxx_QueryVo.getXmxx_mc() != null && xmxx_QueryVo.getXmxx_mc() != "") {
				vo.setXmxx_mc(xmxx_QueryVo.getXmxx_mc().trim());
			}
			if (xmxx_QueryVo.getXmxx_kh() != null) {
				vo.setXmxx_kh(xmxx_QueryVo.getXmxx_kh());
			}
			if (xmxx_QueryVo.getXmxx_khbm() != null && xmxx_QueryVo.getXmxx_khbm() != "") {
				vo.setXmxx_khbm(xmxx_QueryVo.getXmxx_khbm().trim());
			}
			if (jinE1 != null) {
				vo.setXmje1(jinE1);
			}
			if (jinE2 != null) {
				vo.setXmje2(jinE2);
			}
			if (time1 != null && time1 != "") {
				try {
					vo.setTcrq1(formatter.parse(time1));// 提出日期
				} catch (ParseException e) {
					e.printStackTrace();
				}
			}
			if (time2 != null && time2 != "") {
				try {
					vo.setTcrq2(formatter.parse(time2));// 提出日期
				} catch (ParseException e) {
					e.printStackTrace();
				}
			}
			if (xmxx_QueryVo.getXmxx_fzr() != null) {
				vo.setXmxx_fzr(xmxx_QueryVo.getXmxx_fzr());
			}
		}
		// 总页数
		pages.setTotal(xiangMuXXService.queryAllxiangMuXXCount(vo));
		pages.setRows(xiangMuXXService.queryAllxiangMuXX(vo));
		Gson gson = new Gson();
		map.put("code", 0);
		map.put("msg", "");
		map.put("count", xiangMuXXService.queryAllxiangMuXXCount(vo));
		List<XiangMuXX> rows = pages.getRows();
		for (XiangMuXX row : rows) {
			if (row.getXmxx_kh() != null) {
				KeHu kh = keHuService.queryKHById(row.getXmxx_kh());
				row.setXmxx_khmc(kh.getKhmc());
			}
			if (row.getXmxx_fzr() != null) {
				User user = userService.queryUserById(row.getXmxx_fzr());
				row.setXmxx_fzrmc(user.getUser_name());
			}
		}
		map.put("data", pages.getRows());
		String json = gson.toJson(map);
		return json.toString();
	}

	// 跳转至项目信息新增页面
	@RequestMapping(value = "/initSaveXMXX.do")
	public String initSaveXMXX() {
		return "yyzx/xmxx/savexmxx";
	}

	// 新增项目信息
	@RequestMapping(value = "/saveXMXX.do")
	public String saveXMXX(XiangMuXX xmxx, Model model) {
		xiangMuXXService.saveXiangMuXX(xmxx);
		model.addAttribute("flag", true);
		return "yyzx/xmxx/savexmxx";
	}

	// 跳转至编辑页面
	@RequestMapping(value = "/initEditXMXX.do")
	public String initEditXMXX(@RequestParam Integer xmxx_dm, Model model) {
		// 根据id查询对应的项目信息对象
		XiangMuXX xmxx = xiangMuXXService.queryXMXXById(xmxx_dm);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");// 设置日期格式
		if (xmxx.getXmxx_jhkssj() != null) {
			xmxx.setJhkssj(sdf.format(xmxx.getXmxx_jhkssj()));
		}

		if (xmxx.getXmxx_jhjssj() != null) {
			xmxx.setJhjssj(sdf.format(xmxx.getXmxx_jhjssj()));
		}

		if (xmxx.getXmxx_tcrq() != null) {
			xmxx.setTcrq(sdf.format(xmxx.getXmxx_tcrq()));
		}

		model.addAttribute("xmxx", xmxx);
		return "yyzx/xmxx/editxmxx";
	}

	// 编辑项目信息
	@RequestMapping(value = "/editXMXX.do")
	public String editXMXX(XiangMuXX xmxx, Model model) {
		xiangMuXXService.editXiangMuXX(xmxx);
		model.addAttribute("flag", true);
		return "yyzx/xmxx/editxmxx";
	}

	// 查看操作
	@RequestMapping(value = "/xmxxShow.do")
	public String xmxxShow(@RequestParam Integer xmxx_dm, Model model) {
		// 根据id查询对应的项目信息对象
		XiangMuXX xmxx = xiangMuXXService.queryXMXXById(xmxx_dm);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");// 设置日期格式
		if (xmxx.getXmxx_jhkssj() != null) {
			xmxx.setJhkssj(sdf.format(xmxx.getXmxx_jhkssj()));
		}

		if (xmxx.getXmxx_jhjssj() != null) {
			xmxx.setJhjssj(sdf.format(xmxx.getXmxx_jhjssj()));
		}

		if (xmxx.getXmxx_tcrq() != null) {
			xmxx.setTcrq(sdf.format(xmxx.getXmxx_tcrq()));
		}
		if (xmxx.getXmxx_kh() != null) {
			KeHu kh = keHuService.queryKHById(xmxx.getXmxx_kh());
			xmxx.setXmxx_khmc(kh.getKhmc());
		}
		if (xmxx.getXmxx_fzr() != null) {
			User user = userService.queryUserById(xmxx.getXmxx_fzr());
			xmxx.setXmxx_fzrmc(user.getUser_name());
		}
		model.addAttribute("xmxx", xmxx);
		return "yyzx/xmxx/xmxxShow";
	}

	// 根据id删除项目信息
	@RequestMapping(value = "/deleteXMXXById.do")
	@ResponseBody
	public String deleteXMXXById(Integer xmxx_dm) {
		xiangMuXXService.deleteXiangMuXXById(xmxx_dm);
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("flag", true);
		return jsonObject.toString();
	}
}
