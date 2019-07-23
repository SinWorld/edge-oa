package com.edge.yyzx.hyjy.service.inter;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.edge.yyzx.hyjy.entity.HuiYiJY;
import com.edge.yyzx.hyjy.entity.HuiYiJY_QueryVo;

public interface HuiYiJYService {
	// 分页显示会议纪要列表
	public List<HuiYiJY> queryHYJYS(HuiYiJY_QueryVo vo);

	// 分页显示会议纪要列表数量
	public Integer queryHYJYSCount(HuiYiJY_QueryVo vo);

	// 新增会议纪要
	public void saveHyjy(HuiYiJY hyjy);

	// 根据id查询对应的会议纪要
	public HuiYiJY queryHYJYById(Integer hyjydm);

	// 编辑操作
	public void editHYJY(HuiYiJY hyjy);

	// 根据id删除会议纪要
	public void deleteHyjyById(@Param("hyjydm") Integer hyjydm);
}
