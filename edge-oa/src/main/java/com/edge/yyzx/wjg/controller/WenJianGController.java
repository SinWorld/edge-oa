package com.edge.yyzx.wjg.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.Set;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.edge.projman.xshtdj.entity.XiaoShouHT;
import com.edge.projman.xshtdj.entity.Xsht_QueryVo;
import com.edge.system.department.entity.Department;
import com.edge.system.user.entity.User;
import com.edge.system.user.service.inter.UserService;
import com.edge.utils.FtpUtil;
import com.edge.utils.Page;
import com.edge.utils.SYS_FUJIAN;
import com.edge.yyzx.wjg.entity.SYS_WenJianG;
import com.edge.yyzx.wjg.entity.SYS_WenJianJ;
import com.edge.yyzx.wjg.entity.Wjg_QueryVo;
import com.edge.yyzx.wjg.service.inter.WenJianGService;
import com.google.gson.Gson;
import com.sun.org.apache.xpath.internal.operations.Bool;

@Controller
@RequestMapping(value = "wjg")
public class WenJianGController {

	public static final String ftpHost = "192.168.0.106";// ftp文档服务器Ip

	public static final String ftpUserName = "admin";// ftp文档服务器登录用户名

	public static final String ftpPassword = "123";// ftp文档服务器登录密码

	public static final int ftpPort = 21;// ftp文档服务器登录端口

	@Resource
	private WenJianGService wenJianGService;

	@Resource
	private UserService userService;

	// 初始化文件夹
	@RequestMapping(value = "/initWenJianJ.do")
	@ResponseBody
	private String initWenJianJ() {
		List<SYS_WenJianJ> topWenJianJ = topWenJianJ();
		Gson gson = new Gson();
		String str = gson.toJson(topWenJianJ);
		return str.toString();
	}

	private List<SYS_WenJianJ> topWenJianJ() {
		// 获得顶级节点
		List<SYS_WenJianJ> topList = wenJianGService.allWenJianJ();
		List<SYS_WenJianJ> list = new ArrayList<SYS_WenJianJ>();
		// 遍历该集合
		for (SYS_WenJianJ t : topList) {
			// 根据集合主键查询子集和
			String id = String.valueOf(t.getParent_Id());
			if (id == "null") {
				String pid = null;
				if (StringUtils.isBlank(pid)) {
					list.add(findChildren(t, topList));
				}
			} else {
				if (StringUtils.isBlank(id)) {
					list.add(findChildren(t, topList));

				}
			}

		}
		return list;
	}

	// 递归查询子节点
	private SYS_WenJianJ findChildren(SYS_WenJianJ wjj, List<SYS_WenJianJ> childrenList) {
		for (SYS_WenJianJ c : childrenList) {
			if (c.getParent_Id() == wjj.getId()) {
				if (wjj.getChildren() == null) {
					wjj.setChildren(new ArrayList<SYS_WenJianJ>());
				}
				wjj.getChildren().add(findChildren(c, childrenList));
			}
		}
		return wjj;
	}

	// 跳转至文件夹新增页面
	@RequestMapping(value = "/initSaveWjj.do")
	public String initSaveWjj(@RequestParam Integer id, Model model) {
		// 通过Id查询文件夹
		SYS_WenJianJ wjj = wenJianGService.queryWjjById(id);
		model.addAttribute("wjj", wjj);
		return "yyzx/wjg/saveWjg";
	}

	// 新增文件夹
	@RequestMapping(value = "/saveWjj.do")
	public String saveWjj(SYS_WenJianJ wjj, @RequestParam Integer flwjj, Model model) {
		// 新增文件夹
		wjj.setParent_Id(flwjj);
		wenJianGService.saveWjj(wjj);
		model.addAttribute("flag", true);
		return "yyzx/wjg/saveWjg";
	}

