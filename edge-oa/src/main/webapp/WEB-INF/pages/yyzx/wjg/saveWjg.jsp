<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>新增文件夹</title>
<link rel="stylesheet" href="../layui-v2.4.5/layui/css/layui.css">
<script src="../jquery/jquery-3.3.1.js"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@page isELIgnored="false" %>
</head>
<body onload="refreshAndClose()" style="width:100%;padding:0px; margin:0px;text-align: center;">
<div style="height:auto;padding:0px; margin:0 auto;" id="main">
	<form class="layui-form" action="<c:url value='/wjg/saveWjj.do'/>" method="post">
		<input type="hidden" id="url" value='<c:url value="/"/>'>
		<input type="hidden" id="flag" value="${flag}">
		<input type="hidden" name="flwjj" value="${wjj.id}"> 
			
			<div class="layui-form-item" style="margin-top: 5%">
			    <label class="layui-form-label" style="width: 150px;">父类文件夹</label>
			    <div class="layui-input-block">
			      <input type="text"  autocomplete="off" value="${wjj.title}" class="layui-input" style="width: 51.4%" disabled="">
			    </div>
			</div>
			
			<div class="layui-form-item" style="margin-top: 5%">
			    <label class="layui-form-label" style="width: 150px;">文件夹名称</label>
			    <div class="layui-input-block">
			      <input type="text" name="title" lay-verify="title" autocomplete="off" placeholder="请输入文件夹名称" class="layui-input" style="width: 51.4%" id="title">
			    </div>
			</div>
		
			<div class="layui-form-item">
			    <div class="layui-input-block">
			      <button class="layui-btn" lay-submit="" lay-filter="demo1" style="width:35%;margin-top:10px;">立即提交</button>
			    </div>
			</div>
	</form>
 </div>
 <script src="../layui-v2.4.5/layui/layui.js" charset="utf-8"></script>
 <script>
	layui.use(['form', 'layedit',], function(){
	  var form = layui.form
	  ,layer = layui.layer
	  ,layedit = layui.layedit;
	 
	  //自定义验证规则
	  form.verify({
		  title: function(value,item){
	      if(value==""||value==null){
	        return '文件夹名称不能为空';
	      }
	    }
	  });
	  
	  //监听提交
	  form.on('submit(demo1)', function(data){
	    layer.alert(JSON.stringify(data.field), {
	      title: '最终的提交信息'
	    })
	    return true;
	  });
	});
	
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