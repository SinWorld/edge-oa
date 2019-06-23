<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>货物产品列表</title>
<link rel="stylesheet" href="../layui-v2.4.5/layui/css/layui.css">
<link rel="stylesheet" href="../login/css/static.css">
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@page isELIgnored="false"%>
</head>
<body>
<input type="hidden" value='<c:url value="/"/>' id="url">
<table class="layui-hide" id="hwnrs" lay-filter="hwnrs"></table>
<input type="hidden" value="${hwdms}" id="hwdms">
<script src="../layui-v2.4.5/layui/layui.js" charset="utf-8"></script>
<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
<script type="text/javascript" src="../jquery/jquery-3.3.1.js"></script>
<script src="../layui-v2.4.5/layui/layui.js" charset="utf-8"></script>
<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
<script>
layui.use(['table','form','layedit', 'laydate'], function(){
  var table = layui.table;
  var url=$('#url').val();
  var form= layui.form;
  var layer = layui.layer;
  var layedit = layui.layedit;
  var hwdms=$('#hwdms').val();
  table.render({
	    elem: '#hwnrs'
	    ,url:url+'xmcgrk/queryHWCPNRById.do?hwdms='+hwdms
	    ,title: '货物(产品内容)'
	    ,cols: [[
	       {field:'index', width:"5%", title: '序号', sort: true,type:'numbers'}
	      ,{field:'chanPinMC', width:"22%",align:'left', title: '产品名称'}
	      ,{field:'pinPai', width:"17%",align:'left', title: '品牌'}
	      ,{field:'guiGeXH', width:"12%",align:'left', title: '规格型号'}
	      ,{field:'zhuYaoPZCS', width:"12%",align:'left', title: '主要配置参数'}
	      ,{field:'danWei', width:"8%",align:'center', title: '单位'}
	      ,{field:'shuLiang', width:"8%",align:'center', title: '数量'}
	      ,{field:'price', width:"8%",align:'center', title: '单价'}
	      ,{field:'jinE', width:"8%",align:'center', title: '金额'}
	    ]]
	  });
});

</script>
</body>
</html>