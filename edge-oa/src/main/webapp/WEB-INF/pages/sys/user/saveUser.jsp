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
<title>添加用户</title>
<link rel="stylesheet" href="../layui-v2.4.5/layui/css/layui.css">
<script src="../jquery/jquery-3.3.1.js"></script>
<style>
.close {
	float: right;
	position: relative;
	top: -28px;
	right: 17%;
	cursor: pointer;
}
</style>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@page isELIgnored="false" %>
</head>
<body onload="refreshAndClose()">
	<div
		style="margin-top: 5%; margin-left: auto; margin-right: auto; width: auto;">
		<form class="layui-form" action="<c:url value='/user/saveUser.do'/>"
			method="post">
			<input type="hidden" id="flag" value="${flag}">
			<div class="layui-form-item" style="margin-bottom: 0px;">
				<label class="layui-form-label" style="width: 15%">登录名</label>
				<div class="layui-input-block">
					<input type="text" name="user_login_name" lay-verify="user_login_name"
						autocomplete="off" class="layui-input" style="width: 64.5%" id="user_login_name">
					 <span id="clearUser_login_name" class="close"><i class="layui-icon layui-icon-close-fill"></i></span>
				</div>
			</div>
			
			<div class="layui-form-item" style="margin-bottom: 0px;">
				<label class="layui-form-label" style="width: 15%">用户名</label>
				<div class="layui-input-block">
					<input type="text" name="user_name" lay-verify="user_name"
						autocomplete="off" class="layui-input" style="width: 64.5%" id="user_name">
					 <span id="clearUser_name" class="close"><i class="layui-icon layui-icon-close-fill"></i></span>
				</div>
			</div>

		<!-- 	<div class="layui-form-item" style="margin-bottom: 0px;">
				<label class="layui-form-label" style="width: 15%">用户密码</label>
				<div class="layui-input-block">
					<input type="password" name="user_password" lay-verify="user_password"
						autocomplete="off" class="layui-input" style="width: 64.5%" id="user_password">
					 <span id="clearUser_password" class="close"><i class="layui-icon layui-icon-close-fill"></i></span>
				</div>
			</div> -->
			
			<div class="layui-form-item" style="float: right;position: relative;right:52%; margin-bottom: 0px;width: 38%" >
				<label class="layui-form-label" style="width: 15%">性别</label>
				<div class="layui-input-block">
					<input type="radio" name="user_gender" value="0" title="男" checked  lay-filter="user_gender">
					<input type="radio" name="user_gender" value="1" title="女"  lay-filter="user_gender">
				</div>
			</div>

			<div class="layui-form-item" style="margin-bottom: 10px;">
				<label class="layui-form-label" style="width: 15%">所属部门</label>
				<div class="layui-input-inline">
					<select name="user_department_id" id="provinces" lay-filter="provinces" lay-verify="provinces">
						<option value="" selected="selected">请选择部门</option>
					</select>
				</div>
			</div>
			
			<div class="layui-form-item" style="margin-bottom: 10px;">
				<label class="layui-form-label" style="width: 15%">所属岗位</label>
				<div class="layui-input-inline">
					<select name="user_posittion" id="user_posittion" lay-filter="user_posittion" lay-verify="user_posittion">
						<option value="" selected="selected">请选择岗位</option>
					</select>
				</div>
			</div>

			<div class="layui-form-item" style="margin-bottom: 0px;">
				<label class="layui-form-label" style="width: 15%">联系方式</label>
				<div class="layui-input-block">
					<input type="text" name="user_phone" lay-verify="user_phone"
						autocomplete="off" class="layui-input" style="width: 64.5%" id="user_phone">
					 <span id="clearUser_phone" class="close"><i class="layui-icon layui-icon-close-fill"></i></span>
				</div>
			</div>
			
			<div class="layui-form-item" style="margin-bottom: 0px;">
				<label class="layui-form-label" style="width: 15%">邮箱</label>
				<div class="layui-input-block">
					<input type="text" name="user_email" lay-verify="user_email"
						autocomplete="off" class="layui-input" style="width: 64.5%" id="user_email">
					<span id="clearUser_email" class="close"><i class="layui-icon layui-icon-close-fill"></i></span>
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
  initOrgTree(form);
  form.render();
 
  //监听提交
  form.on('submit(demo1)', function(data){
    layer.alert(JSON.stringify(data.field), {
      title: '最终的提交信息'
    })
    //alert($('#provinces').val());
    return true;
  });
	
   	form.verify({
   		user_login_name: function(value, item){ //value：表单的值、item：表单的DOM对象
   			if(value==""){
		     	 return '登录名不能为空';
		     }
		    if(!new RegExp("^[a-zA-Z0-9_\u4e00-\u9fa5\\s·]+$").test(value)){
		      return '登录名不能有特殊字符';
		    }
		    if(/(^\_)|(\__)|(\_+$)/.test(value)){
		      return '登录名首尾不能出现下划线\'_\'';
		    }
		    if(/^\d+\d+\d$/.test(value)){
		      return '登录名不能全为数字';
		    }
		  } 
   	
	   	,user_name: function(value, item){ //value：表单的值、item：表单的DOM对象
	   		if(value==""){
		     	 return '用户名不能为空';
		     }
		    if(!new RegExp("^[a-zA-Z0-9_\u4e00-\u9fa5\\s·]+$").test(value)){
		      return '用户名不能有特殊字符';
		    }
		    if(/(^\_)|(\__)|(\_+$)/.test(value)){
		      return '用户名首尾不能出现下划线\'_\'';
		    }
		    if(/^\d+\d+\d$/.test(value)){
		      return '用户名不能全为数字';
		    }
		  } 
	   	
	   	,user_phone: function(value, item){ //value：表单的值、item：表单的DOM对象
	   		if(value==""){
		     	 return '联系方式不能为空';
		     }
		  } 
	   	
	   ,user_email: function(value){
	     if(value==""){
	     	 return '邮箱不能为空';
	     }
	   }
	}); 
   	queryAllPosittion(form);
});

