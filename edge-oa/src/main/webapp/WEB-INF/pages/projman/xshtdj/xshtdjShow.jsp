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
<link href="../login/css/xshtfp.css" rel="stylesheet"/>

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
						<input type="hidden" id="kpmb" value="false">
						<input type="hidden" id="lcsfwc" value="${xsht.appr_Status}">
						
						<div class="layui-form-item" >
					    <label class="layui-form-label">销售合同<br/>编号</label>
						    <div class="layui-input-block">
						      <input type="text" name="proj_Code" lay-verify="proj_Code" autocomplete="off" value="${xsht.proj_Code}" disabled="" class="layui-input bj" style="width: 63.1%" id="proj_Code">
						    </div>
						</div>
						
						<div class="layui-form-item" >
					    <label class="layui-form-label">销售合同<br/>名称</label>
						    <div class="layui-input-block">
						      <input type="text" name="proj_Name" lay-verify="proj_Name" autocomplete="off" value="${xsht.proj_Name}" disabled="" class="layui-input bj" style="width: 63.1%" id="proj_Name">
						    </div>
						</div>
			
			
						<div class="layui-form-item">
						    <label class="layui-form-label">项目是否<br/>立项</label>
						    <div class="layui-input-block" style="width: 315px;">
						      <input type="radio" name="is_LX" value="1" title="已立项"  lay-filter="is_LX" id="ylx" disabled="">
						      <input type="radio" name="is_LX" value="0" title="未立项"  lay-filter="is_LX" id="wlx" disabled="">
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
						
						<div>
							 	<span>货物(产品)内容</span>
							   	<table class="layui-hide" id="hwnr"></table>
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
				<p>任务附件</p>
				<table class="layui-hide" id="test" lay-filter="test"></table>
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
	    	<div class="m-operation" style="width:180px;height:60%;" id="mb">
				<h2 style="width: 150px;">操作</h2>
				<span id="xsfpkjAppend" style="width: 170px;">销售发票开具</span>
				<i id="caoZuo">操作</i>
				<em id="fanHui"></em>
			</div>
		
<script type="text/html" id="barDemo">
  <!--<a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="yl" name="defaultAD">预览</a>-->
  <a class="layui-btn layui-btn-xs" lay-event="xz">下载</a>
