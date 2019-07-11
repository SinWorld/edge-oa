package com.edge.cwgl.xsfpkj.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.edge.cwgl.xsfpkj.entity.FPLB_DM;
import com.edge.cwgl.xsfpkj.entity.JXX_DM;
import com.edge.cwgl.xsfpkj.entity.XSHTKP;
import com.edge.cwgl.xsfpkj.entity.Xshtkp_QueryVo;

public interface XshtkpDao {
	// 加载所有的进销项
	public List<JXX_DM> queryAllJXX();

	// 加载所有的发票类别
	public List<FPLB_DM> queryAllFPLB();

	// 查询当前合同下的累计开票金额
	public Double queryLJKPJE(@Param("xshtdm") Integer xshtdm);

	// 开票新增页面保存操作
	public void saveXSHTKP(XSHTKP xshtkp);

	// 查询我填写的报销开票(新增页面表格显示)
	public List<XSHTKP> queryMyXSHTKP(@Param("userName") String userName);

	// 根据id查询进销项
	public JXX_DM queryjxxById(@Param("jxx_dm") Integer jxx_dm);

	// 根据id查询所属的发票类别
	public FPLB_DM queryfplbById(@Param("fplb_dm") Integer fplb_dm);

	// 根据Id查询销售合同开票对象
	public XSHTKP queryXshtkpById(@Param("xshtkp_dm") Integer xshtkp_dm);

	// 编辑操作
	public void editXshtkp(XSHTKP xshtkp);
	
	//删除操作
	public void deleteXshtkpById(@Param("xshtkp_dm") Integer xshtkp_dm);
	
	//分页查询开票记录
	public List<XSHTKP> queryAllXshtkp(Xshtkp_QueryVo vo);
	
	//查询开票记录数量
	public Integer queryAllXshtkpCount(Xshtkp_QueryVo vo);
	
	//列表页面通过uuid查看开票记录
	public List<XSHTKP> queryXshtkpByuuid(@Param("xshtkp_uuid")String xshtkp_uuid);
}
