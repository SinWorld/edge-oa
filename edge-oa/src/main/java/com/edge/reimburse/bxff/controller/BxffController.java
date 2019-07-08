package com.edge.reimburse.bxff.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.edge.projman.approveproj.entity.Foll_up_Proj;
import com.edge.projman.approveproj.service.inter.ApproveprojService;
import com.edge.reimburse.bxff.entity.Bxff_QueryVo;
import com.edge.reimburse.bxff.service.inter.BxffService;
import com.edge.reimburse.bxtb.entity.MyReport_QueryVo;
import com.edge.reimburse.bxtb.entity.Reimburse_DM_FYLX;
import com.edge.reimburse.bxtb.entity.Reimbursement;
import com.edge.reimburse.bxtb.service.inter.ReportService;
import com.edge.system.user.entity.User;
import com.edge.system.user.service.inter.UserService;
import com.edge.utils.Page;
import com.google.gson.Gson;

/**
 * 报销发放逻辑控制层
 * 
 * @author NingCG
 *
 */
@Controller
@RequestMapping(value = "bxff")
public class BxffController {
	@Resource
	private BxffService bxffService;
	@Resource
	private ApproveprojService approveprojService;
	@Resource
	private UserService userService;
	@Resource
	private ReportService reportService;

	// 跳转至报销发放列表页面
	@RequestMapping(value = "/initBxffList.do")
	public String initBxffList() {
		return "reimburse/bxff/bxffList";
	}

	// 分页显示报销记录（阮玲玲、邓成丽、高云飞能看见所有的报销记录，其余只能看自己的）
	@RequestMapping(value = "/bxffList.do")
	@ResponseBody
	public String bxffList(Integer page, HttpServletRequest request, Bxff_QueryVo myReport_QueryVo, String time1,
			String time2, String subTime1, String subTime2, Double jinE1, Double jinE2) {
		// new出QueryVo查询对象
		MyReport_QueryVo vo = new MyReport_QueryVo();
		HttpSession session = request.getSession();
		String userName = (String) session.getAttribute("userName");
		// 获得Page对象
		Page<Reimbursement> pages = new Page<Reimbursement>();
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");// 设置日期格式
		// 每页数
		if (vo != null) {
			pages.setPage((page - 1) * vo.getSize() + 1);
			vo.setPage((page - 1) * vo.getSize() + 1);
			vo.setStartRow((pages.getPage()));
			vo.setSize(page * 10);
			vo.setUserName(userName);
			if (myReport_QueryVo.getReimbursement_code() != null && myReport_QueryVo.getReimbursement_code() != "") {
				vo.setReimbursement_code(myReport_QueryVo.getReimbursement_code().trim());// 审批编号
			}
			if (myReport_QueryVo.getProj_dm() != null) {
				vo.setProj_dm(myReport_QueryVo.getProj_dm());// 所属项目
			}
			if (myReport_QueryVo.getReimbursement_dm_fylx() != null) {
				vo.setReimbursement_dm_fylx(myReport_QueryVo.getReimbursement_dm_fylx());// 费用类型
			}
			if (jinE1 != null) {
				vo.setReimbursement_bxje1(jinE1);// 报销金额
			}
			if (jinE2 != null) {
				vo.setReimbursement_bxje2(jinE2);// 报销金额
			}
			if (myReport_QueryVo.getReimbursement_user_dm() != null) {
				vo.setReimbursement_user_dm(myReport_QueryVo.getReimbursement_user_dm());// 费用所属
			}
			if (myReport_QueryVo.getReimbursement_bxr() != null && myReport_QueryVo.getReimbursement_bxr() != "") {
				vo.setReimbursement_bxr(myReport_QueryVo.getReimbursement_bxr().trim());// 报销人
			}
			if (myReport_QueryVo.getAppr_status() != null) {
				vo.setAppr_status(myReport_QueryVo.getAppr_status());// 审批状态
			}
			if (myReport_QueryVo.getNextcz() != null && myReport_QueryVo.getNextcz() != "") {
				vo.setNextcz(myReport_QueryVo.getNextcz().trim());// 当前操作
			}
			if (time1 != null && time1 != "") {// 发生日期
				// 将String类型转换为Date类型
				try {
					vo.setReimbursement_begintime1(sdf.parse(time1));
				} catch (ParseException e) {
					e.printStackTrace();
				}
			}
			if (time2 != null && time2 != "") {// 发生日期
				try {
					vo.setReimbursement_begintime2(sdf.parse(time2));
				} catch (ParseException e) {
					e.printStackTrace();
				}
			}
			if (subTime1 != null && subTime1 != "") {// 提交日期
				// 将String类型转换为Date类型
				try {
					vo.setReimbursement_submittime1(sdf.parse(subTime1));
				} catch (ParseException e) {
					e.printStackTrace();
				}
			}
			if (subTime2 != null && subTime2 != "") {// 提交日期
				try {
					vo.setReimbursement_submittime2(sdf.parse(subTime2));
				} catch (ParseException e) {
					e.printStackTrace();
				}
			}
		}
		// 总页数
		if ("阮玲玲".equals(userName) || "邓成丽".equals(userName) || "高云飞".equals(userName)) {
			// 阮玲玲、邓成丽、高云飞能看见所有的报销记录 其余只能看自己的
			pages.setTotal(bxffService.queryAllReimbursementCountLC(vo));
			pages.setRows(bxffService.queryAllReimbursementLC(vo));
			map.put("count", bxffService.queryAllReimbursementCountLC(vo));
		} else {
			pages.setTotal(bxffService.queryMyReimbursementCountLC(vo));
			pages.setRows(bxffService.queryMyReimbursementLC(vo));
			map.put("count", bxffService.queryMyReimbursementCountLC(vo));
		}
		Gson gson = new Gson();
		map.put("code", 0);
		map.put("msg", "");
		List<Reimbursement> rows = pages.getRows();
		// 遍历该集合 设置项目名称、费用类型、费用所属
		for (Reimbursement row : rows) {
			if (row.getProj_dm() != null) {
				// 项目信息
				Foll_up_Proj xmxx = approveprojService.queryXiangMuXXById(row.getProj_dm());
				row.setProj_name(xmxx.getBudget_Name());
			}
			if (row.getReimbursement_dm_fylx() != null) {
				// 费用类型
				Reimburse_DM_FYLX fylx = reportService.queryFYLXById(row.getReimbursement_dm_fylx());
				row.setFylx_name(fylx.getFylx_mc());
			}
			if (row.getReimbursement_user_dm() != null) {
				// 费用所属
				User user = userService.queryUserById(row.getReimbursement_user_dm());
				row.setReimbursement_user_name(user.getUser_name());
			}
			if (row.getAppr_status() != null) {
				row.setAppr_status_name(approveprojService.queryStatus(row.getAppr_status()).getAppr_Status_Name());
			}
		}
		map.put("data", pages.getRows());
		String json = gson.toJson(map);
		return json.toString();
	}
}