</script>			
<script src="../layui-v2.4.5/layui/layui.js" charset="utf-8"></script>
<script type="text/javascript" src="../jquery-easyui-1.7.0/jquery.easyui.min.js"></script>
<script>
layui.use(['form', 'layedit', 'laydate','element','table'], function(){
  var form = layui.form
  ,layer = layui.layer
  ,layedit = layui.layedit
  ,laydate = layui.laydate
  ,upload = layui.upload;
  var url=$('#url').val();
  var element = layui.element;
  var table = layui.table;
  var url=$('#url').val();
  var objId=$('#objId').val();
  form.render();
  //日期
  laydate.render({
    elem: '#date'
  });
  
  //创建一个编辑器
  var editIndex = layedit.build('LAY_demo_editor');
  
  table.render({
	    elem: '#test'
	    ,url:url+'xshtdj/queryFJByObjId.do?id='+objId
	    ,title: '任务附件'
	    ,cols: [[
	       {field:'index', width:"10%", title: '序号', sort: true,type:'numbers'}
	      ,{field:'rEALWJM', width:"80%",align:'left', title: '文件名称'}
	      ,{fixed: 'right', title:'操作', toolbar: '#barDemo', width:"10%",align:'center'}
	    ]]
	  });
  
  table.render({
	    elem: '#hwnr'
	    ,url:url+'xshtdj/queryHWCPByObjId.do?id='+objId
	    ,title: '货物(产品内容)'
	    ,cols: [[
	       {field:'index', width:"5%", title: '序号', sort: true,type:'numbers'}
	      ,{field:'chanPinMC', width:"22%",align:'left', title: '产品名称'}
	      ,{field:'pinPai', width:"17%",align:'left', title: '品牌'}
	      ,{field:'guiGeXH', width:"12%",align:'left', title: '规格型号'}
	      ,{field:'zhuYaoPZCS', width:"12%",align:'left', title: '主要配置参数'}
	      ,{field:'danWei', width:"8%",align:'center', title: '单位'}
	      ,{field:'shuLiang', width:"8%",align:'center', title: '数量'}
	      ,{field:'price', width:"8%",align:'center', title: '单价'}
	      ,{field:'jinE', width:"8%",align:'center', title: '金额'}
	    ]]
	  });
  
//监听行工具事件
  table.on('tool(test)', function(obj){
    var data = obj.data;
    //存储在ftp服务器端的地址
    var ftpPath=data.sHANGCHUANDZ;
    //存储在ftp的文件名
    var fileName=data.cUNCHUWJM;
    //存储在ftp的真实文件名
    var rEALWJM=data.rEALWJM;
    var url=$('#url').val();
    //console.log(obj)
    if(obj.event === 'yl'){
    	return;
    	//在线预览
		  $.ajax({  
			    type: "post",  
			    url:  "<c:url value='/department/deleteDepartment.do'/>",
			    dataType: 'json',
			    async:false,
			    data:{"id":id},
			    error:function(){
			    	alert("出错");
			    },
			    success: function (data) {  
			    	if(data.flag){
			    		layer.close(index);
			    		window.location.reload();
			    	}else{
			    		layer.close(index);
			    		layer.msg("当前部门下存在子部门无法删除，请先删除子部门")
			    	}
			    }  
			});
	}else if(obj.event === 'xz'){
    	//下载文件
    	 $.ajax({  
			    type: "post",  
			    url:  "<c:url value='/xshtdj/downloadFtpFile.do'/>",
			    dataType: 'json',
			    async:false,
			    data:{
			    	"ftpPath":ftpPath,
			    	"fileName":fileName,
			    	"rEALWJM":rEALWJM
			    	},
			    error:function(){
			    	alert("出错");
			    },
			    success: function (data) {  
			    	var flag=data.flag;
			    	if(flag){
			    		layer.msg("文件已下载至"+" "+data.path);
			    	}else{
			    		layer.msg(data.fail);
			    	}
			    }  
			});
    	}
  });
 
  lct();
  xmsflx(form);
  $('#mb').width(0);

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
 
 $('#caoZuo').click(function(){
	 var flag=$('#kpmb').val();
	 if(flag=='false'){
		 $('#mb').animate({width:'180px'});
		 $('#kpmb').val(true);
	 }else{
		 $('#mb').animate({width:'0px'});
		 $('#kpmb').val(false);
	 }
 });
 
 $('#xsfpkjAppend').click(function(){
	 var url=$('#url').val();
	 var objId=$('#objId').val();
	 //获取流程是否完成
	 var lcsfwc=$('#lcsfwc').val();
	 var address="/xsfpkj/initXsfpkj.do";
	 if(lcsfwc==1){
		 $.ajax({
	    		type : "post",
	    		url : "<c:url value='/checkPower/checkPower.do'/>",
	    		async : false,
	    		dataType : 'json',
	    		data:{"url":address},
	    		error : function() {
	    			alert("出错");
	    		},
	    		success : function(data) {
	    			if(data.flag){
	    				 parent.layer.open({
	    			    	  	type:2,
	    			    	  	title:'销售发票开具',
	    			    	  	area: ['100%','100%'],
	    			    		shadeClose: false,
	    			    		resize:false,
	    			    	    anim: 4,
	    			    	  	content:[url+"xsfpkj/initXsfpkj.do?xshtdm="+objId,'yes']
	    			    });
	    			}else{
	    				return layer.alert("无此功能权限，请联系管理员授权！",{icon:7});
	    			}
	    		}
	    	});
	 }else{
		 //流程没完成的销售合同不允许发起开票
		return  layer.alert("当前销售合同流程未审核完成，不允许发起开票",{icon:7});
	 }
 });

</script>
</body>
</html>