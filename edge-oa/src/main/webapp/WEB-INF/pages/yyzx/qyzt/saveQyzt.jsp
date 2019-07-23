<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>新增签约主体</title>
<link rel="stylesheet" href="../layui-v2.4.5/layui/css/layui.css">
<link rel="stylesheet" href="../bootstrap-3.3.7-dist/css/bootstrap.min.css"> 
<link rel="stylesheet" href="../bootstrap-3.3.7-dist/css/bootstrap-theme.min.css"> 
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@page isELIgnored="false" %>
</head>
<body onload="refreshAndClose()" style="width:100%;padding:0px; margin:0px;">
	<div style="width:1280px;height:auto;padding:0px; margin:0 auto;" id="main">
		<form class="layui-form" action='<c:url value="/qyzt/saveQyzt.do"/>' method="post" id="myForm" style="margin-top:100px;">
			<input type="hidden" id="url" value='<c:url value="/"/>'>
			<input type="hidden" id="flag" value="${flag}"> 
			
			<div class="layui-form-item">
			 	<div class="layui-inline" style="left:30px;">
				      <label class="layui-form-label" style="width: 120px;">签约主体代号</label>
				      <div class="layui-input-inline">
				        <input type="text" name="qyztdh" lay-verify="qyztdh" autocomplete="off" class="layui-input" id="qyztdh">
				      </div>
			    </div>
			    
				<div class="layui-inline" style="left:30px;">
				      <label class="layui-form-label" style="width: 120px;">签约主体简称</label>
				      <div class="layui-input-inline">
				        <input type="text" name="qyztjc" lay-verify="qyztjc" autocomplete="off" class="layui-input" id="qyztjc">
				      </div>
			    </div>
				 
			  <div class="layui-inline" style="left:30px;">
				      <label class="layui-form-label" style="width: 120px;">签约主体名称</label>
				      <div class="layui-input-inline">
				        <input type="text" name="qyztmc" lay-verify="qyztmc" autocomplete="off" class="layui-input" id="qyztmc">
				      </div>
			    </div>
			  
			 </div>
		 
		
			 <div class="layui-form-item layui-form-text">
			    <label class="layui-form-label" style="width: 150px;">签约主体描述</label>
			    <div class="layui-input-block">
			      <textarea placeholder="请输入内容" name="qyztms"  lay-verify="qyztms" id="qyztms" class="layui-textarea" style="width:858px;"></textarea>
			    </div>
			</div>
			

			<div class="layui-form-item" style="text-align: center;margin-left: -125px;">
			    <div class="layui-input-block">
			      <button class="layui-btn" lay-submit="" lay-filter="demo1" style="width:35%;margin-top:10px;">立即提交</button>
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