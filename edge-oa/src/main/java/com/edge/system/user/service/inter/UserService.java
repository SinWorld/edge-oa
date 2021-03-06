package com.edge.system.user.service.inter;

import java.util.List;

import com.alibaba.fastjson.JSONArray;
import com.edge.system.user.entity.User;
import com.edge.system.user.entity.User_DM_Posittion;
import com.edge.utils.QueryVo;

public interface UserService {
	// 新增用户
	public void saveUser(User user);

	// 分页显示用户列表
	public List<User> userList(QueryVo vo);

	// 查询用户总数量
	public Integer queryUserCount();

	// 根据Id查询当前用户
	public User queryUserById(Integer user_id);

	// 编辑用户
	public void editUser(User user);

	// 查询用户列表中所有的用户对应的角色
	public List<String> userRoleNames(Integer user_id);

	// 加载所有的岗位
	public JSONArray queryAllPosittion();

	// 根据id查询岗位
	public User_DM_Posittion queryPosittionById(Integer posittion_dm);

	// 根据输入的登录名验证登录名是否可用
	public User queryUserByLoginName(String loginName);
}
