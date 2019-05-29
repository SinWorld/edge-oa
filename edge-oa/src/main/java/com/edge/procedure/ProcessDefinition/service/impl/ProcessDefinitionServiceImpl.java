package com.edge.procedure.ProcessDefinition.service.impl;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.InputStream;
import java.nio.charset.Charset;
import java.util.List;
import java.util.zip.ZipInputStream;

import javax.annotation.Resource;

import org.activiti.engine.ProcessEngine;
import org.activiti.engine.repository.DeploymentBuilder;
import org.activiti.engine.repository.ProcessDefinition;
import org.activiti.engine.repository.ProcessDefinitionQuery;
import org.springframework.stereotype.Service;

import com.edge.procedure.ProcessDefinition.dao.ProcessDefinitionDao;
import com.edge.procedure.ProcessDefinition.entity.ACT_RE_Procdef;
import com.edge.procedure.ProcessDefinition.service.inter.ProcessDefinitionService;
import com.edge.utils.QueryVo;

/**
 * 流程定义管理Service
 * 
 * @author NingCG
 *
 */
@Service
public class ProcessDefinitionServiceImpl implements ProcessDefinitionService {
	@Resource
	private ProcessEngine processEngine;

	@Resource
	ProcessDefinitionDao processDefinitionDao;

	// 查询最新版本的流程定义列表
	public List<ACT_RE_Procdef> allProcessDefinition(QueryVo vo) {
		return processDefinitionDao.allProcessDefinition(vo);
	}

	// 查询所有流程定义数量
	public Integer ProcessDefinitionCount() {
		return processDefinitionDao.ProcessDefinitionCount();
	}

	// 根据流程定义的key来删除对应的所有流程定义
	public void deleteByKey(String key) {
		// 根据Key查询流程定义列表
		ProcessDefinitionQuery query = processEngine.getRepositoryService().createProcessDefinitionQuery();
		query.processDefinitionKey(key);
		List<ProcessDefinition> list = query.list();
		for (ProcessDefinition pd : list) {
			String deploymentId = pd.getDeploymentId();
			processEngine.getRepositoryService().deleteDeployment(deploymentId, true);
		}
	}

	// 部署流程定义
	public void deploy(File resource) {
		DeploymentBuilder deploymentBuilder = processEngine.getRepositoryService().createDeployment();
		ZipInputStream zipInputStream = null;
		try {
			// 转换编码格式 默认为UTF-8 需要转换为GBK
			Charset gbk = Charset.forName("gbk");
			zipInputStream = new ZipInputStream(new FileInputStream(resource), gbk);
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		}
		deploymentBuilder.addZipInputStream(zipInputStream);
		deploymentBuilder.deploy();
	}

	// 根据流程定义的主键显示对应的流程图
	public InputStream findPngStream(String pdId) {
		return processEngine.getRepositoryService().getProcessDiagram(pdId);
	}

}
