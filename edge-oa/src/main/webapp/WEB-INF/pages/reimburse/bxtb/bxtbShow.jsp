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
<title>报销填报查看页</title>
<link rel="stylesheet" href="../layui-v2.4.5/layui/css/layui.css">
<link rel="stylesheet" href="../login/css/static.css">
<script src="../jquery/jquery-3.3.1.js"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@page isELIgnored="false" %>
<style>
  .bj{background-color: #F0F0F0}
 </style>
</head>
<body style="width:100%;padding:0px; margin:0px;text-align: center;">
<div class="layui-tab">
	  <ul class="layui-tab-title">
	    <li class="layui-this">基本信息</li>
	    <li>评审意见</li>
	    <li>流程检视</li>
	  </ul>
		<div class="layui-tab-content">
			<div class="layui-tab-item layui-show">
				<div style="width:1280px;height:auto;padding:0px; margin:0 auto;" id="main">
					<form class="layui-form" action="" method="post">
						<input type="hidden" id="url" value='<c:url value="/"/>'>
						<input type="hidden" value="${deploymentId}" id="depId">
						<input type="hidden" value="${imageName }" id="imgName">
						<input type="hidden" id="flag" value="${flag}">
						<input type="hidden" id="taskId" value="${taskId}" >
						<input type="hidden" id="objId" value="${reimbursement.reimbursement_dm}">
						
						
						<div class="layui-form-item">
						    <label class="layui-form-label" style="width:60px;">项目名称</label>
						    <div class="layui-input-block">
						      <input type="text"  lay-verify="budget_Name" value="${xmxx.budget_Name}" disabled="" autocomplete="off" class="layui-input bj" style="width:52.8%">
						    </div>
						</div>
						
						
						<div class="layui-form-item">
						 	<div class="layui-inline">
							      <label class="layui-form-label" style="width: 60px;">审批编号</label>
							      <div class="layui-input-inline">
							        <input type="text"  lay-verify="reimbursement_code" autocomplete="off" value="${reimbursement.reimbursement_code}" class="layui-input bj" disabled="">
							      </div>
						    </div>
							<div class="layui-inline" style="left:182px;">
							  	<label class="layui-form-label" style="width: 60px;">费用类型</label>
								<div class="layui-input-inline">
							        <input type="text" lay-verify="reimbursement_code" autocomplete="off" class="layui-input bj" disabled="" value="${fylx.fylx_mc}">
							      </div>
							 </div>
						 </div>
						 
						 <div class="layui-form-item">
							 <div class="layui-inline" style="left:-21px;">
								      <label class="layui-form-label">发生日期</label>
								      <div class="layui-input-inline">
								        <input type="text"  lay-verify="reimbursement_begintime" value="${reimbursement.fsrq}" autocomplete="off" class="layui-input bj" disabled="">
								      </div>
							 </div>
						     <div class="layui-inline" style="left: 132px;top: 7px;">
							      <label class="layui-form-label" style="width: 90px;">报销金额</label>
							      <div class="layui-input-inline" style="width: 190px;">
							        <input type="text"  lay-verify="reimbursement_bxje" autocomplete="off" class="layui-input bj" value="${reimbursement.reimbursement_bxje}" disabled="">
							        <span style="position: relative;top: -25px;right: -195px;">元</span>
							      </div>
						    </div>
						</div>  
						
						<div class="layui-form-item">
							<div class="layui-inline">
							  	<label class="layui-form-label" style="width: 60px;">费用所属</label>
								<div class="layui-input-inline">
							        <input type="text" lay-verify="reimbursement_bxr" autocomplete="off" class="layui-input bj" value="${user.user_name}" disabled="">
							      </div>
							 </div>
				 
						    <div class="layui-inline" style="left:196px;">
							      <label class="layui-form-label" style="width: 46px;">报销人</label>
							      <div class="layui-input-inline">
							        <input type="text"  lay-verify="reimbursement_bxr" autocomplete="off" class="layui-input bj" value="${reimbursement.reimbursement_bxr}" disabled="">
							      </div>
						    </div>
			 			</div>
			 			
			 			<div class="layui-form-item">
				 			 	<div class="layui-inline" style="left:-30px;top: 7px;">
								      <label class="layui-form-label" style="width: 90px;">审核金额</label>
								      <div class="layui-input-inline" style="width: 190px;">
								        <input type="text"  lay-verify="reimbursement_shje" autocomplete="off" class="layui-input bj"  value="${reimbursement.reimbursement_shje}" disabled="">
								        <span style="position: relative;top: -25px;right: -193px;">元</span>
								      </div>
							    </div>
							     <div class="layui-inline" style="left: 122px;top: 7px;">
								      <label class="layui-form-label" style="width: 90px;">发票金额</label>
								      <div class="layui-input-inline" style="width: 190px;">
								        <input type="text"  lay-verify="reimbursement_fpje" autocomplete="off" class="layui-input bj"  value="${reimbursement.reimbursement_fpje}" disabled="">
								        <span style="position: relative;top: -25px;right: -193px;">元</span>
								      </div>
							    </div>
						  </div> 
			 
						  <div class="layui-form-item layui-form-text">
						    <label class="layui-form-label" style="width: 60px;">费用明细</label>
						    <div class="layui-input-block">
						      <textarea  lay-verify="reimbursement_details" class="layui-textarea bj" style="width:674px;" disabled="">${reimbursement.reimbursement_details}</textarea>
						    </div>
						</div>
				</form>
		  </div>
	</div>
			<!--评审意见  -->
			<div class="layui-tab-item">
				<ul class="layui-timeline">
					<c:forEach items="${reviewOpinions}" var="r">
						<li class="layui-timeline-item"><i
							class="layui-icon layui-timeline-axis"></i>
							<div class="layui-timeline-content layui-text">
								<h3 class="layui-timeline-title">${r.time}&nbsp;&nbsp;&nbsp;${r.userName}--->已办理</h3>
								<p>
									审批结果:<span style="color: green">${r.result }</span> <br>
									审批意见:<span style="color: green">${r.advise }</span>
								</p>
							</div></li>
					</c:forEach>
				</ul>
			</div>
			
			<!--流程检视  -->
			<div class="layui-tab-item">
				<img style="position: absolute; top: 70px; left: 0px;" id="lct"
					src=''>
				<!--根据当前活动的坐标，动态绘制div  -->
				<div
					style="position: absolute;border:2px solid red;top:${map.y}px;left:${map.x}px;width:${map.width}px;height:${map.height}px;"></div>
			</div>
		</div>
	</div>
	
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
<script type="text/html" id="barDemo">
  <!--<a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="yl" name="defaultAD">预览</a>-->
  <a class="layui-btn layui-btn-xs" lay-event="xz">下载</a>
</script>		
<script src="../layui-v2.4.5/layui/layui.js" charset="utf-8"></script>
<script type="text/javascript" src="../jquery-easyui-1.7.0/jquery.easyui.min.js"></script>
<script>
layui.use(['form', 'layedit', 'laydate','element'], function(){
  var form = layui.form
  ,layer = layui.layer
  ,layedit = layui.layedit
  ,laydate = layui.laydate
  var url=$('#url').val();
  var element = layui.element;
  var url=$('#url').val();
  var objId=$('#objId').val();
  form.render();
  
  //创建一个编辑器
  var editIndex = layedit.build('LAY_demo_editor');
  lct();
});

$("#myMenu").draggable(); 

//点击处理跳转相应页面
 $('#_zxys_deal_btn').click(function(){
		 var url=$('#url').val();
		 var taskId=$('#taskId').val();
		 var objId=$('#objId').val();
		 if(taskId==''){
			alert('当前节点非您处理');
		 }else{
			 $.ajax({
					url : '<c:url value="/index/result.do"/>',
					data : {"task_id":taskId},
					dataType : 'json',
					type : 'post',
					async : false,
					success : function(data) {
						if(data.address=="reimburse/bxtb/editBxtb"){
							 layer.open({
					       	  	type:2,
					       	  	title:'编辑',
					       	  	area: ['100%','100%'],
					       		shadeClose: false,
					       		resize:false,
					       	    anim: 4,
					       	  	content:[url+"bxtb/initEditBxtb.do?objId="+objId+"&taskId="+taskId,'yes']
						     });
						}else{
							layer.open({
					       	  	type:2,
					       	  	title:'结果审批',
					       	  	area: ['60%','70%'],
					       		shadeClose: false,
					       		resize:false,
					       	    anim: 4,
					       	  	content:[url+"index/dealWith.do?task_id="+taskId,'yes']
					     });
						}
					
						 
					}
				});
			
		 }
		 
	 });
function lct(){
 	var img=$('#lct');
 	var deploymentId=$('#depId').val();
 	var imageName=$('#imgName').val();
 	var url=$('#url').val();
 	img.attr("src",url+"index/viewImage.do?deploymentId="+deploymentId+"&imageName="+imageName)
 }
 

</script>
</body>
</html>