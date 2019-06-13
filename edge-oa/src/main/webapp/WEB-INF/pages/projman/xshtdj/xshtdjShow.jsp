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
<title>销售合同登记查看页</title>
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
		<div class="layui-tab-content" >
			<div class="layui-tab-item layui-show">
				<div style="width:1280px;height:auto;padding:0px; margin:0 auto;" id="main">
					<form class="layui-form" action="<c:url value='/approveproj/saveXiangMuLX.do'/>" method="post" enctype="multipart/form-data">
						<input type="hidden" id="url" value='<c:url value="/"/>'>
						<input type="hidden" value="${deploymentId}" id="depId">
						<input type="hidden" value="${imageName }" id="imgName">
						<input type="hidden" id="flag" value="${flag}">
						<input type="hidden" id="taskId" value="${taskId}" >
						<input type="hidden" id="objId" value="${xsht.proj_Info_Id}">
						<input type="hidden" value="${xsht.is_LX }" id="sflx">
						
						<div class="layui-form-item" >
					    <label class="layui-form-label">销售合同<br/>名称</label>
						    <div class="layui-input-block">
						      <input type="text" name="proj_Name" lay-verify="proj_Name" autocomplete="off" value="${xsht.proj_Name}" disabled="" class="layui-input bj" style="width: 63.1%" id="proj_Name">
						    </div>
						</div>
			
			
						<div class="layui-form-item">
						    <label class="layui-form-label">项目是否<br/>立项</label>
						    <div class="layui-input-block" style="width: 315px;">
						      <input type="radio" name="is_LX" value="1" title="已立项"  lay-filter="is_LX" id="ylx" disabled="disabled">
						      <input type="radio" name="is_LX" value="0" title="未立项"  lay-filter="is_LX" id="wlx" disabled="disabled">
						    </div>
						 </div>
						
						<div class="layui-form-item">
							<label class="layui-form-label">项目名称</label>
							<div class="layui-input-inline" style="width: 90%;">
								<input type="text" name="proj_Id" lay-verify="proj_Id"
									autocomplete="off" class="layui-input bj" style="width:70%;" id="proj_Id" value="${xmxx.budget_Name}" disabled="">
							</div>
						</div>
						
						
						<div class="layui-form-item">
							<div class="layui-inline" style="width: 352px;">
							  	<label class="layui-form-label">招标采购<br/>方式</label>
								<div class="layui-input-inline">
									<input type="text" name="bp_Method" lay-verify="bp_Method"
									autocomplete="off" class="layui-input bj" style="width: 55%;" id="bp_Method" value="${zbfs.bp_Method_Name}" disabled="">
								</div>
							 </div>
							  <div class="layui-inline" style="top: -2px;left: -158px;">
							      <label class="layui-form-label">合同金额</label>
							      <div class="layui-input-inline">
							      <input type="text" name="cont_Amount" lay-verify="cont_Amount"
									autocomplete="off" class="layui-input bj" style="width: 53%;" id="cont_Amount" value="${xsht.cont_Amount}" disabled="">
							        <span style="position: relative;top: -25px;right: -105px;">元</span>
							      </div>
						    </div>
						    <div class="layui-inline" style="top: -10px;left: -243px;">
							      <label class="layui-form-label">签订日期</label>
							      <div class="layui-input-inline">
							       <input type="text" name="cont_Date" id="cont_Date" lay-verify="cont_Date" placeholder="yyyy-MM-dd" autocomplete="off" class="layui-input bj" value="${xsht.qdrq}" disabled="" style="width: 70%">
							      </div>
						    </div>
						    <div class="layui-inline" style="width: 20%;top: -2px;left: -320px;">
							      <label class="layui-form-label" style="width: 84px;">合同计划完成日期</label>
							      <div class="layui-input-inline" style="width: 51%">
							        <input type="text" name="finish_Time" id="finish_Time" lay-verify="finish_Time" placeholder="yyyy-MM-dd" autocomplete="off" class="layui-input bj" style="width: 83%" value="${xsht.htjhwcrq}" disabled="">
							      </div>
						    </div>
						 </div>
			
						<div class="layui-form-item" style="margin-top: -30px;">
						    <div class="layui-inline">
						      <label class="layui-form-label">质保金比例</label>
						      <div class="layui-input-inline">
						        <input type="text" name="qual_Ratio" lay-verify="qual_Ratio" id="qual_Ratio" autocomplete="off" class="layui-input bj" value="${xsht.qual_Ratio}" style="width: 47%" disabled="">
						        <span style="position: relative;top: -25px;right: -90px;">%</span>
						      </div>
						    </div>
						    <div class="layui-inline"style="left: -114px;">
						      <label class="layui-form-label">质保金金额</label>
						      <div class="layui-input-inline">
						        <input type="text" name="qual_Bonds" lay-verify="qual_Bonds" id="qual_Bonds" autocomplete="off" class="layui-input bj" disabled="" value="${xsht.qual_Bonds}" style="width: 52%">
						        <span style="position: relative;top: -25px;right: -105px;">元</span>
						      </div>
						    </div>
						    <div class="layui-inline" style="top: 2px;left: -201px;">
						      <label class="layui-form-label">质保金到期日期</label>
						      <div class="layui-input-inline">
						        <input type="text" name="qual_Expiredate" id="qual_Expiredate" lay-verify="qual_Expiredate" placeholder="yyyy-mm-dd" autocomplete="off" class="layui-input bj" value="${xsht.zbjdqrq}" style="width: 70%" disabled="">
						      </div>
						    </div>
		 				 </div>
						
						<div>
							<span style="position: relative;left: 24px;font-size: 20px;top: -10px;color:#D2691E">客户信息</span>
						</div>
						
						
						<div class="layui-form-item">
						    <div class="layui-inline" style="width: 60%;left: -2px;">
							    <label class="layui-form-label">单位名称</label>
							    <div class="layui-input-block">
							      <input type="text" name="cust_Unit" id="cust_Unit" lay-verify="cust_Unit" autocomplete="off" value="${xsht.cust_Unit}" class="layui-input bj" style="width: 75.5%" disabled="">
							    </div>
						    </div>
						    
					      <div class="layui-inline" style="width: 30%;left: -85px;">
						    <label class="layui-form-label">负责人</label>
						    <div class="layui-input-block">
						      <input type="text" name="cust_Contact" lay-verify="cust_Contact" id="cust_Contact" autocomplete="off"  value="${xsht.cust_Contact}"  class="layui-input bj" style="width: 29%" disabled="">
						    </div>
					    </div> 
					  </div>
					  
						<div class="layui-form-item">
						    <div class="layui-inline" style="width: 38.5%;left: -2px;">
							    <label class="layui-form-label">手机号码</label>
							    <div class="layui-input-block">
							      <input type="text" name="cust_Phone" lay-verify="cust_Phone" id="cust_Phone" autocomplete="off" value="${xsht.cust_Phone}" class="layui-input bj" style="width: 64%" disabled="">
							    </div>
						    </div>
						    <div class="layui-inline" style="width: 39%;left: -60px;">
							    <label class="layui-form-label">办公电话</label>
							    <div class="layui-input-block">
							      <input type="text" name="offi_Tel" id="offi_Tel" lay-verify="offi_Tel" autocomplete="off" value="${xsht.offi_Tel}"  class="layui-input bj" style="width: 72.5%" disabled="">
							    </div>
						    </div>
				 		</div>
						
						<div>
							<span style="position: relative;left:24px;font-size: 20px;top: -10px;color:#D2691E">我方信息</span>
						</div>
						
						<div class="layui-form-item">
						    <div class="layui-inline" style="width: 53%;left: -2px;">
							    <label class="layui-form-label">单位名称</label>
							    <div class="layui-input-block">
							      <input type="text" name="our_Unit" lay-verify="our_Unit" id="our_Unit" autocomplete="off" value="${xsht.our_Unit}"  class="layui-input bj" style="width: 60%" disabled="">
							    </div>
						    </div>
						   <div class="layui-inline" style="width: 24.5%;left: -205px;">
						  	<label class="layui-form-label">负责人</label>
							<div class="layui-input-inline">
								<input type="text" name="user_Id" lay-verify="user_Id"
									autocomplete="off" class="layui-input bj" style="width:45.5%;" id="user_Id" value="${user.user_name}" disabled="">
							</div>
						 </div>
						 <div class="layui-inline" style="width: 19%;left: -336px;">
							    <label class="layui-form-label">提交人</label>
							    <div class="layui-input-block">
							      <input type="text" name="subm_Name" lay-verify="subm_Name" id="subm_Name" autocomplete="off"  class="layui-input bj" style="width:52%" value="${xsht.subm_Name}" disabled="">
							    </div>
						    </div>
				  		</div>	
						
						<div class="layui-form-item layui-form-text">
						    <label class="layui-form-label">货物(产品)<br/>内容</label>
						    <div class="layui-input-block">
						      <textarea placeholder="请输入内容" name="prod_Name"  lay-verify="prod_Name" id="prod_Name" class="layui-textarea bj" style="width:63.5%" disabled="">${xsht.prod_Name}</textarea>
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
  xmsflx(form);

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
						if(data.address=="projman/xshtdj/editXshtdj"){
							 layer.open({
					       	  	type:2,
					       	  	title:'编辑',
					       	  	area: ['100%','100%'],
					       		shadeClose: false,
					       		resize:false,
					       	    anim: 4,
					       	  	content:[url+"xshtdj/initEditXSHTDJ.do?objId="+objId+"&taskId="+taskId,'yes']
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
 
 
 function xmsflx(form){
		var xmlx=$('#sflx').val();
		var ylx=$('#ylx');
		var wlx=$('#wlx');
		if(xmlx=='false'){//未立项
			wlx[0].checked=true;
			form.render()
		}
		if(xmlx=='true'){//已立项
			ylx[0].checked=true;
			form.render()
		}
 }

</script>
</body>
</html>