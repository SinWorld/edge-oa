<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>基本资料</title>
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
	<div style="width:740px;height:auto;padding:0px; margin:0 auto;" id="main">
		<form class="layui-form" action='' method="post" id="myForm" style="margin-top:30px;">
			<input type="hidden" id="url" value='<c:url value="/"/>'>
			<input type="hidden" id="flag" value="${flag}"> 
			
			 
			<div class="layui-form-item">
			 	<div class="layui-inline" style="left:10px;">
				      <label class="layui-form-label" style="width: 120px;">登录名</label>
				      <div class="layui-input-inline">
				        <input type="text" name="user_login_name" lay-verify="user_login_name" autocomplete="off" class="layui-input bj" id="user_login_name" value="${user.user_login_name}" disabled="">
				      </div>
			    </div>
			    
				<div class="layui-inline" style="left:30px;">
				      <label class="layui-form-label" style="width: 120px;">用户名</label>
				      <div class="layui-input-inline">
				        <input type="text" name="user_name" lay-verify="user_name" autocomplete="off" class="layui-input bj" id="sxwd_bh" value="${user.user_name}" disabled="">
				      </div>
			    </div>
			    
			 </div>
		 
		 	<div class="layui-form-item">
		 	
		 		<div class="layui-inline" style="left:30px;">
				      <label class="layui-form-label" style="width: 102px;">性别</label>
				      <div class="layui-input-inline">
				      	<c:if test="${user.user_gender eq '0'}">
				          <input type="text" name="sxwd_bh" lay-verify="sxwd_bh" autocomplete="off" class="layui-input bj" id="sxwd_bh" value="男" disabled="">
				      	</c:if>
				      	<c:if test="${user.user_gender eq '1'}">
				          <input type="text" name="sxwd_bh" lay-verify="sxwd_bh" autocomplete="off" class="layui-input bj" id="sxwd_bh" value="女" disabled="">
				      	</c:if>
				      </div>
			    </div>
		 	
				  <div class="layui-inline" style="left:48px;">
				      <label class="layui-form-label" style="width: 120px;">所属部门</label>
				      <div class="layui-input-inline">
				        <input type="text" name="user_department_name" lay-verify="user_department_name" autocomplete="off" class="layui-input bj" id="user_department_name" value="${user.user_department_name}"disabled="">
				      </div>
			    </div>
				 
			    
			 </div>
			 
			 <div class="layui-form-item">
			 
			 	<div class="layui-inline" style="left:10px;">
				      <label class="layui-form-label" style="width: 120px;">所属岗位</label>
				      <div class="layui-input-inline">
				        <input type="text" name="user_posittion_name" lay-verify="user_posittion_name" autocomplete="off" class="layui-input bj" id="user_posittion_name" value="${user.user_posittion_name}" disabled="">
				      </div>
			    </div>
			    
			    <div class="layui-inline" style="left:30px;">
				      <label class="layui-form-label" style="width: 120px;">联系方式</label>
				      <div class="layui-input-inline">
				        <input type="text" name="user_phone" lay-verify="user_phone" autocomplete="off" class="layui-input bj" id="user_phone" value="${user.user_phone}" disabled="">
				      </div>
			    </div>
				 
		 	</div>
		 	
		 	 <div class="layui-form-item">
			 	 <div class="layui-inline" style="left:10px;">
				      <label class="layui-form-label" style="width: 120px;">邮箱</label>
				      <div class="layui-input-inline">
				        <input type="text" name="user_email" lay-verify="user_email" autocomplete="off" class="layui-input bj" id="user_email" value="${user.user_email}" disabled="">
				      </div>
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