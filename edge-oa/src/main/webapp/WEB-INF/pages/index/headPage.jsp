<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>首页</title>
<link rel="stylesheet" href="../layui-v2.4.5/layui/css/layui.css">
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@page isELIgnored="false"%>
</head>
<body>
<div class="layui-tab">
  <ul class="layui-tab-title">
    <li class="layui-this">代办</li>
    <li>已办</li>
    <li>已完成</li>
  </ul>
  <div class="layui-tab-content">
    <div class="layui-tab-item layui-show">
    	<input type="hidden" value='<c:url value="/"/>' id="url">
     	<table class="layui-hide" id="db" lay-filter="test"></table>
    </div>
   
    <div class="layui-tab-item">
    	<table class="layui-hide" id="yb" lay-filter="test"></table>
    </div>
  </div>
</div>
<script type="text/html" id="barDemo">
  <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail" name="defaultAD" >授权</a>
  <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
  <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>
<script src="../jquery/jquery-3.3.1.js"></script>
<script src="../layui-v2.4.5/layui/layui.js"></script>
<script  type="text/javascript">
//注意：选项卡 依赖 element 模块，否则无法进行功能性操作
layui.use(['element','form','table'], function(){
  var element = layui.element;
  var table = layui.table;
  var url=$('#url').val();
  var form = layui.form;
  table.render({
    elem: '#db'
    ,url:url+'role/roleList.do'
    ,toolbar: '#toolbarDemo'
    ,title: '角色管理'
    ,cols: [[
       {field:'index', width:"8%", title: '序号', sort: true,type:'numbers'}
      ,{field:'role_name', width:"22%",align:'center', title: '角色名称'}
      ,{field:'role_infor', width:"55%", align:'center', title: '角色说明'}
      ,{fixed: 'right', title:'操作', toolbar: '#barDemo', width:"15%",align:'center'}
    ]]
    ,page: true
  });
  //…
  table.render({
	    elem: '#yb'
	    ,url:url+'user/userList.do'
	    ,toolbar: '#toolbarDemo'
	    ,title: '用户管理'
	    ,cols: [[
	       {field:'index', width:"8%", title: '序号', sort: true,type:'numbers'}
	      ,{field:'user_login_name', width:"18%",align:'center', title: '登录名'}
	      ,{field:'user_name', width:"17%", align:'center', title: '姓名'}
	      ,{field:'user_department_name', width:"17%", align:'center', title: '所属部门'}
	      ,{field:'userRoleName', width:"20%", align:'center', title: '角色'}
	      ,{fixed: 'right', title:'操作', toolbar: '#barDemo', width:"20%",align:'center'}
	    ]]
	    ,page: true
	  });
});
</script>
</body>
</html>