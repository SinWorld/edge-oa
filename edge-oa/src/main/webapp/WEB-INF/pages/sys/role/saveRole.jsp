<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<title>添加角色</title>
<link rel="stylesheet" href="../layui-v2.4.5/layui/css/layui.css">
<script src="../jquery/jquery-3.3.1.js"></script>
<style>
.close {
	float: right;
	position: relative;
	top: -28px;
	right: 26%;
	cursor: pointer;
}
</style>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@page isELIgnored="false" %>
</head>
<body onload="refreshAndClose()">
	<div
		style="margin-top: 70px; margin-left: auto; margin-right: auto; width: auto;">
		<form class="layui-form" action="<c:url value='/role/saveRole.do'/>"
			method="post">
			<div class="layui-form-item" style="margin-bottom: 0px;">
				<input type="hidden" id="flag" value="${flag}">
				<label class="layui-form-label" style="width: 125px;">角色名称</label>
				<div class="layui-input-block">
					<input type="text" name="role_name" lay-verify="username"
						autocomplete="off" class="layui-input" style="width: 56.5%"
						id="userName" placeholder="请输入角色名称"> <span id="clearUserName" class="close"><i
						class="layui-icon layui-icon-close-fill"></i></span>
				</div>
			</div>

			<div class="layui-form-item layui-form-text">
				<label class="layui-form-label" style="width: 125px;">角色说明</label>
				<div class="layui-input-block">
					<textarea placeholder="请输入内容" lay-verify="role_infor"
						class="layui-textarea" style="width: 56.5%" name="role_infor"></textarea>
				</div>
			</div>

			<div class="layui-form-item" style="text-align: center;">
				<div class="layui-input-block">
					<button class="layui-btn" lay-submit="" lay-filter="demo1"
						style="width: 35%; margin-top: 10px;">立即提交</button>
					<!--  <button type="reset" class="layui-btn layui-btn-primary">重置</button> -->
				</div>
			</div>
		</form>
	</div>
	<script src="../layui-v2.4.5/layui/layui.js" charset="utf-8"></script>
	<script>

layui.use(['form', 'layedit', 'laydate'], function(){
  var form = layui.form
  ,layer = layui.layer
  ,layedit = layui.layedit
  ,laydate = layui.laydate;
  form.render();
 
  //监听提交
  form.on('submit(demo1)', function(data){
    layer.alert(JSON.stringify(data.field), {
      title: '最终的提交信息'
    })
    return true;
  });
	
 	//用户名清除
   	$('#clearUserName').click(function(){
   		$('#userName').val("");
   	});
   	
   	form.verify({
		  username: function(value, item){ //value：表单的值、item：表单的DOM对象
		    if(!new RegExp("^[a-zA-Z0-9_\u4e00-\u9fa5\\s·]+$").test(value)){
		      return '角色名不能有特殊字符';
		    }
		    if(/(^\_)|(\__)|(\_+$)/.test(value)){
		      return '角色名首尾不能出现下划线\'_\'';
		    }
		    if(/^\d+\d+\d$/.test(value)){
		      return '角色名不能全为数字';
		    }
		  } 
		 
		   ,role_infor: function(value){
		     if(value==""){
		     	 return '角色说明不能为空';
		     }
		   }
	}); 
}
);

function refreshAndClose(){
	var flag=$('#flag').val();
	if(flag){
		window.parent.location.reload();
		window.close();
	}
}
</script>
</body>
</html>