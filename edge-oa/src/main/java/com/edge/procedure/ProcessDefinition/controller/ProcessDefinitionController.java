package com.edge.procedure.ProcessDefinition.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.LinkedHashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.edge.procedure.ProcessDefinition.entity.ACT_RE_Procdef;
import com.edge.procedure.ProcessDefinition.service.inter.ProcessDefinitionService;
import com.edge.utils.Page;
import com.edge.utils.QueryVo;
import com.google.gson.Gson;

/**
 * 流程定义控制层
 * 
 * @author NingCG
 *
 */
@Controller
@RequestMapping(value = "processDefinition")
public class ProcessDefinitionController {
	@Resource
	private ProcessDefinitionService processDefinitionService;

	// 跳转至流程定义页面
	@RequestMapping(value = "/initProcessDefinitionList.do")
	public String initProcessDefinitionList() {
		return "procedure/processDefinition/processDefinitionList";
	}

	// 查询所有最新流程定义
	@RequestMapping(value = "/processDefinitionList.do")
	@ResponseBody
	public String processDefinitionList(Integer page) {
		// new出QueryVo查询对象
		QueryVo vo = new QueryVo();
		// 获得Page对象
		Page<ACT_RE_Procdef> pages = new Page<ACT_RE_Procdef>();
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		// 每页数
		if (vo != null) {
			pages.setPage((page - 1) * vo.getSize() + 1);
			vo.setPage((page - 1) * vo.getSize() + 1);
			vo.setStartRow((pages.getPage()));
			vo.setSize(page * 10);
		}
		// 总页数
		pages.setTotal(processDefinitionService.ProcessDefinitionCount());
		pages.setRows(processDefinitionService.allProcessDefinition(vo));
		map.put("code", 0);
		map.put("msg", "");
		map.put("count", processDefinitionService.ProcessDefinitionCount());
		map.put("data", pages.getRows());
		Gson gson = new Gson();
		String json = gson.toJson(map);
		return json.toString();
	}

	// 根据Key删除流程定义
	@RequestMapping(value = "/deleteProcessDefinition.do")
	public ModelAndView deleteProcessDefinitionByKey(@RequestParam String key, ModelAndView mv) {
		processDefinitionService.deleteByKey(key);
		mv.setViewName("redirect:initProcessDefinitionList.do");
		return mv;
	}

	// 跳转至部署流程定义页面
	@RequestMapping(value = "/initDeploy.do")
	public String initDeploy() {
		return "procedure/processDefinition/addProcessDefinition";
	}

	// 部署流程定义
	@RequestMapping(value = "/deploy.do")
	public String deploy(@RequestParam MultipartFile resource, Model model) {
		File file = this.MultipartFileToFile(resource);
		processDefinitionService.deploy(file);
		model.addAttribute("flag", true);
		return "procedure/processDefinition/addProcessDefinition";
	}

	// 将 MultipartFile文件类型转换为File类型
	private File MultipartFileToFile(MultipartFile file) {
		File f = null;
		try {
			InputStream is = file.getInputStream();
			f = new File(file.getOriginalFilename());

			OutputStream os = new FileOutputStream(f);

			int bytesRead = 0;
			byte[] buffer = new byte[8192];
			while ((bytesRead = is.read(buffer, 0, 8192)) != -1) {
				os.write(buffer, 0, bytesRead);
			}
			os.close();
			is.close();
		} catch (IOException e) {
			e.printStackTrace();
		}

		return f;
	}
	
	//显示流程图（文件下载）
	@RequestMapping(value="/showPng.do")
	public String showPng(@RequestParam String pdId,HttpServletResponse response) {
		InputStream in = processDefinitionService.findPngStream(pdId);
		response.setContentType("image/png");
		response.setCharacterEncoding("utf-8");
		try {
			ServletOutputStream outputStream = response.getOutputStream();
			int len=0;
			byte[]buf=new byte[1024];
			while((len=in.read(buf,0,1024))!=-1){
				outputStream.write(buf, 0, len);
			}
			outputStream.close();
			in.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return "procedure/processDefinition/ShowImage";
	}

}
