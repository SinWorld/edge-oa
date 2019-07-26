<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>查看</title>
<link rel="stylesheet" href="../layui-v2.4.5/layui/css/layui.css">
<link rel="stylesheet" href="../bootstrap-3.3.7-dist/css/bootstrap.min.css"> 
<link rel="stylesheet" href="../bootstrap-3.3.7-dist/css/bootstrap-theme.min.css"> 
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@page isELIgnored="false" %>
<style>
  .bj{background-color: #F0F0F0}
 </style>
</head>
<body  style="width:100%;padding:0px; margin:0px;">
	<div style="width:1280px;height:auto;padding:0px; margin:0 auto;" id="main">
		<form class="layui-form" action='' style="margin-top:30px;">
			
			<div class="layui-form-item">
			 	<div class="layui-inline" style="left:30px;">
				      <label class="layui-form-label" style="width: 120px;">客户代号</label>
				      <div class="layui-input-inline">
				        <input type="text" name="qyztdh" lay-verify="qyztdh" autocomplete="off" class="layui-input bj" id="qyztdh" value="${kh.khdh}"  disabled="">
				      </div>
			    </div>
			    
			     <div class="layui-inline" style="left:30px;">
				      <label class="layui-form-label" style="width: 120px;">客户简称</label>
				      <div class="layui-input-inline">
				        <input type="text" name="khjc" lay-verify="khjc" autocomplete="off" class="layui-input bj" id="khjc" value="${kh.khjc}"  disabled="">
				      </div>
			    </div>
				
				 
			  <div class="layui-inline" style="left:30px;">
				      <label class="layui-form-label" style="width: 120px;">客户名称</label>
				      <div class="layui-input-inline">
				        <input type="text" name="khmc" lay-verify="khmc" autocomplete="off" class="layui-input bj" id="khmc" value="${kh.khmc}"  disabled="">
				      </div>
			    </div>
			  
			 </div>
		 
		
			 <div class="layui-form-item layui-form-text">
			    <label class="layui-form-label" style="width: 150px;">客户描述</label>
			    <div class="layui-input-block">
			      <textarea placeholder="请输入内容" name="qyztms"  lay-verify="qyztms" id="qyztms" class="layui-textarea bj" style="width:858px;" disabled="">${kh.khms}</textarea>
			    </div>
			</div>
	</form>
 </div>
<script src="../layui-v2.4.5/layui/layui.js" charset="utf-8"></script>
<script src="../jquery/jquery-3.3.1.js"></script>
<script>
layui.use(['form', 'layedit', 'laydate'], function(){
  var form = layui.form
  ,layer = layui.layer
  ,layedit = layui.layedit
  ,laydate = layui.laydate;
  var url=$('#url').val();
  form.render();

  //创建一个编辑器
  var editIndex = layedit.build('LAY_demo_editor');
});
</script>
</body>
</html>