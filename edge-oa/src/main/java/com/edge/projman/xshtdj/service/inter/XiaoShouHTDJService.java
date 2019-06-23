package com.edge.projman.xshtdj.service.inter;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import com.alibaba.fastjson.JSONArray;
import com.edge.projman.xshtdj.entity.HuoWuInFor;
import com.edge.projman.xshtdj.entity.XiaoShouHT;
import com.edge.projman.xshtdj.entity.Xsht_QueryVo;
import com.edge.utils.APPR_DM_STATUS;
import com.edge.utils.ReviewOpinion;

public interface XiaoShouHTDJService {
	// 分页查询所有的销售合同
	public List<XiaoShouHT> queryAllXiaoShouHt(Xsht_QueryVo vo);

	// 按条件查询销售合同所有数量
	public Integer queryAllXiaoShouHTCount(Xsht_QueryVo vo);

	// 根据Id查询审批状态
	public APPR_DM_STATUS queryStatus(Integer appr_Status_Id);

	// 查询所有的销售合同（高级搜索）
	public JSONArray queryAllXSHT();

	// 查询所有的已立项的项目
	public JSONArray queryAllYLXXMXX();

	// 查询所有未立项的项目
	public JSONArray queryAllWLXXMXX();

	// 新增销售合同
	public void saveXSHT(XiaoShouHT xiaoShouHT);

	// 查询新增后的销售合同主键值
	public Integer queryXSHTMaxId();

	// 根据Id查询所属的销售合同
	public XiaoShouHT queryXSHTById(Integer proj_Info_Id);

	// 编辑销售合同
	public void editXSHT(XiaoShouHT xiaoShouHT);

	// 启动流程实例
	public void saveStartProcess(String user_name, HttpServletRequest request);

	// 推动流程进入下一节点
	public void saveTask(String taskId, HttpServletRequest request);

	// 销售合同列表查看业务数据
	public List<ReviewOpinion> xiaoShouHTShowById(Integer proj_Id, Model model, HttpSession session);

	// 新增货物产品内容
	public void addHWCPNR(HuoWuInFor huoWuInFor);

	// 查询该销售合同对应的产品内容
	public List<HuoWuInFor> hwnrs( Integer proj_Info_Id);
}
