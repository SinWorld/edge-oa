package com.edge.yyzx.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 应用中心 控制层
 * 
 * @author NingCG
 *
 */
@Controller
@RequestMapping(value = "yyzx")
public class YingYongZX {
	// 跳转至应用中心列表页
	@RequestMapping(value = "/yyzxList.do")
	public String yyzxList() {
		return "yyzx/yyzxList";
	}

	// 跳转至客户列表页面
	@RequestMapping(value = "/khList.do")
	public String khList() {
		return "yyzx/kh/khList";
	}

	// 跳转至会议纪要列表页面
	@RequestMapping(value = "/hyjyList.do")
	public String hyjyList() {
		return "yyzx/hyjy/hyjyList";
	}

	// 跳转至文件柜页面
	@RequestMapping(value = "/wjgList.do")
	public String wjgList() {
		return "yyzx/wjg/wjgList";
	}

	// 跳转至签约主体列表页面
	@RequestMapping(value = "/qyztList.do")
	public String qyztList() {
		return "yyzx/qyzt/qyztList";
	}

	// 跳转至标签维护列表页面
	@RequestMapping(value = "/bqwhList.do")
	public String bqwhList() {
		return "yyzx/bqwh/bqwhList";
	}

	// 跳转至上线文档列表页面
	@RequestMapping(value = "/sxwdList.do")
	public String sxwdList() {
		return "yyzx/sxwd/sxwdList";
	}

	// 跳转至客户系统列表页面
	@RequestMapping(value = "/khxtList.do")
	public String khxtList() {
		return "yyzx/khxt/khxtList";
	}

	// 跳转至项目信息列表页面
	@RequestMapping(value = "/xmxxList.do")
	public String xmxxList() {
		return "yyzx/xmxx/xmxxList";
	}

	// 跳转至开发项目列表页面
	@RequestMapping(value = "/kfxmList.do")
	public String kfxmList() {
		return "yyzx/kfxm/kfxmList";
	}

	// 跳转至售后项目列表页面
	@RequestMapping(value = "/shxmList.do")
	public String shxmList() {
		return "yyzx/shxm/shxmList";
	}
}