	// 跳转至编辑页面
	@RequestMapping(value = "/initEditWJg.do")
	public String initEditWJg(@RequestParam Integer id, Model model) {
		// 根据Id查询当前节点名称
		SYS_WenJianJ wjj = wenJianGService.queryWjjById(id);
		// 得到上级文件夹的主键 根据该主键去查询上级文件夹名称
		// 如果该文件夹为顶级文件夹则上级文件夹主键为空
		if (wjj.getParent_Id() == null) {
			model.addAttribute("wjj", wjj);
			model.addAttribute("title", "请选择文件夹");
		} else {
			SYS_WenJianJ sys_wjj = (SYS_WenJianJ) wenJianGService.queryWjjById(wjj.getParent_Id());
			model.addAttribute("wjj", sys_wjj);
			model.addAttribute("title", sys_wjj.getTitle());
		}
		model.addAttribute("wj", wjj);
		return "yyzx/wjg/editWjg";
	}

	// 编辑页面初始化文件机构树
	@RequestMapping(value = "/orgWJJTree.do", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String initEditWjj() {
		// new出JSONArray数组对象
		JSONArray jsonArray = new JSONArray();
		// 准备文件夹列表数据，用于select框显示
		List<SYS_WenJianJ> topList = wenJianGService.queryTopWJJTree();
		List<SYS_WenJianJ> treeList = this.getTreeList(topList, null);
		jsonArray.add(treeList);
		return jsonArray.toString();

	}

	private List<SYS_WenJianJ> getTreeList(List<SYS_WenJianJ> topList, Long removeId) {
		List<SYS_WenJianJ> treeList = new ArrayList<SYS_WenJianJ>();
		this.walkTree(topList, treeList, "┣", removeId, wenJianGService);
		return treeList;
	}

	/**
	 * 组织树形部门数据
	 */
	private void walkTree(Collection<SYS_WenJianJ> topList, List<SYS_WenJianJ> treeList, String prefix, Long removeId,
			WenJianGService wenJianGService) {
		for (SYS_WenJianJ d : topList) {
			if (removeId != null && d.getId().equals(removeId)) {
				continue;
			}
			SYS_WenJianJ copy = new SYS_WenJianJ();
			copy.setId(d.getId());
			copy.setTitle((prefix + d.getTitle()));
			// 顶点
			treeList.add(copy);
			// 子树
			Integer dep_id = d.getId();
			List<SYS_WenJianJ> children = wenJianGService.queryChildrenWJJTree(dep_id);
			walkTree(children, treeList, "　" + prefix, removeId, wenJianGService);
		}
	}

	// 编辑文件夹
	@RequestMapping(value = "/editWJJ.do")
	public String editWJJ(SYS_WenJianJ wjj, Model model) {
		wenJianGService.editWJJ(wjj);
		model.addAttribute("flag", true);
		return "yyzx/wjg/editWjg";
	}

	// 删除文件夹
	@RequestMapping(value = "/deleteWJJ.do", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String deleteWJJ(@RequestParam Integer id) {
		// new出JSONObject对象
		JSONObject jsonObject = new JSONObject();
		// 根据id查询当前节点
		SYS_WenJianJ wjj = wenJianGService.queryWjjById(id);
		// 查询当前节点的子节点
		List<SYS_WenJianJ> queryChildrenWJJTree = wenJianGService.queryChildrenWJJTree(wjj.getId());
		if (queryChildrenWJJTree.size() == 0) {
			// 表示不存在子节点可直接删除
			wenJianGService.deleteWJJ(wjj.getId());
			jsonObject.put("flag", "节点已删除");
		} else {
			jsonObject.put("flag", "当前节点存在子节点请先删除子节点");
		}
		return jsonObject.toString();
	}

	// 点击上传按钮打开上传页面
	@RequestMapping(value = "/initupload.do")
	public String initupload() {
		return "yyzx/wjg/saveWj";
	}

	// 上传附件操作
	@RequestMapping(value = "/upload.do")
	@ResponseBody
	public String upload(@RequestParam("file") MultipartFile file) throws Exception {
		// new出JSONObject对象
		JSONObject jsonObject = new JSONObject();
		// new出Map集合用于存放上传文件名、上传文件在ftp中的名称、上传文间地址
		Map<String, Object> map = new HashMap<String, Object>();
		// 文件名
		String fileName = file.getOriginalFilename();
		String fileSuffix = fileName.substring(fileName.lastIndexOf("."), fileName.length());
		// ftp不支持中文名称故生成非中文名存储在ftp中
		// String localFileName = System.currentTimeMillis() + fileSuffix;
		Random r = new Random();
		String localFileName = String.valueOf(r.nextInt(999999)) + fileSuffix;
		File input = this.MultipartFileToFile(file);
		// 将File转化为InputStream
		InputStream inp = new FileInputStream(input);
		// 连接ftp文档服务器
		Date date = new Date();
		String path = "/" + new SimpleDateFormat("yyyy/MM/dd").format(date);
		// 上传文件
		boolean flag = FtpUtil.uploadFile(ftpHost, ftpUserName, ftpPassword, ftpPort, path, localFileName, inp);
		map.put("fileName", fileName);
		map.put("localFileName", localFileName);
		map.put("path", path);
		if (flag) {
			jsonObject.put("code", 0);
			jsonObject.put("msg", "");
			jsonObject.put("data", map);
		} else {
			jsonObject.put("code", 1);
			jsonObject.put("msg", "文件上传失败");
			jsonObject.put("data", map);
		}
		return jsonObject.toString();

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

	// 将上传的附件写入数据库
	@RequestMapping(value = "/saveWJ.do")
	private String saveWJ(@RequestParam String fjsx, Integer wenJianJDM, HttpServletRequest request, Model model) {
		// 从session中获取当前登录用户主键
		HttpSession session = request.getSession();
		Integer userId = (Integer) session.getAttribute("userId");
		List<String> list = new ArrayList<String>();
		// 将fjsx进行字符截取
		String fjvalue = fjsx.substring(1, fjsx.length());
		list.add(fjvalue);
		String value = list.toString();
		Date date = new Date();
		// 将字符串转换为json数组
		JSONArray jsonArray = JSONArray.parseArray(value);
		for (int i = 0; i < jsonArray.size(); i++) {
			JSONObject obj = jsonArray.getJSONObject(i);
			String localFileName = (String) obj.get("localFileName");// 上传文件名
			String path = (String) obj.get("path");// 上传文件地址
			String fileName = (String) obj.get("fileName");// 上传文件真实名
			// new 出文件柜对象
			SYS_WenJianG wjg = new SYS_WenJianG();
			wjg.setScwjm(localFileName);// 上传文件名
			wjg.setScdz(path);// 上传文件地址
			wjg.setRealWJM(fileName);// 上传文件真实名称
			wjg.setStartTime(date);// 上传文件日期
			wjg.setUserDM(userId);// 上传用户主键
			wjg.setWenJianJDM(wenJianJDM);
			wjg.setWenJianM(fileName);
			wenJianGService.saveWJG(wjg);
		}
		model.addAttribute("flag", true);
		return "yyzx/wjg/saveWj";
	}

	// 分页查询销售合同(点击文件夹展现相应文件柜文件)
	@RequestMapping(value = "/wjgList.do")
	@ResponseBody
	public String wjgList(Integer page, Wjg_QueryVo wjg_QueryVo, String time1, String time2, Integer wjjdm) {
		// new出QueryVo查询对象
		Wjg_QueryVo vo = new Wjg_QueryVo();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");// 设置日期格式
		// 获得Page对象
		Page<SYS_WenJianG> pages = new Page<SYS_WenJianG>();
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		// new 出List集合用于存储点击文件夹后对应的文件柜对象
		List<SYS_WenJianG> clickWJGS = new ArrayList<SYS_WenJianG>();
		// 根据文件夹代码查询子文件夹
		if (wjjdm != null) {// 点击文件夹展现对应的文件柜数据
			List<Integer> wjjdms = queryWJJId(wjjdm);
			List<SYS_WenJianG> wjgParent = wenJianGService.queryWJGByWJJDM(wjjdm);
			if (wjgParent.size()>0) {
				for (SYS_WenJianG p : wjgParent) {
					clickWJGS.add(p);
				}
			}
			// 遍历 wjjdms集合
			for (Integer dm : wjjdms) {
				// 根据代码查询对应的文件柜对象
				List<SYS_WenJianG> wjg = wenJianGService.queryWJGByWJJDM(dm);
				if (wjg.size()>0) {
					for (SYS_WenJianG w : wjg) {
						clickWJGS.add(w);
					}
				}
			}
			if (vo != null) {
				pages.setPage((page - 1) * vo.getSize() + 1);
				vo.setPage((page - 1) * vo.getSize() + 1);
				vo.setStartRow((pages.getPage()));
				vo.setSize(page * 10);
				if (wjg_QueryVo.getWenJianM() != null && wjg_QueryVo.getWenJianM() != "") {
					vo.setWenJianM(wjg_QueryVo.getWenJianM().trim());
				}
				if (wjg_QueryVo.getWenJianJDM() != null) {
					vo.setWenJianJDM(wjg_QueryVo.getWenJianJDM());
				}
				if (wjg_QueryVo.getUserDM() != null) {
					vo.setUserDM(wjg_QueryVo.getUserDM());
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
			pages.setTotal(clickWJGS.size());
			pages.setRows(clickWJGS);
			Gson gson = new Gson();
			map.put("code", 0);
			map.put("msg", "");
			map.put("count", clickWJGS.size());
			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");// 设置日期格式
			List<SYS_WenJianG> rows = pages.getRows();
			// 遍历该集合
			for (SYS_WenJianG row : rows) {
				// 设置文件夹名称
				SYS_WenJianJ wjj = wenJianGService.queryWjjById(row.getWenJianJDM());
				if (wjj != null) {
					row.setTitle(wjj.getTitle());// 设置文件夹名称
				}

				// 根据用户id查询用户对象
				User user = userService.queryUserById(row.getUserDM());
				if (user != null) {
					// 设置提交用户名
					row.setUserName(user.getUser_name());
				}
				// 格式化提交日期
				row.setBeginTime((df.format(row.getStartTime())));
			}
			map.put("data", pages.getRows());
			String json = gson.toJson(map);
			return json.toString();
		} else {// 分页展现所有的文件柜对象
			// 每页数
			if (vo != null) {
				pages.setPage((page - 1) * vo.getSize() + 1);
				vo.setPage((page - 1) * vo.getSize() + 1);
				vo.setStartRow((pages.getPage()));
				vo.setSize(page * 10);
				if (wjg_QueryVo.getWenJianM() != null && wjg_QueryVo.getWenJianM() != "") {
					vo.setWenJianM(wjg_QueryVo.getWenJianM().trim());
				}
				if (wjg_QueryVo.getWenJianJDM() != null) {
					vo.setWenJianJDM(wjg_QueryVo.getWenJianJDM());
				}
				if (wjg_QueryVo.getUserDM() != null) {
					vo.setUserDM(wjg_QueryVo.getUserDM());
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
			pages.setTotal(wenJianGService.queryAllWenJCount(vo));
			pages.setRows(wenJianGService.queryAllWenJ(vo));
			Gson gson = new Gson();
			map.put("code", 0);
			map.put("msg", "");
			map.put("count", wenJianGService.queryAllWenJCount(vo));
			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");// 设置日期格式
			List<SYS_WenJianG> rows = pages.getRows();
			// 遍历该集合
			for (SYS_WenJianG row : rows) {
				// 设置文件夹名称
				SYS_WenJianJ wjj = wenJianGService.queryWjjById(row.getWenJianJDM());
				if (wjj != null) {
					row.setTitle(wjj.getTitle());// 设置文件夹名称
				}

				// 根据用户id查询用户对象
				User user = userService.queryUserById(row.getUserDM());
				if (user != null) {
					// 设置提交用户名
					row.setUserName(user.getUser_name());
				}
				// 格式化提交日期
				row.setBeginTime((df.format(row.getStartTime())));
			}
			map.put("data", pages.getRows());
			String json = gson.toJson(map);
			return json.toString();
		}
	}

	// 点击文件夹查询该文件夹下所有的子节点文件夹主键
	private List<Integer> queryWJJId(Integer wjjdm) {
		// new 出List集合用于存储所有的文件夹代码
		List<Integer> wjjdms = new ArrayList<Integer>();
		// 根据文件夹代码查询子文件夹集合
		List<SYS_WenJianJ> childrenWJJTree = wenJianGService.queryChildrenWJJTree(wjjdm);
		this.queryWJJTree(childrenWJJTree, wjjdms);
		return wjjdms;

	}

	// 递归查询该文件夹下所有的子文件夹
	private void queryWJJTree(List<SYS_WenJianJ> childrens, List<Integer> wjjdms) {
		// 遍历该集合
		for (SYS_WenJianJ c : childrens) {
			wjjdms.add(c.getId());
			List<SYS_WenJianJ> childrenWJJ = wenJianGService.queryChildrenWJJTree(c.getId());
			queryWJJTree(childrenWJJ, wjjdms);
		}

	}

	// 下载附件
	@RequestMapping(value = "/dowLoand.do", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String dowLoand(@RequestParam String wjgdm) {
		// 将wjgdm进行字符截取
		String wjdm = wjgdm.substring(1, wjgdm.length());
		// 转换为数组
		String[] ids = wjdm.split(",");
		// 在本地按日期创建下载问价的保存地址
		String localPath = addNewFile();
		// new出map集合用于存储结果集
		Map<Integer, Boolean> result = new HashMap<Integer, Boolean>();
		// new 出JSONObject对象
		JSONObject jSONObject = new JSONObject();
		// 遍历该数组
		for (int i = 0; i < ids.length; i++) {
			// 根据id查询该文件柜对象
			SYS_WenJianG wjg = wenJianGService.queryWJGById(Integer.parseInt(ids[i].trim()));
			// 获得ftpath
			String ftpPath = wjg.getScdz();
			// 获得ftp中存储的文件名
			String fileName = wjg.getScwjm();
			// 获得存储在数据库中的文件真正名称
			String rEALWJM = wjg.getRealWJM();
			// 下载附件
			boolean flag = FtpUtil.downloadFtpFile(ftpHost, ftpUserName, ftpPassword, ftpPort, ftpPath, localPath,
					fileName, rEALWJM);
			if (flag == false) {
				result.put(i, flag);
			}
		}
		// 遍历结果集
		Set<Integer> key = result.keySet();
		Map<Integer, String> map = new HashMap<Integer, String>();
		for (Integer k : key) {
			if (result.get(k) == false) {
				// 将结果放入map集合中
				map.put(k, "第" + (k + 1) + "行文件下载失败！！！");
			}
		}
		if (map.isEmpty()) {
			jSONObject.put("info", "文件已下载至" + localPath);
		} else {
			jSONObject.put("info", map.values().toString());
		}
		return jSONObject.toString();
	}

	// 在本地按日期创建文件夹 如果存在则不创建
	public String addNewFile() {
		Date date = new Date();
		String path = "D:/" + "文件柜" + "/" + new SimpleDateFormat("yyyy/MM/dd/").format(date);
		// 如果不存在,创建文件夹
		File f = new File(path);
		if (!f.exists()) {
			f.mkdirs();
		}
		return path;
	}

	// 删除文件
	@RequestMapping(value = "/deleteWjById.do", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String deleteWj(@RequestParam Integer id) {
		wenJianGService.deleteWJById(id);
		// new 出JSONObject对象
		JSONObject jSONObject = new JSONObject();
		jSONObject.put("msg", "文件已删除");
		return jSONObject.toString();
	}

}