//登录名清除
	$('#clearUser_login_name').click(function(){
		$('#user_login_name').val("");
	});
	
//用户名清除
	$('#clearUser_name').click(function(){
		$('#user_name').val("");
	});

//用户密码清除
	$('#clearUser_password').click(function(){
		$('#user_password').val("");
	});

//联系方式清除
	$('#clearUser_phone').click(function(){
		$('#user_phone').val("");
	});

//邮箱清除
	$('#clearUser_email').click(function(){
		$('#user_email').val("");
	});

function refreshAndClose(){
	var flag=$('#flag').val();
	if(flag){
		window.parent.location.reload();
		window.close();
	}
}

//ajax实现部门树初始化
function initOrgTree(form) {
	$.ajax({
		type : "post",
		url : "<c:url value='/department/orgDepartment.do'/>",
		async : false,
		dataType : 'json',
		error : function() {
			alert("出错");
		},
		success : function(msg) {
			for (var i = 0; i < msg.length; i++) {
				for(var j=0;j<msg[i].length;j++){
					$("#provinces").append(
					    "<option value='"+msg[i][j].dep_id+"'>"+ msg[i][j].dep_name +"</option>"); 
				}
			}
			form.render('select');
		}
	});
}

//ajax加载所有的岗位
function queryAllPosittion(form) {
	$.ajax({
		type : "post",
		url : "<c:url value='/user/queryAllPosittion.do'/>",
		async : false,
		dataType : 'json',
		error : function() {
			alert("出错");
		},
		success : function(msg) {
				for(var j=0;j<msg.length;j++){
					$("#user_posittion").append(
					    "<option value='"+msg[j].posittion_dm+"'>"+ msg[j].posittion_mc +"</option>"); 
				}
				form.render('select');
			}
	});
}
</script>
</body>
</html>