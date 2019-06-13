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
<title>项目立项查看页</title>
<link rel="stylesheet" href="../layui-v2.4.5/layui/css/layui.css">
<link rel="stylesheet" href="../login/css/static.css">
<script src="../jquery/jquery-3.3.1.js"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@page isELIgnored="false" %>
<style>
  .bj{background-color: #C5C1AA}
 </style>
</head>
<body style="width:100%;padding:0px; margin:0px;text-align: center;">
<div class="layui-tab">
	  <ul class="layui-tab-title">
	    <li class="layui-this">基本信息</li>
	    <li>评审意见</li>
	    <li>任务附件</li>
	    <li>流程检视</li>
	  </ul>
		<div class="layui-tab-content">
			<div class="layui-tab-item layui-show">
				<div style="width:1280px;height:auto;padding:0px; margin:0 auto;" id="main">
					<form class="layui-form" action="<c:url value='/approveproj/saveXiangMuLX.do'/>"method="post" enctype="multipart/form-data">
						<input type="hidden" id="url" value='<c:url value="/"/>'>
						<input type="hidden" value="${deploymentId}" id="depId">
						<input type="hidden" value="${imageName }" id="imgName">
						<input type="hidden" id="flag" value="${flag}">
						<input type="hidden" id="taskId" value="${taskId}" >
						<input type="hidden" id="objId" value="${foll_up_Proj.proj_Id}">
						
						<div class="layui-form-item" style="margin-top: 2%">
						    <label class="layui-form-label" style="width: 180px;">项目编号</label>
						    <div class="layui-input-block">
						      <input type="text" name="proj_Code" lay-verify="proj_Code" value="${foll_up_Proj.proj_Code}" disabled="" autocomplete="off" class="layui-input bj" style="width: 51.4%" id="proj_Code">
						    </div>
						</div>
						
						
						<div class="layui-form-item">
						    <label class="layui-form-label" style="width: 180px;">项目名称</label>
						    <div class="layui-input-block">
						      <input type="text" name="budget_Name" lay-verify="budget_Name" value="${foll_up_Proj.budget_Name }" disabled="" autocomplete="off" class="layui-input bj" style="width: 51.4%" id="budget_Name">
						    </div>
						</div>
						
						 <div class="layui-form-item">
							  <div class="layui-inline" style="left: -53px;">
							      <label class="layui-form-label" style="width: 233px;">预算金额</label>
							      <div class="layui-input-inline">
							        <input type="text" name="budget_Amount" lay-verify="budget_Amount" autocomplete="off" class="layui-input bj" id="budget_Amount" disabled="" value="${foll_up_Proj.budget_Amount}">
							        <span style="position: relative;top: -25px;right: -197px;">元</span>
							      </div>
						     </div>
						    <div class="layui-inline" style="top: -10px;left: -239px;">
							      <label class="layui-form-label" style="width: 410px;">计划合同部签订日期</label>
							      <div class="layui-input-inline">
							        <input type="text" name="budget_Amount" id="budget_Amount" lay-verify="budget_Amount" placeholder="yyyy-mm-dd" value="${foll_up_Proj.plan_cont_date}" disabled="" autocomplete="off" class="layui-input bj">
							      </div>
						    </div>
						 </div>
						
						<div class="layui-form-item">
							<div class="layui-inline" style="width: 608px;left: -158px;">
							  	<label class="layui-form-label" style="width: 338px;">招标方式</label>
								<div class="layui-input-inline" >
									<input type="text" name="cust_Contact" lay-verify="cust_Contact"
									autocomplete="off" class="layui-input bj" 
									id="cust_Contact" value="${zbfs.bp_Method_Name}" disabled="">
								</div>
							 </div>
							  <div class="layui-inline" style="top: -2px;left: -196px;">
							      <label class="layui-form-label" style="width: 223px;">客户负责人</label>
							      <div class="layui-input-inline">
							        <input type="text" name="cust_Contact" lay-verify="cust_Contact" autocomplete="off" value="${foll_up_Proj.cust_Contact}" disabled="" class="layui-input bj" id="cust_Contact">
							      </div>
						    </div>
						  </div>

						<div class="layui-form-item">
						    <label class="layui-form-label" style="width: 189px;">客户单位名称</label>
						    <div class="layui-input-block" style="left: -8px;">
						      <input type="text" name="cust_Unit" lay-verify="cust_Unit" autocomplete="off" value="${foll_up_Proj.cust_Unit}" disabled="" class="layui-input bj" style="width: 51.5%" id="cust_Unit">
						    </div>
					   </div>

						 <div class="layui-form-item">
							  <div class="layui-inline" style="top: -2px;left: -76px;">
							      <label class="layui-form-label" style="width: 256px;">客户手机号</label>
							      <div class="layui-input-inline">
							        <input type="text" name="cust_Phone" lay-verify="cust_Phone" autocomplete="off" class="layui-input bj" id="cust_Phone" value="${foll_up_Proj.cust_Phone }" disabled="">
							      </div>
						    </div>
							  <div class="layui-inline" style="top: -2px;left: -218px;">
							      <label class="layui-form-label" style="width: 368px;">客户固定电话</label>
							      <div class="layui-input-inline">
							        <input type="text" name="offi_Tel" lay-verify="offi_Tel" autocomplete="off" class="layui-input bj" id="offi_Tel" value="${ foll_up_Proj.offi_Tel}" disabled="">
							      </div>
						    </div>
						  </div>

						<div class="layui-form-item">
							<div class="layui-inline" style="top: -2px;left: -166px;">
						      <label class="layui-form-label" style="width: 347px;">项目成功率</label>
						      <div class="layui-input-inline">
						        <input type="text" name="proj_Succ_Rate" lay-verify="proj_Succ_Rate" autocomplete="off" class="layui-input bj" id="proj_Succ_Rate" value="${foll_up_Proj.proj_Succ_Rate }" disabled="">
						        <span style="position: relative;top: -25px;right: -193px;">%</span>
						      </div>
						</div>
							  <div class="layui-inline" style="width: 417px;left: -116px;top: -11px;">
							  	<label class="layui-form-label" style="width: 177px;">我方负责人</label>
								<div class="layui-input-inline">
									<input type="text" name="our_Unit" lay-verify="our_Unit"
									autocomplete="off" class="layui-input bj"
									id="our_Unit" value="${user.user_name}" disabled="">
								</div>
							 </div>
						 </div>

			 			<div class="layui-form-item">
							    <label class="layui-form-label" style="width: 190px;">我方单位名称</label>
							    <div class="layui-input-block" style="left: -10px;">
							      <input type="text" name="our_Unit" lay-verify="our_Unit" autocomplete="off" value="${foll_up_Proj.our_Unit }" disabled="" class="layui-input bj" style="width: 51.6%" id="our_Unit">
							    </div>
						  </div>
			  
						 <div class="layui-form-item layui-form-text">
						    <label class="layui-form-label" style="width: 180px;">备注</label>
						    <div class="layui-input-block">
						      <textarea placeholder="请输入内容" name="memo_1"  lay-verify="memo_1" id="memo_1" class="layui-textarea bj" style="width:51.6%" disabled="">${foll_up_Proj.memo_1}</textarea>
						    </div>
						 </div>

					</form>
				</div>
			</div>
			<!--评审意见  -->
			<div class="layui-tab-item">
				<ul class="layui-timeline">
					<c:forEach items="${reviewOpinions }" var="r">
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
			<!--附件  -->
			<div class="layui-tab-item">
				<p>附件</p>
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
		
<script src="../layui-v2.4.5/layui/layui.js" charset="utf-8"></script>
<script type="text/javascript" src="../jquery-easyui-1.7.0/jquery.easyui.min.js"></script>
<script>
layui.use(['form', 'layedit', 'laydate','element'], function(){
  var form = layui.form
  ,layer = layui.layer
  ,layedit = layui.layedit
  ,laydate = layui.laydate
  ,upload = layui.upload;
  var url=$('#url').val();
  var element = layui.element;
  form.render();
  //日期
  laydate.render({
    elem: '#date'
  });
  
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
						if(data.address=="projman/approveproj/editApproveproj"){
							 layer.open({
					       	  	type:2,
					       	  	title:'编辑',
					       	  	area: ['100%','100%'],
					       		shadeClose: false,
					       		resize:false,
					       	    anim: 4,
					       	  	content:[url+"approveproj/initEditXMXX.do?objId="+objId+"&taskId="+taskId,'yes']
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