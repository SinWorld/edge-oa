<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>售后项目查看</title>
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
		<form class="layui-form" action='' method="post" id="myForm" style="margin-top:30px;">
			<input type="hidden" id="url" value='<c:url value="/"/>'>
			
			<div class="layui-form-item">
			 	<div class="layui-inline" style="left:10px;">
				      <label class="layui-form-label" style="width: 120px;">售后项目代号</label>
				      <div class="layui-input-inline">
				        <input type="text" name="shxm_dh" lay-verify="shxm_dh" autocomplete="off" class="layui-input bj" id="shxm_dh" value="${shxm.shxm_dh}" disabled="">
				      </div>
			    </div>
			    
				<div class="layui-inline" style="left:30px;">
				      <label class="layui-form-label" style="width: 120px;">售后项目名称</label>
				      <div class="layui-input-inline" style="width: 500px;">
				        <input type="text" name="shxm_mc" lay-verify="shxm_mc" autocomplete="off" class="layui-input bj" id="shxm_mc" style="width: 485px;" value="${shxm.shxm_mc}" disabled="">
				      </div>
			    </div>
				 
			 </div>
		 
		 	<div class="layui-form-item">
			 	
				 <div class="layui-inline" style="left:9px;">
				      <label class="layui-form-label" style="width: 120px;">客户</label>
				      <div class="layui-input-inline" style="width: 305px;">
				        <input type="text" name="shxm_mc" lay-verify="shxm_mc" autocomplete="off" class="layui-input bj" id="shxm_mc" style="width:300px;" value="${shxm.khmc}" disabled=""> 
				      </div>
			    </div>
			    
				<div class="layui-inline" style="left:-13px;">
				      <label class="layui-form-label" style="width: 120px;">签约主体</label>
				      <div class="layui-input-inline" style="width:413px;">
				        <input type="text" name="shxm_mc" lay-verify="shxm_mc" autocomplete="off" class="layui-input bj" id="shxm_mc" style="width: 412px;" value="${shxm.qyztmc}" disabled="">
				      </div>
			    </div>
				 
			 </div>
		 
			 <div class="layui-form-item layui-form-text">
			    <label class="layui-form-label" style="width: 128px;">项目描述</label>
			    <div class="layui-input-block">
			      <textarea placeholder="请输入内容" name="shxm_ms"  lay-verify="shxm_ms" id="shxm_ms" class="layui-textarea bj" style="width:840px;" disabled="">${shxm.shxm_ms}</textarea>
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
  
  //监听提交
  form.on('submit(demo1)', function(data){
    layer.alert(JSON.stringify(data.field), {
      title: '最终的提交信息'
    })
    return true;
  });
  
});

</script>
</body>
</html>