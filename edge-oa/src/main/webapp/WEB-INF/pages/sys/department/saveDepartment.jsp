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
<title>添加部门</title>
<link rel="stylesheet" href="../layui-v2.4.5/layui/css/layui.css">
<script src="../jquery/jquery-3.3.1.js"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@page isELIgnored="false" %>
</head>
<body onload="refreshAndClose()">
	<div
		style="margin-top: 70px; margin-left: auto; margin-right: auto; width: auto;">
		<form class="layui-form" action="<c:url value='/department/saveDepartment.do'/>"
			method="post">
			<input type="hidden" id="flag" value="${flag}">
			<div class="layui-form-item">
				<label class="layui-form-label" style="width: 125px;">上级部门</label>
				<div class="layui-input-inline" style="width: 56.5%;">
					<select name="dep_parentid" id="provinces" lay-filter="provinces" lay-verify="provinces">
						<option value="" selected="selected">请选择部门</option>
					</select>
				</div>
			</div>
			
			<div class="layui-form-item" style="margin-bottom:15px;">
				<label class="layui-form-label" style="width: 125px;">部门名称</label>
				<div class="layui-input-block">
					<input type="text" name="dep_name" lay-verify="username"
						autocomplete="off" class="layui-input" style="width: 56.5%"
						id="userName" placeholder="请输入部门名称"> 
				</div>
			</div>
			

			<div class="layui-form-item layui-form-text">
				<label class="layui-form-label" style="width: 125px;">部门描述</label>
				<div class="layui-input-block">
					<textarea placeholder="请输入内容" lay-verify="role_infor"
						class="layui-textarea" style="width: 56.5%" name="dep_description"></textarea>
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
    return true;
  });
	
 
   	
   	form.verify({
		  username: function(value, item){//value：表单的值、item：表单的DOM对象
			 if(value==""){
				 return '部门名称不能为空';
			 }
		    if(!new RegExp("^[a-zA-Z0-9_\u4e00-\u9fa5\\s·]+$").test(value)){
		      return '部门名称不能有特殊字符';
		    }
		    if(/(^\_)|(\__)|(\_+$)/.test(value)){
		      return '部门名称首尾不能出现下划线\'_\'';
		    }
		    if(/^\d+\d+\d$/.test(value)){
		      return '部门名称不能全为数字';
		    }
		  } 
		   ,role_infor: function(value){
		     if(value==""){
		     	 return '部门描述不能为空';
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
</script>
</body>
</html>