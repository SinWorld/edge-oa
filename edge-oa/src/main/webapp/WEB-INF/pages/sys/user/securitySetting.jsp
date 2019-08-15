<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改密码</title>
<link rel="stylesheet" href="../layui-v2.4.5/layui/css/layui.css">
  <%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
  <%@page isELIgnored="false" %>
</head>
<body style="width:100%;padding:0px; margin:0px;text-align: center;" onload="refreshAndClose()">
<div style="width:560px;height:auto;padding:0px; margin:0 auto;" id="main">
	<form class="layui-form"  lay-filter="example" style="text-align: center;margin-top: 35px;" id="myForm">  
		  <div class="layui-form-item">
		  	<div class="layui-inline" style="left: 23px;">
			    <label class="layui-form-label">原密码</label>
			    <div class="layui-input-inline">
			      <input type="password" name="oldPassword" id="oldPassword" lay-verify="oldPassword" placeholder="请输入原密码" autocomplete="off" class="layui-input" onblur="oldPasswordCheck(this)" style="width: 300px;">
			    </div>
		     </div>
		     <div class="layui-inline" style="left: 23px;">
		     	<div class="layui-input-inline">
			      <span>
			      	<i class="layui-icon" style="color: green" id="zq">&#xe605;</i>
			      	<i class="layui-icon" style="color: red" id="cw">&#x1006;</i>
			      </span>
			    </div>
		    </div>
		  </div>
		  
		  <input type="hidden" value="${userId}" id="userId" name="userId">
		  <input type="hidden" id="flag">
		  <input type="hidden" id="url" value='<c:url value="/"/>'>
		  <input type="hidden" id="tc" value="${flag}">
		  
		  <div class="layui-form-item">
		    <label class="layui-form-label" style="width: 116px;">新密码</label>
		    <div class="layui-input-block">
		      <input type="password" name="newPassword" id="newPassword" lay-verify="newPassword" placeholder="请输入新密码" autocomplete="off" class="layui-input" style="width: 300px;">
		    </div>
		  </div>
		  
		  <div class="layui-form-item">
		    <label class="layui-form-label"  style="width: 116px;">确认密码</label>
		    <div class="layui-input-block">
		      <input type="password"  id="surePassword"  lay-verify="surePassword" placeholder="请确认密码" autocomplete="off" class="layui-input" style="width: 300px;">
		    </div>
		  </div>
		  
		  <div class="layui-form-item">
		    <div class="layui-input-block">
		      <button class="layui-btn" lay-submit=""  id="tj"  type="button" lay-filter="demo1">立即提交</button>
		    </div>
		  </div>
	</form>
</div>
<script src="../layui-v2.4.5/layui/layui.js"></script>
<script type="text/javascript" src="../jquery/jquery-3.3.1.js"></script>
<script>
layui.use(['form', 'layedit', 'laydate'], function(){
  var form = layui.form
  ,layer = layui.layer
  ,layedit = layui.layedit
  ,laydate = layui.laydate;
  
  tb();
  
	form.verify({
		oldPassword: function(value, item){ //value：表单的值、item：表单的DOM对象
   			if(value==""){
		     	 return '原密码不能为空';
		     }
		  } 
	   	,newPassword: function(value, item){ //value：表单的值、item：表单的DOM对象
	   		if(value==""){
		     	 return '新密码不能为空';
		     }
	   		if(value.length<6){
	   			return '密码长度不能小于6位';
	   		}
		  } 
	   	,surePassword: function(value, item){ //value：表单的值、item：表单的DOM对象
	   		var newPassword=$('#newPassword').val();
	   		if(value!=newPassword){
		     	 return '确认密码不一致';
		     }
		  } 
	}); 
});

//输入原密码ajax验证
function oldPasswordCheck(obj){
	//获得输入对象的值
	var oldPasswordValue=obj.value;
	//获得当前用户主键
	var userId=$('#userId').val();
	 $.ajax({
		type : "post",
		url : "<c:url value='/user/checkPassword.do'/>",
		async : false,
		dataType : 'json',
		error : function() {
			alert("出错");
		},
		data : {"userId":userId,"oldPasswordValue":oldPasswordValue},
		success : function(msg) {
			var flag=msg.flag;
			if(flag){
				$('#zq').show();
				$('#cw').hide();
			}else{
				$('#cw').show();
				$('#zq').hide();
			}
			$('#flag').val(flag);
		}
	}); 
	
}

function tb(){
	$('#zq').hide();
	$('#cw').hide();
}

$('#tj').click(function(){
	//获得当前表单
	var form=document.getElementById('myForm');
	var url=$("#url").val();
	var flag=$('#flag').val();
	form.action=url+"user/setPassword.do";
	if(flag=='true'){
		 form.submit();
	}else{
		  return layer.alert("原密码输入错误",{icon:2});
	}
});

function refreshAndClose(){
	var flag=$('#tc').val();
	if(flag){
		window.close();
		top.location.href='<c:url value="/login/initLogin.do"/>';
	} 
}

</script>
</body>
</html>