package com.edge.procedure.ProcessDefinition.dao;

import java.util.List;

import com.edge.procedure.ProcessDefinition.entity.ACT_RE_Procdef;
import com.edge.utils.QueryVo;

public interface ProcessDefinitionDao {
	//查询所有流程定义
	public List<ACT_RE_Procdef> allProcessDefinition(QueryVo vo);
	
	//查询所有流程定义数量
	public Integer ProcessDefinitionCount();
}
