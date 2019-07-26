<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>新增客户系统</title>
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
		<form class="layui-form" action='<c:url value="/khxt/editKHXT.do"/>' method="post" id="myForm" style="margin-top:30px;">
			<input type="hidden" id="url" value='<c:url value="/"/>'>
			<input type="hidden" id="khdm" value="${khxt.khxt_khdm}"> 
			<input type="hidden" id="flag" value="${flag}"> 
			<input type="hidden" name="khxt_dm" value="${khxt.khxt_dm}">
			
			<div class="layui-form-item">
			 	<div class="layui-inline" style="left:10px;">
				      <label class="layui-form-label" style="width: 120px;">代号</label>
				      <div class="layui-input-inline">
				        <input type="text" name="khxt_dh" lay-verify="khxt_dh" autocomplete="off" class="layui-input bj" id="khxt_dh" value="${khxt.khxt_dh}" disabled="">
				      </div>
			    </div>
			    
				<div class="layui-inline" style="left:30px;">
				      <label class="layui-form-label" style="width: 120px;">名称</label>
				      <div class="layui-input-inline">
				        <input type="text" name="khxt_mc" lay-verify="khxt_mc" autocomplete="off" class="layui-input bj" id="khxt_mc" value="${khxt.khxt_mc}" disabled="">
				      </div>
			    </div>
				 
				 <div class="layui-inline" style="left:30px;">
				      <label class="layui-form-label" style="width:77px;">客户</label>
				      <div class="layui-input-inline">
				        <input type="text" name="khxt_khdm" lay-verify="khxt_khdm" autocomplete="off" class="layui-input bj" id="khxt_mc" value="${khxt.khxt_khmc}" disabled="">
				      </div>
			    </div>
			  
			 </div>
		 
		 	<div class="layui-form-item">
			 	<div class="layui-inline" style="left:10px;">
				      <label class="layui-form-label" style="width: 120px;">客户部门</label>
				      <div class="layui-input-inline">
				        <input type="text" name="khxt_khbm" lay-verify="khxt_khbm" autocomplete="off" class="layui-input bj" id="khxt_khbm" value="${khxt.khxt_khbm}" disabled="">
				      </div>
			    </div>
			    
				<div class="layui-inline" style="left:40px;">
				      <label class="layui-form-label" style="width:110px;">客户负责人</label>
				      <div class="layui-input-inline">
				        <input type="text" name="khxt_khfzr" id="khxt_khfzr" lay-verify="khxt_khfzr"  autocomplete="off" class="layui-input bj" value="${khxt.khxt_khfzr}" disabled="">
				      </div>
			    </div>
				 
			    <div class="layui-inline" style="left:28px;">
				      <label class="layui-form-label" style="width: 90px;">上线日期</label>
				      <div class="layui-input-inline">
				        <input type="text" name="khxt_sxrq" id="khxt_sxrq" lay-verify="khxt_sxrq" placeholder="yyyy-mm-dd" autocomplete="off" class="layui-input bj" value="${khxt.sxrq}" disabled="">
				      </div>
			    </div>
			  
			 </div>
		 
			 <div class="layui-form-item layui-form-text">
			    <label class="layui-form-label" style="width: 128px;">备注</label>
			    <div class="layui-input-block">
			      <textarea placeholder="请输入内容" name="khxt_bz"  lay-verify="khxt_bz" id="khxt_bz" class="layui-textarea bj" style="width:840px;" disabled="">${khxt.khxt_bz}</textarea>
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