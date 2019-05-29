<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>部署流程定义</title>
<link rel="stylesheet" href="../layui-v2.4.5/layui/css/layui.css">
<script src="../jquery/jquery-3.3.1.js"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@page isELIgnored="false"%>
</head>
<body onload="refreshAndClose()">
	<form action='<c:url value="/processDefinition/deploy.do"/>' method="post" enctype="multipart/form-data">
		<div style="margin-top: 10%">
			<label class="layui-form-label" style="width: 28%;padding-top: 0%">请选择流程定义文档(zip格式)</label>
			<div>
				<input type="file" name="resource" class="InputStyle" style="width:450px;" id="resource"/> 
				<input type="hidden" id="flag" value="${flag}">
			</div>
		</div>
		 <div class="layui-input-block">
	      <button class="layui-btn" lay-submit="" lay-filter="demo1" style="width:35%;margin-top:5%;">立即提交</button>
	    </div>
    </form>
    <script src="../layui-v2.4.5/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript">
	    layui.use(['form','layedit','laydate'], function(){
	    	  var form = layui.form
	    	  ,layer = layui.layer
	    	  ,layedit = layui.layedit
	    	  ,laydate = layui.laydate;
	    	  form.render();
	    	  
	    	  //监听提交
	    	  form.on('submit(demo1)', function(data){
	    		  var resource=$('#resource').val();
	    		  if(resource==""){
	    			  layer.alert('请上传流程定义文件', {
	    					icon : 7
	    			});
	    			  return false;
	    		  }else{
	    			  layer.alert(JSON.stringify(data.field), {
	    	    	      title: '最终的提交信息'
	    	    	    })
	    	    	    return true;
	    		  }
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