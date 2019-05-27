package com.edge.index.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.edge.index.dao.IndexDao;
import com.edge.index.service.inter.IndexService;
import com.edge.system.role.entity.Privilege;

@Service
public class IndexServiceImpl implements IndexService {

	@Resource
	private IndexDao indexDao;

	// 用户登录到首页时根据用户主键查询当前用户的顶级权限
	public List<Privilege> userPrivilegeList(Integer user_id) {
		return indexDao.userPrivilegeList(user_id);
	}

	// 查询当前用户所有顶级权限下的二级子权限
	public List<Privilege> ejChildrenList(Integer user_id, Integer parent_id) {
		return indexDao.ejChildrenList(user_id, parent_id);
	}

}
