package com.edge.yyzx.sxwd.controller;

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
import com.edge.system.user.entity.User;
import com.edge.system.user.service.inter.UserService;
import com.edge.utils.Page;
import com.edge.yyzx.kh.entity.KeHu;
import com.edge.yyzx.kh.service.inter.KeHuService;
import com.edge.yyzx.sxwd.entity.ShangXianWD;
import com.edge.yyzx.sxwd.entity.ShangXianWD_QueryVo;
import com.edge.yyzx.sxwd.entity.Sxwd_DM_WTLX;
import com.edge.yyzx.sxwd.service.inter.ShangXianWdService;
import com.google.gson.Gson;

/**
 * 上线文档逻辑控制层
 * 
 * @author NingCG
 *
 */
@Controller
@RequestMapping("sxwd")
public class ShangXianWdController {
	@Resource
	private ShangXianWdService shangXianWdService;

	@Resource
	private UserService userService;

	@Resource
	private KeHuService khService;

	// 分页查询上线文档
	@RequestMapping(value = "/sxwdList.do")
	@ResponseBody
	public String sxwdList(Integer page, ShangXianWD_QueryVo sxwd_QueryVo, String time1, String time2) {
		// new出QueryVo查询对象
		ShangXianWD_QueryVo vo = new ShangXianWD_QueryVo();
		// 获得Page对象
		Page<ShangXianWD> pages = new Page<ShangXianWD>();
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");// 设置日期格式
		// 每页数
		if (vo != null) {
			pages.setPage((page - 1) * vo.getSize() + 1);
			vo.setPage((page - 1) * vo.getSize() + 1);
			vo.setStartRow((pages.getPage()));
			vo.setSize(page * 10);
			if (sxwd_QueryVo.getSxwd_bh() != null && sxwd_QueryVo.getSxwd_bh() != "") {
				vo.setSxwd_bh(sxwd_QueryVo.getSxwd_bh().trim());
			}
			if (sxwd_QueryVo.getSxwd_wtlx() != null) {
				vo.setSxwd_wtlx(sxwd_QueryVo.getSxwd_wtlx());
			}
			if (sxwd_QueryVo.getSxwd_bcgxnr() != null && sxwd_QueryVo.getSxwd_bcgxnr() != "") {
				vo.setSxwd_bcgxnr(sxwd_QueryVo.getSxwd_bcgxnr().trim());
			}
			if (sxwd_QueryVo.getSxwd_xt() != null && sxwd_QueryVo.getSxwd_xt() != "") {
				vo.setSxwd_xt(sxwd_QueryVo.getSxwd_xt().trim());
			}
			if (sxwd_QueryVo.getSxwd_fz() != null && sxwd_QueryVo.getSxwd_fz() != "") {
				vo.setSxwd_fz(sxwd_QueryVo.getSxwd_fz().trim());
			}
			if (sxwd_QueryVo.getSxwd_git() != null && sxwd_QueryVo.getSxwd_git() != "") {
				vo.setSxwd_git(sxwd_QueryVo.getSxwd_git().trim());
			}
			if (sxwd_QueryVo.getSxwd_kfry() != null) {
				vo.setSxwd_kfry(sxwd_QueryVo.getSxwd_kfry());
			}
			if (sxwd_QueryVo.getSxwd_kfysry() != null) {
				vo.setSxwd_kfysry(sxwd_QueryVo.getSxwd_kfysry());
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
				try {
					vo.setBeginTime2(sdf.parse(time2));
				} catch (ParseException e) {
					e.printStackTrace();
				}
			}
		}
		// 总页数
		pages.setTotal(shangXianWdService.querySXWDSCount(vo));
		pages.setRows(shangXianWdService.querySXWDS(vo));
		Gson gson = new Gson();
		map.put("code", 0);
		map.put("msg", "");
		map.put("count", shangXianWdService.querySXWDSCount(vo));
		List<ShangXianWD> rows = pages.getRows();
		for (ShangXianWD row : rows) {
			if (row.getSxwd_wtlx() != null) {
				// 设置问题类型
				Sxwd_DM_WTLX wtlx = shangXianWdService.queryWtlxById(row.getSxwd_wtlx());
				row.setWtlxmc(wtlx.getWtlx_mc());
			}
			if (row.getSxwd_kfry() != null) {
				User user = userService.queryUserById(row.getSxwd_kfry());
				row.setKfrymc(user.getUser_name());
			}
			if (row.getSxwd_kfysry() != null) {
				User user = userService.queryUserById(row.getSxwd_kfysry());
				row.setKfysrymc(user.getUser_name());
			}
		}
		map.put("data", rows);
		String json = gson.toJson(map);
		return json.toString();
	}

	// 跳转至上线文档新增页面
	@RequestMapping(value = "/initSaveSxwd.do")
	public String initSaveSxwd() {
		return "yyzx/sxwd/savesxwd";
	}

	// ajax查询所有的问题类型
	@RequestMapping(value = "/queryAllWTLX.do")
	@ResponseBody
	public String queryAllWTLX() {
		JSONArray jsonArray = shangXianWdService.queryAllWTLX();
		return jsonArray.toString();
	}

	// 新增操作
	@RequestMapping(value = "/saveSXWD.do")
	public String saveSXWD(ShangXianWD shangXianWD, Model model) {
		shangXianWdService.saveSxwd(shangXianWD);
		model.addAttribute("flag", true);
		return "yyzx/sxwd/savesxwd";
	}

	// 查看操作
	@RequestMapping(value = "/shangXianWDShow.do")
	public String shangXianWDShow(@RequestParam Integer sxwd_dm, Model model) {
		ShangXianWD sxwd = shangXianWdService.querySXWDById(sxwd_dm);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");// 设置日期格式
		if (sxwd.getSxwd_wtlx() != null) {
			// 设置问题类型
			Sxwd_DM_WTLX wtlx = shangXianWdService.queryWtlxById(sxwd.getSxwd_wtlx());
			sxwd.setWtlxmc(wtlx.getWtlx_mc());
		}
		if (sxwd.getSxwd_kfysry() != null) {
			// 设置开发验收人员名称
			User user = userService.queryUserById(sxwd.getSxwd_kfysry());
			sxwd.setKfysrymc(user.getUser_name());
		}
		if (sxwd.getSxwd_kfry() != null) {
			// 设置开发人员名称
			User user = userService.queryUserById(sxwd.getSxwd_kfry());
			sxwd.setKfrymc(user.getUser_name());
		}
		if (sxwd.getSxwd_jhsxsj() != null) {
			String sxsj = sdf.format(sxwd.getSxwd_jhsxsj());
			sxwd.setJhsxsj(sxsj);
		}
		if (sxwd.getSxwd_kh() != null) {
			KeHu kh = khService.queryKHById(sxwd.getSxwd_kh());
			sxwd.setKhdwmc(kh.getKhmc());
		}
		model.addAttribute("sxwd", sxwd);
		return "yyzx/sxwd/sxwdShow";
	}
}
