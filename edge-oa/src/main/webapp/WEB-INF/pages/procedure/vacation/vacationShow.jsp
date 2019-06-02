<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>请假查看页</title>
<link rel="stylesheet" href="../layui-v2.4.5/layui/css/layui.css">
<link rel="stylesheet" href="../login/css/static.css">
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@page isELIgnored="false" %>
<style>
  #draggable { width: 150px; height: 150px; padding: 0.5em; }
 </style>
</head>
<body>
	<div class="layui-tab">
	  <ul class="layui-tab-title">
	    <li class="layui-this">基本信息</li>
	    <li>评审意见</li>
	    <li>流程检视</li>
	  </ul>
	  <div class="layui-tab-content">
	    <div class="layui-tab-item layui-show">
	    	<div class="layui-form-item" style="margin-bottom: 0px;">
				<label class="layui-form-label" style="width: 125px;">请假天数</label>
				<div class="layui-input-block " style="margin-bottom: 2%;">
				<input type="hidden" value='<c:url value="/"/>' id="url">
				<input type="hidden" value="${deploymentId}" id="depId">
				<input type="hidden" value="${imageName }" id="imgName">
					<input type="text" name="days" lay-verify="days"
						autocomplete="off" class="layui-input" style="width: 56.5%"
						id="days" value="${vacation.days}" readonly="readonly"> 
					<input type="hidden" id="taskId" value="${taskId}" >	
				</div>			
			</div>
			
			<div class="layui-form-item" style="margin-bottom: 2%;">
				<label class="layui-form-label" style="width: 125px;">请假事由</label>
				<input type="text" name="reason" lay-verify="reason"
					autocomplete="off" class="layui-input" style="width: 56.5%"
					id="reason" value="${vacation.reason}" readonly="readonly"> 
			</div>

			<div class="layui-form-item layui-form-text" style="margin-bottom: 2%;">
				<label class="layui-form-label" style="width: 125px;">备注</label>
				<div class="layui-input-block">
					<textarea placeholder="请输入内容" lay-verify="remark"
						class="layui-textarea " style="width: 56.5%" name="remark" readonly="readonly">${vacation.remark}</textarea>
				</div>
			</div>
	    </div>
	   
	    <div class="layui-tab-item">
	    	<ul class="layui-timeline">
	    	<c:forEach items="${reviewOpinions }" var="r">
			  <li class="layui-timeline-item">
			    <i class="layui-icon layui-timeline-axis"></i>
			    <div class="layui-timeline-content layui-text">
			      <h3 class="layui-timeline-title">${r.time}&nbsp;&nbsp;&nbsp;${r.userName}--->已办理</h3>
			      <p>
			      	审批结果:<span style="color: green">${r.result }</span>
			      	<br>
			      	审批意见:<span style="color: green">${r.advise }</span>
			      </p>
			    </div>
			  </li>
			  </c:forEach>
			</ul> 
	    </div>
	    
	     <div class="layui-tab-item">
	    	<img style="position: absolute;top: 0px;left: 0px;" id="lct" src=''>
	    </div>
	  </div>
	</div>

	<!-- <div style="margin-top: 70px; margin-left: auto; margin-right: auto; width: auto;"> -->
			
			
			 
			
		<!-- 操作 Begin -->
		<div id="myMenu" class="m-operation_box" style="width: 140px;">
			<h3 class="u-operation_title">操作</h3>
			<div>
				<ul class="u-menu_option">
					<li id="_zxys_deal_btn">处理</li>
					<li id="_zxys_retake_btn">收回</li>
					<li id="_zxys_transmit_btn">转交</li>
					<li id="_zxys_reject_btn">退回上一步</li>
					<li id="_zxys_gaveUp_btn">放弃流程</li>
					<li id="_zxys_restart_btn">重启流程</li>
				</ul>
			</div>
		</div>
		<!-- 操作 End -->
	<!-- </div> -->
<script src="../layui-v2.4.5/layui/layui.js" charset="utf-8"></script>
<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 --> 
 <script type="text/javascript" src="../jquery/jquery-3.3.1.js"></script>
<script type="text/javascript" src="../jquery-easyui-1.7.0/jquery.easyui.min.js"></script>
 <script type="text/javascript">
 layui.use(['form', 'layedit', 'laydate','element'], function(){
	  var form = layui.form
	  ,layer = layui.layer
	  ,layedit = layui.layedit
	  ,laydate = layui.laydate;
	  var element = layui.element;
	  lct();
	  form.render();
	 
 });
 
	 $("#myMenu").draggable(); 
	 
	 $('#_zxys_deal_btn').click(function(){
		 var url=$('#url').val();
		 var taskId=$('#taskId').val();
		 layer.open({
	       	  	type:2,
	       	  	title:'结果审批',
	       	  	area: ['40%','70%'],
	       		shadeClose: false,
	       		resize:false,
	       	    anim: 4,
	       	  	content:[url+"vacation/initResult.do?task_id="+taskId,'yes']
	     	  });
	 });
	 
	 function lct(){
	 	var img=$('#lct');
	 	var deploymentId=$('#depId').val();
	 	var imageName=$('#imgName').val();
	 	var url=$('#url').val();
	 	img.attr("src",url+"vacation/viewImage.do?deploymentId="+deploymentId+"&imageName="+imageName)
	 }
 
 </script>
</body>
</html>