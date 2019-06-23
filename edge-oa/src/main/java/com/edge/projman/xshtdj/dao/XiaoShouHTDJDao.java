package com.edge.projman.xshtdj.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.alibaba.fastjson.JSONArray;
import com.edge.projman.approveproj.entity.Foll_up_Proj;
import com.edge.projman.xshtdj.entity.HuoWuInFor;
import com.edge.projman.xshtdj.entity.XiaoShouHT;
import com.edge.projman.xshtdj.entity.Xsht_QueryVo;
import com.edge.utils.APPR_DM_STATUS;

public interface XiaoShouHTDJDao {
	// 分页查询所有的销售合同
	public List<XiaoShouHT> queryAllXiaoShouHt(Xsht_QueryVo vo);

	// 按条件查询销售合同所有数量
	public Integer queryAllXiaoShouHTCount(Xsht_QueryVo vo);

	// 根据Id查询审批状态
	public APPR_DM_STATUS queryStatus(@Param("appr_Status_Id") Integer appr_Status_Id);

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
	public XiaoShouHT queryXSHTById(@Param("proj_Info_Id") Integer proj_Info_Id);

	// 编辑销售合同
	public void editXSHT(XiaoShouHT xiaoShouHT);
	
	//新增货物产品内容
	public void addHWCPNR(HuoWuInFor huoWuInFor);
	
	//查询该销售合同对应的产品内容
	public List<HuoWuInFor> hwnrs(@Param("proj_Info_Id")Integer proj_Info_Id);

}
