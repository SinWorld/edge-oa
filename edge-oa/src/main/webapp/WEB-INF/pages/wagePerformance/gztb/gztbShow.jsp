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
<title>工资填报查看页</title>
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
						<input type="hidden" id="objId" value="${wagePerformance.wage_per_Id}">
						
						
						<div class="layui-form-item" style="margin-top: 20px;">
						 	<div class="layui-inline" style="left:30px;">
							      <label class="layui-form-label" style="width: 90px;">审批编号</label>
							      <div class="layui-input-inline">
							        <input type="text" name="wage_per_Code" lay-verify="wage_per_Code" autocomplete="off" class="layui-input bj" id="wage_per_Code" value="${wagePerformance.wage_per_Code}" disabled="">
							      </div>
						    </div>
						    
						     <div class="layui-inline" style="left: 13px;">
						      <label class="layui-form-label">月份</label>
						      <div class="layui-input-inline">
						        <input type="text" class="layui-input bj" id="wage_per_Month" placeholder="yyyy-MM" name="wage_per_Month" value="${wagePerformance.month}" disabled="" style="width: 175px;">
						      </div>
						    </div>
						    
							<div class="layui-inline" style="left:12px;">
							  	<label class="layui-form-label" style="width: 95px;">姓名</label>
								  <div class="layui-input-inline">
							        <input type="text" name="wage_per_Name" lay-verify="wage_per_Name" autocomplete="off" class="layui-input bj" id="wage_per_Name" value="${wagePerformance.user_Name}" disabled="" style="width: 178px;">
							      </div>
							 </div>
							 
						   <div class="layui-inline" style="left:25px;margin-top: 10px;">
							  	<label class="layui-form-label" style="width: 95px;">部门</label>
								 <div class="layui-input-inline">
							        <input type="text" name="wage_per_Department" lay-verify="wage_per_Department" autocomplete="off" class="layui-input bj" id="wage_per_Department" value="${wagePerformance.user_Department}" disabled="">
							      </div>
							 </div>
							 
						     <div class="layui-inline" style="left:-7px;margin-top: 10px;">
							  	<label class="layui-form-label" style="width: 95px;">岗位</label>
								<div class="layui-input-inline">
							        <input type="text" name="wage_per_Position" lay-verify="wage_per_Position" autocomplete="off" class="layui-input bj" id="wage_per_Position" value="${wagePerformance.user_Posittion}" disabled="" style="width: 175px;">
							      </div>
							 </div>
						 </div>
		 
						<div class="layui-form-item">
							 <div class="layui-inline" style="left:30px;">
							      <label class="layui-form-label" style="width: 90px;">基本工资</label>
							      <div class="layui-input-inline" style="width: 195px;">
							        <input type="text" id="wage_per_BaseWage" lay-verify="wage_per_BaseWage" autocomplete="off" class="layui-input bj" name="wage_per_BaseWage" style="width: 175px;" value="${wagePerformance.wage_per_BaseWage}" disabled="">
							        <span style="position: relative;top: -25px;right: -175px;">元</span>
							      </div>
						    </div>
							 
						   <div class="layui-inline" style="left: 13px;">
							      <label class="layui-form-label" style="width: 75px;">岗位工资</label>
							      <div class="layui-input-inline" style="width: 195px;">
							        <input type="text" id="wage_per_PositionWage" lay-verify="wage_per_PositionWage" autocomplete="off" class="layui-input bj" name="wage_per_PositionWage" style="width: 175px;" value="${wagePerformance.wage_per_PositionWage}" disabled="">
							        <span style="position: relative;top: -25px;right: -175px;">元</span>
							      </div>
						    </div>
						     <div class="layui-inline">
							      <label class="layui-form-label" style="width: 106px;">绩效奖金</label>
							      <div class="layui-input-inline" style="width: 195px;">
							        <input type="text" id="wage_per_AchievementBonus" lay-verify="wage_per_AchievementBonus" autocomplete="off" class="layui-input bj" name="wage_per_AchievementBonus" style="width: 175px;" value="${wagePerformance.wage_per_AchievementBonus}" disabled="">
							        <span style="position: relative;top: -25px;right: -175px;">元</span>
							      </div>
						    </div>
						     <div class="layui-inline">
							      <label class="layui-form-label" style="width: 120px;">加班工资</label>
							      <div class="layui-input-inline" style="width: 195px;">
							        <input type="text" id="wage_per_OverTimePay" lay-verify="wage_per_OverTimePay" autocomplete="off" class="layui-input bj" name="wage_per_OverTimePay" style="width: 175px;" value="${wagePerformance.wage_per_OverTimePay}" disabled="">
							        <span style="position: relative;top: -25px;right: -175px;">元</span>
							      </div>
						    </div>
						  
						    <div class="layui-inline" style="left:-64px;">
							      <label class="layui-form-label" style="width:122px;">社保缴费<br/>基数</label>
							      <div class="layui-input-inline" style="width: 195px;">
							        <input type="text" id="wage_per_Sbjfjs" lay-verify="wage_per_Sbjfjs" autocomplete="off" class="layui-input bj" name="wage_per_Sbjfjs" style="width: 175px;" value="${wagePerformance.wage_per_Sbjfjs}" disabled="">
							        <span style="position: relative;top: -25px;right: -175px;">元</span>
							      </div>
						    </div>
						    
						     <div class="layui-inline" style="left: -20px;">
							      <label class="layui-form-label" style="width: 50px;">电话费</label>
							      <div class="layui-input-inline" style="width: 195px;">
							        <input type="text" id="wage_per_dhf" lay-verify="wage_per_dhf" autocomplete="off" class="layui-input bj" name="wage_per_dhf" style="width: 175px;" value="${wagePerformance.wage_per_dhf}" disabled="">
							        <span style="position: relative;top: -25px;right: -175px;">元</span>
							      </div>
						    </div>
						 </div>
			 
						 <div class="layui-form-item">
							 <div class="layui-inline" style="left:30px;">
							      <label class="layui-form-label" style="width:90px;">社保个人<br/>部分</label>
							      <div class="layui-input-inline" style="width: 195px;">
							        <input type="text" id="wage_per_Sbgrbf" lay-verify="wage_per_Sbgrbf" autocomplete="off" class="layui-input bj" name="wage_per_Sbgrbf" style="width: 175px;"value="${wagePerformance.wage_per_Sbgrbf}" disabled="">
							        <span style="position: relative;top: -25px;right: -175px;">元</span>
							      </div>
						    </div>
							 
						   <div class="layui-inline">
							      <label class="layui-form-label" style="width:90px;">社保单位<br/>部分</label>
							      <div class="layui-input-inline" style="width: 195px;">
							        <input type="text" id="wage_per_Sbdwbf" lay-verify="wage_per_Sbdwbf" autocomplete="off" class="layui-input bj" name="wage_per_Sbdwbf" style="width: 175px;" value="${wagePerformance.wage_per_Sbdwbf}" disabled="">
							        <span style="position: relative;top: -25px;right: -175px;">元</span>
							      </div>
						    </div>
						     <div class="layui-inline">
							      <label class="layui-form-label" style="width: 90px;">社保补贴</label>
							      <div class="layui-input-inline" style="width: 195px;">
							        <input type="text" id="wage_per_Sbbt" lay-verify="wage_per_Sbbt" autocomplete="off" class="layui-input bj" name="wage_per_Sbbt" style="width: 175px;" value="${wagePerformance.wage_per_Sbbt}" disabled="">
							        <span style="position: relative;top: -25px;right: -175px;">元</span>
							      </div>
						    </div>
						     <div class="layui-inline">
							      <label class="layui-form-label" style="width:120px;">其它</label>
							      <div class="layui-input-inline" style="width: 195px;">
							        <input type="text" id="wage_per_Qt" lay-verify="wage_per_Qt" autocomplete="off" class="layui-input bj" name="wage_per_Qt" style="width: 175px;" value="${wagePerformance.wage_per_Qt}" disabled="">
							        <span style="position: relative;top: -25px;right: -175px;">元</span>
							      </div>
						    </div>
						    
						    <div class="layui-inline" style="left:277px;">
							      <label class="layui-form-label" style="width:122px;">应发工资</label>
							      <div class="layui-input-inline" style="width: 195px;">
							        <input type="text" id="wage_per_Yfgz" lay-verify="wage_per_Yfgz" autocomplete="off" class="layui-input bj" name="wage_per_Yfgz" style="width: 175px;" value="${wagePerformance.wage_per_Yfgz}" disabled="">
							        <span style="position: relative;top: -25px;right: -175px;">元</span>
							      </div>
						    </div>
						 </div>
			 
						 <div class="layui-form-item">
							 <div class="layui-inline" style="left:30px;">
							      <label class="layui-form-label" style="width:90px;">未出勤<br/>扣款</label>
							      <div class="layui-input-inline" style="width: 195px;">
							        <input type="text" id="wage_per_Wcqkk" lay-verify="wage_per_Wcqkk" autocomplete="off" class="layui-input bj" name="wage_per_Wcqkk" style="width: 175px;" value="${wagePerformance.wage_per_Wcqkk}" disabled="">
							        <span style="position: relative;top: -25px;right: -175px;">元</span>
							      </div>
						    </div>
							 
						   <div class="layui-inline">
							      <label class="layui-form-label" style="width:90px;">其它扣款</label>
							      <div class="layui-input-inline" style="width: 195px;">
							        <input type="text" id="wage_per_Qtkk" lay-verify="wage_per_Qtkk" autocomplete="off" class="layui-input bj" name="wage_per_Qtkk" style="width: 175px;" value="${wagePerformance.wage_per_Qtkk}" disabled="">
							        <span style="position: relative;top: -25px;right: -175px;">元</span>
							      </div>
						    </div>
						     <div class="layui-inline">
							      <label class="layui-form-label" style="width: 90px;">社保代扣</label>
							      <div class="layui-input-inline" style="width: 195px;">
							        <input type="text" id="wage_per_Sbdk" lay-verify="wage_per_Sbdk" autocomplete="off" class="layui-input bj" name="wage_per_Sbdk" style="width: 175px;" value="${wagePerformance.wage_per_Sbdk}" disabled="">
							        <span style="position: relative;top: -25px;right: -175px;">元</span>
							      </div>
						    </div>
						     <div class="layui-inline">
							      <label class="layui-form-label" style="width: 120px;">个税代扣</label>
							      <div class="layui-input-inline" style="width: 195px;">
							        <input type="text" id="wage_per_Gsdk" lay-verify="wage_per_Gsdk" autocomplete="off" class="layui-input bj" name="wage_per_Gsdk" style="width: 175px;" value="${wagePerformance.wage_per_Gsdk}" disabled="">
							        <span style="position: relative;top: -25px;right: -175px;">元</span>
							      </div>
						    </div>
						 
						    <div class="layui-inline" style="left:277px;">
							      <label class="layui-form-label" style="width:122px;">实发工资</label>
							      <div class="layui-input-inline" style="width: 195px;">
							        <input type="text" id="wage_per_Sfgz" lay-verify="wage_per_Sfgz" autocomplete="off" class="layui-input bj" name="wage_per_Sfgz" style="width: 175px;" value="${wagePerformance.wage_per_Sfgz}" disabled="">
							        <span style="position: relative;top: -25px;right: -175px;">元</span>
							      </div>
						    </div>
						 </div>
			 
						  <div class="layui-form-item">
							  <div class="layui-inline" style="left:25px;">
							  	<label class="layui-form-label" style="width: 95px;">员工类型</label>
								<div class="layui-input-inline" style="width: 195px;">
							        <input type="text" id="wage_per_Yglx" lay-verify="wage_per_Yglx" autocomplete="off" class="layui-input bj" name="wage_per_Yglx" style="width: 175px;" value="${wagePerformance.yglx_name}" disabled="">
							     </div>
							 </div>
							 <div class="layui-inline" style="left:-4px;">
							      <label class="layui-form-label" style="width: 90px;">填报人</label>
							      <div class="layui-input-inline">
							        <input type="text" name="wage_per_Tbr" lay-verify="wage_per_Tbr" autocomplete="off" class="layui-input bj" id="wage_per_Tbr" style="width: 173px;" value="${wagePerformance.wage_per_Tbr}" disabled=""> 
							      </div>
						    </div>
						 </div>
		 
						 <div class="layui-form-item layui-form-text">
						    <label class="layui-form-label" style="width: 120px;">备注</label>
						    <div class="layui-input-block">
						      <textarea placeholder="请输入内容" name="wage_per_Bz"  lay-verify="wage_per_Bz" id="wage_per_Bz" class="layui-textarea bj" style="width:823px;" disabled="">${wagePerformance.wage_per_Bz}</textarea>
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
						if(data.address=="wagePerformance/gztb/editGztb"){
						    parent.layer.open({
						       	  	type:2,
						       	  	title:'编辑',
						       	  	area: ['100%','100%'],
						       		shadeClose: false,
						       		resize:false,
						       	    anim: 4,
						       	  	content:[url+"wage/initEditGztb.do?objId="+objId+"&taskId="+taskId,'yes']
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