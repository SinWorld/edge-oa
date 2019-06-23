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
	
	//跳转至文件柜页面
	@RequestMapping(value="/wjgList.do")
	public String wjgList() {
		return "yyzx/wjg/wjgList";
	}
}
