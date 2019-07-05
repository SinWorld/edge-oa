package com.edge.reimburse.bxxq.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONArray;
import com.edge.reimburse.bxxq.entiy.BaoXiaoInFo;
import com.edge.reimburse.bxxq.service.inter.BxxqService;

@Controller
@RequestMapping(value = "bxxq")
public class BxxqController {
	@Resource
	private BxxqService bxxqService;

	// 跳转至报销详情页面
	@RequestMapping(value = "/initBxxqInfo.do")
	public String initBxxqInfo() {
		return "reimburse/bxxq/bxxqInfo";
	}

	// ajax查询所有的用户名
	@RequestMapping(value = "/queryAllUser.do")
	@ResponseBody
	public String queryAllUser() {
		List<BaoXiaoInFo> bxxqs = bxxqService.queryAllUserBxxq();
		JSONArray jsonArray=new JSONArray();
		for (BaoXiaoInFo bxxq : bxxqs) {
			jsonArray.add(bxxq);
		}
		return jsonArray.toString();
	}
	
	// ajax按日期查询所有的用户报销情况
	@RequestMapping(value = "/queryAllUserBxxqByRQ.do")
	@ResponseBody
	public String queryAllUserBxxqByRQ(@RequestParam String beginTime,String endTime) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");// 设置日期格式
		Date startTime=null;
		Date overTime=null;
		if (beginTime != null && beginTime != "") {
			// 将String类型转换为Date类型
			try {
				startTime=sdf.parse(beginTime);
			} catch (ParseException e) {
				e.printStackTrace();
			}
		}
		if (endTime != null && endTime != "") {
			try {
				overTime=sdf.parse(endTime);
			} catch (ParseException e) {
				e.printStackTrace();
			}
		}
		List<BaoXiaoInFo> bxxqs = bxxqService.queryAllUserBxxqByRQ(startTime, overTime);
		JSONArray jsonArray=new JSONArray();
		for (BaoXiaoInFo bxxq : bxxqs) {
			jsonArray.add(bxxq);
		}
		return jsonArray.toString();
	}
	
}
