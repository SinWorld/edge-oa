package com.edge.yyzx.kfxm.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.alibaba.fastjson.JSONArray;
import com.edge.yyzx.kfxm.dao.KaiFaXMDao;
import com.edge.yyzx.kfxm.entity.KaiFaXM;
import com.edge.yyzx.kfxm.entity.KaiFaXM_QueryVo;
import com.edge.yyzx.kfxm.entity.XMJD_DM;
import com.edge.yyzx.kfxm.entity.XMZT_DM;
import com.edge.yyzx.kfxm.service.inter.KaiFaXMService;

/**
 * 开发项目业务逻辑层
 * 
 * @author NingCG
 *
 */
@Service
public class KaiFaXMServiceImpl implements KaiFaXMService {
	@Resource
	private KaiFaXMDao kaiFaXMDao;

	// 分页查询所有的开发项目
	public List<KaiFaXM> queryAllkaiFaXM(KaiFaXM_QueryVo vo) {
		return kaiFaXMDao.queryAllkaiFaXM(vo);
	}

	// 按条件查询开发项目所有数量
	public Integer queryAllkaiFaXMCount(KaiFaXM_QueryVo vo) {
		return kaiFaXMDao.queryAllkaiFaXMCount(vo);
	}

	// 查询所有的项目阶段
	public JSONArray queryAllXMJD() {
		return kaiFaXMDao.queryAllXMJD();
	}

	// 查询所有的项目状态
	public JSONArray queryAllXMZT() {
		return kaiFaXMDao.queryAllXMZT();
	}

	// ajax加载所有的签约主体
	public JSONArray queryAllQYZT() {
		return kaiFaXMDao.queryAllQYZT();
	}

	// 新增开发项目
	public void saveKFXM(KaiFaXM kfxm) {
		kaiFaXMDao.saveKFXM(kfxm);
	}

	// 根据id查询对应的项目阶段
	public XMJD_DM queryXMJDById(Integer xmjd_dm) {
		return kaiFaXMDao.queryXMJDById(xmjd_dm);
	}

	// 根据id查询对应的项目状态
	public XMZT_DM queryXMZTById(Integer xmzt_dm) {
		return kaiFaXMDao.queryXMZTById(xmzt_dm);
	}

	// 根据id查询对应的开发项目
	public KaiFaXM queryKFXMById(Integer kfxm_dm) {
		return kaiFaXMDao.queryKFXMById(kfxm_dm);
	}

	// 编辑开发项目
	public void editKFXM(KaiFaXM kfxm) {
		kaiFaXMDao.editKFXM(kfxm);
	}

	// 根据id删除开发项目
	public void deleteKFXMById(Integer kfxm_dm) {
		kaiFaXMDao.deleteKFXMById(kfxm_dm);
	}
}
