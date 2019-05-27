package com.edge.index.service.inter;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.edge.system.role.entity.Privilege;

public interface IndexService {
	// 用户登录到首页时根据用户主键查询当前用户的顶级权限
	public List<Privilege> userPrivilegeList(@Param("user_id") Integer user_id);

	// 查询当前用户所有顶级权限下的二级子权限
	public List<Privilege> ejChildrenList(@Param("user_id") Integer user_id, @Param("parent_id") Integer parent_id);
}
