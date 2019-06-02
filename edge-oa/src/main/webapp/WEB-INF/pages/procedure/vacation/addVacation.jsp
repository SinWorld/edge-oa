<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>发起请假申请</title>
<link rel="stylesheet" href="../layui-v2.4.5/layui/css/layui.css">
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@page isELIgnored="false" %>
<style>
	.close{
		float: right;
	    position: relative;
	    top: -28px;
	    right: 26%;
	   	cursor:pointer;
	}
</style>
</head>
<body onload="refreshAndClose()">
<div style="margin-top: 70px; margin-left: auto; margin-right: auto; width: auto;">
		<form class="layui-form" action="<c:url value='/vacation/addVacation.do'/>"
			method="post">
			<div class="layui-form-item" style="margin-bottom: 0px;">
				<input type="hidden" id="flag" value="${flag}">
				<label class="layui-form-label" style="width: 125px;">请假天数</label>
				<div class="layui-input-block">
					<input type="text" name="days" lay-verify="days"
						autocomplete="off" class="layui-input" style="width: 56.5%"
						id="days" placeholder="请输入请假天数"> 
				    <span id="clearDays" class="close">
				    	<i class="layui-icon layui-icon-close-fill"></i>
				    </span>
				</div>
			</div>
			
			<div class="layui-form-item" style="margin-bottom: 0px;">
				<label class="layui-form-label" style="width: 125px;">请假原因</label>
				<div class="layui-input-block">
					<input type="text" name="reason" lay-verify="reason"
						autocomplete="off" class="layui-input" style="width: 56.5%"
						id="reason" placeholder="请输入请假原因"> 
				    <span id="clearReason" class="close">
				    	<i class="layui-icon layui-icon-close-fill"></i>
				    </span>
				</div>
			</div>

			<div class="layui-form-item layui-form-text">
				<label class="layui-form-label" style="width: 125px;">备注</label>
				<div class="layui-input-block">
					<textarea placeholder="请输入内容" lay-verify="remark"
						class="layui-textarea" style="width: 56.5%" name="remark"></textarea>
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
<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 --> 
 <script type="text/javascript" src="../jquery/jquery-3.3.1.js"></script>
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
		
	 	//请假天数清除
	   	$('#clearDays').click(function(){
	   		$('#days').val("");
	   	});
	 	
	  //请假原因清除
	   	$('#clearReason').click(function(){
	   		$('#reason').val("");
	   	});
	 	
	   	form.verify({
	   		days: function(value, item){ //value：表单的值、item：表单的DOM对象
	   		  if(value==""){
			     	 return '请假天数不能为空';
			     }
			  } 
		   ,reason: function(value){
		     if(value==""){
		     	 return '请假原因不能为空';
		     }
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