package com.edge.procedure.ProcessDefinition.service.inter;

import java.io.File;
import java.io.InputStream;
import java.util.List;

import com.edge.procedure.ProcessDefinition.entity.ACT_RE_Procdef;
import com.edge.utils.QueryVo;

public interface ProcessDefinitionService {
	/// 查询所有流程定义
	public List<ACT_RE_Procdef> allProcessDefinition(QueryVo vo);

	// 查询所有流程定义数量
	public Integer ProcessDefinitionCount();

	// 根据流程定义的key来删除对应的所有流程定义
	public void deleteByKey(String key);

	// 部署流程定义
	public void deploy(File resource);

	// 根据流程定义主键显示对应的流程图
	public InputStream findPngStream(String pdId);
}
