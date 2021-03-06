<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>编辑需求单</title>
<link rel="stylesheet" href="../layui-v2.4.5/layui/css/layui.css">
<link rel="stylesheet" href="../bootstrap-3.3.7-dist/css/bootstrap.min.css"> 
<link rel="stylesheet" href="../bootstrap-3.3.7-dist/css/bootstrap-theme.min.css"> 
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@page isELIgnored="false" %>
</head>
<body onload="refreshAndClose()" style="width:100%;padding:0px; margin:0px;">
	<div style="width:1280px;height:auto;padding:0px; margin:0 auto;" id="main">
		<form class="layui-form" action='<c:url value="/xqd/editXQD.do"/>' method="post" id="myForm" style="margin-top:30px;">
			<input type="hidden" id="url" value='<c:url value="/"/>'>
			<input type="hidden" id="flag" value="${flag}"> 
			<input type="hidden" name="xqd_xqqd"  id="xqd_xqqd" value="${xqd.xqd_xqqd}">
			<input type="hidden" name="xqd_gzlqd" id="xqd_gzlqd" value="${xqd.xqd_gzlqd}">
			<input type="hidden" name="xqd_kfks"  id="xqd_kfks" value="${xqd.xqd_kfks}">
			<input type="hidden" name="xqd_kfjs"  id="xqd_kfjs" value="${xqd.xqd_kfjs}">
			<input type="hidden" name="xqd_csks"  id="xqd_csks" value="${xqd.xqd_csks}">
			<input type="hidden" name="xqd_csjs"  id="xqd_csjs" value="${xqd.xqd_csjs}">
			<input type="hidden" value="${xqd.xqd_xqjd }" id="jd"> 
			<input type="hidden" value="${xqd.xqd_xqzt }" id="zt"> 
			<input type="hidden" value="${xqd.xqd_xmxx }" id="xmxx">
			<input type="hidden" value="${xqd.xqd_ssxt}" id="ssxt">
			<input type="hidden" value="${xqd.xqd_xqlx}" id="xqlx">
			<input type="hidden" value="${xqd.xqd_fzr }" id="fzr">
			<input type="hidden" value="${xqd.xqd_kh }" id="kh">
			<input type="hidden" value="${xqd.xqd_dm}" name="xqd_dm">
			 
			<div class="layui-form-item">
			 	<div class="layui-inline" style="left:10px;">
				      <label class="layui-form-label" style="width: 120px;">需求单号</label>
				      <div class="layui-input-inline">
				        <input type="text" name="xqd_dh" lay-verify="xqd_dh" autocomplete="off" class="layui-input" id="xqd_dh" value="${xqd.xqd_dh}">
				      </div>
			    </div>
			    
				<div class="layui-inline" style="left:30px;">
				      <label class="layui-form-label" style="width: 120px;">需求名称</label>
				      <div class="layui-input-inline">
				        <input type="text" name="xqd_mc" lay-verify="xqd_mc" autocomplete="off" class="layui-input" id="xqd_mc" value="${xqd.xqd_mc}">
				      </div>
			    </div>
			    
			    <div class="layui-inline" style="left:35px;">
				  	<label class="layui-form-label" style="width: 95px;">项目信息</label>
					<div class="layui-input-inline" style="text-align: left;">
						<select name="xqd_xmxx" id="xqd_xmxx" lay-filter="xqd_xmxx" lay-verify="xqd_xmxx">
							<option value="" selected="selected">请选择项目信息</option>
						</select>
					</div>
				 </div>
				 
			 </div>
		 
		 	<div class="layui-form-item">
		 	
			 	<div class="layui-inline" style="left:35px;">
				  	<label class="layui-form-label" style="width: 95px;">所属系统</label>
					<div class="layui-input-inline" style="text-align: left;">
						<select name="xqd_ssxt" id="xqd_ssxt" lay-filter="xqd_ssxt" lay-verify="xqd_ssxt">
							<option value="" selected="selected">请选择所属系统</option>
						</select>
					</div>
				 </div>
				 
				<div class="layui-inline" style="left:80px;">
				  	<label class="layui-form-label" style="width: 95px;">需求类型</label>
					<div class="layui-input-inline" style="text-align: left;">
						<select name="xqd_xqlx" id="xqd_xqlx" lay-filter="xqd_xqlx" lay-verify="xqd_xqlx">
							<option value="" selected="selected">请选择需求类型</option>
						</select>
					</div>
				 </div>
			    
			    <div class="layui-inline" style="left:86px;">
				  	<label class="layui-form-label" style="width: 95px;">负责人</label>
					<div class="layui-input-inline" style="text-align: left;">
						<select name="xqd_fzr" id="xqd_fzr" lay-filter="xqd_fzr" lay-verify="xqd_fzr">
							<option value="" selected="selected">请选择负责人</option>
						</select>
					</div>
				 </div>
			    
			 </div>
			 
			 <div class="layui-form-item">
				 <div class="layui-inline" style="left:35px;">
				  	<label class="layui-form-label" style="width: 95px;">客户</label>
					<div class="layui-input-inline" style="text-align: left;">
						<select name="xqd_kh" id="xqd_kh" lay-filter="xqd_kh" lay-verify="xqd_kh">
							<option value="" selected="selected">请选择客户</option>
						</select>
					</div>
				 </div>
				 
				<div class="layui-inline" style="left:55px;">
				      <label class="layui-form-label" style="width: 120px;">客户系统</label>
				      <div class="layui-input-inline">
				        <input type="text" name="xqd_khxt" lay-verify="xqd_khxt" autocomplete="off" class="layui-input" id="xqd_khxt" value="${xqd.xqd_khxt}">
				      </div>
			    </div>
				 
				 <div class="layui-inline" style="left:37px;">
				      <label class="layui-form-label" style="width: 120px;">客户负责人</label>
				      <div class="layui-input-inline">
				        <input type="text" name="xqd_khfzr" lay-verify="xqd_khfzr" autocomplete="off" class="layui-input" id="xqd_khfzr" value="${xqd.xqd_khfzr}">
				      </div>
			    </div>
		 	</div>
		 	
		 	 <div class="layui-form-item">
		 		<div class="layui-inline" style="left:10px;">
				      <label class="layui-form-label" style="width:120px;">提出日期</label>
				      <div class="layui-input-inline">
				        <input type="text" name="xqd_tcrq" id="xqd_tcrq" lay-verify=""xqd_tcrq"" placeholder="yyyy-mm-dd" autocomplete="off" class="layui-input" value="${xqd.tcrq}">
				      </div>
			    </div>
			    
			    <div class="layui-inline" style="left:30px;">
				      <label class="layui-form-label" style="width:120px;">计划开始日期</label>
				      <div class="layui-input-inline">
				        <input type="text" name="xqd_jhksrq" id="xqd_jhksrq" lay-verify=""xqd_jhksrq"" placeholder="yyyy-mm-dd" autocomplete="off" class="layui-input" value="${xqd.jhksrq}">
				      </div>
			    </div>
			    
			     <div class="layui-inline" style="left:13px;">
				      <label class="layui-form-label" style="width:120px;">计划结束日期</label>
				      <div class="layui-input-inline">
				        <input type="text" name="xqd_jhjsrq" id="xqd_jhjsrq" lay-verify=""xqd_jhjsrq"" placeholder="yyyy-mm-dd" autocomplete="off" class="layui-input" value="${xqd.jhjsrq}">
				      </div>
			    </div>
			</div>
			
			
			<div class="layui-form-item">
			
			  <div class="layui-inline" style="left:10px;">
			      <label class="layui-form-label" style="width: 120px;">工作量</label>
			      <div class="layui-input-inline">
			        <input type="text" name="xqd_gzl" lay-verify="xqd_gzl" autocomplete="off" class="layui-input" id="xqd_gzl" value="${xqd.xqd_gzl}">
			      </div>
			    </div>
			   
		 	   <div class="layui-inline" style="left:5px;">
		 	    <label class="layui-form-label" style="width:182px;">是否需求签订</label>
				    <div class="layui-input-block" style="width: 220px;">
				      <input type="checkbox"  lay-skin="primary" lay-filter="xqd_xqqd" id="xqqd">
				    </div>
			   </div>
			    
			    <div class="layui-inline" style="left:188px;">
			      <label class="layui-form-label" style="width:150px;">是否工作量签订</label>
				    <div class="layui-input-block" style="width: 200px;">
				      <input type="checkbox"  lay-skin="primary" lay-filter="xqd_gzlqd" id="gzlqd">
				    </div>
			   </div>
			   
			 
			</div>
			
			<div class="layui-form-item">
			   <div class="layui-inline" style="left:50px;">
			      <label class="layui-form-label" style="width: 120px;">是否开始开发</label>
				    <div class="layui-input-block" style="width: 200px;">
				      <input type="checkbox"  lay-skin="primary" lay-filter="xqd_kfks" id="kskf">
				    </div>
			   </div>
			   
			   <div class="layui-inline" style="left:178px;">
			      <label class="layui-form-label" style="width:130px;">是否开发结束</label>
				    <div class="layui-input-block" style="width: 170px;">
				      <input type="checkbox"  lay-skin="primary" lay-filter="xqd_kfjs" id="kfjs">
				    </div>
			   </div>
			   
			   <div class="layui-inline" style="left:195px;">
			      <label class="layui-form-label" style="width:130px;">是否测试开始</label>
				    <div class="layui-input-block" style="width: 170px;">
				      <input type="checkbox"  lay-skin="primary" lay-filter="xqd_csks" id="csks">
				    </div>
			   </div>
			   
			   <div class="layui-inline" style="left:195px;">
			      <label class="layui-form-label" style="width:130px;">是否测试结束</label>
				    <div class="layui-input-block" style="width: 170px;">
				      <input type="checkbox"  lay-skin="primary" lay-filter="xqd_csjs" id="csjs">
				    </div>
			   </div>
			</div>
			
			<div class="layui-form-item">
			    <div class="layui-inline" style="left:10px;">
				      <label class="layui-form-label" style="width:120px;">实施日期</label>
				      <div class="layui-input-inline">
				        <input type="text" name="xqd_ssrq" id="xqd_ssrq" lay-verify=""xqd_ssrq"" placeholder="yyyy-mm-dd" autocomplete="off" class="layui-input" value="${xqd.ssrq}">
				      </div>
			    </div>
			    
			    <div class="layui-inline" style="left:28px;">
				      <label class="layui-form-label" style="width:120px;">验收日期</label>
				      <div class="layui-input-inline">
				        <input type="text" name="xqd_ysrq" id="xqd_ysrq" lay-verify=""xqd_ysrq"" placeholder="yyyy-mm-dd" autocomplete="off" class="layui-input" value="${xqd.ysrq}">
				      </div>
			    </div>
			    
			 </div>
			 
			 <div class="layui-form-item">
			    
			    <div class="layui-inline" style="left:28px;width: 525px;">
				    <label class="layui-form-label" style="width: 95px;">项目阶段</label>
				    <div class="layui-input-block" id="xmjd">
				      
				    </div>
				</div>
				
				 <div class="layui-inline" style="left:100px;width: 435px;">
				    <label class="layui-form-label" style="width: 90px;">项目状态</label>
				    <div class="layui-input-block" id="xmzt">
				     
				    </div>
				</div>
			 </div>
			
			 <div class="layui-form-item layui-form-text">
			    <label class="layui-form-label" style="width: 128px;">备注</label>
			    <div class="layui-input-block">
			      <textarea placeholder="请输入内容" name="xqd_bz"  lay-verify="xqd_bz" id="xqd_bz" class="layui-textarea" style="width:878px;">${xqd.xqd_bz}</textarea>
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
  //日期
  laydate.render({
    elem: '#xqd_tcrq'
  });
  
  laydate.render({
	elem: '#xqd_jhksrq'
  });
  
  laydate.render({
    elem: '#xqd_jhjsrq'
  });
  
  laydate.render({
	elem: '#xqd_ssrq'
  });
  
  laydate.render({
    elem: '#xqd_ysrq'
  });

  //创建一个编辑器
  var editIndex = layedit.build('LAY_demo_editor');
  
  //监听提交
  form.on('submit(demo1)', function(data){
    layer.alert(JSON.stringify(data.field), {
      title: '最终的提交信息'
    })
    return true;
  });
  
  //是否需求签订
  form.on('checkbox(xqd_xqqd)', function(data){
	  var flag=data.elem.checked;
	  if(flag){
		  $('#xqd_xqqd').val(true);
	  }else{
		  $('#xqd_xqqd').val(false);
	  }
   });
  
  //是否工作量签订
  form.on('checkbox(xqd_gzlqd)', function(data){
	  var flag=data.elem.checked;
	  if(flag){
		  $('#xqd_gzlqd').val(true);
	  }else{
		  $('#xqd_gzlqd').val(false);
	  }
   });
  
  //是否开始开发
  form.on('checkbox(xqd_kfks)', function(data){
	  var flag=data.elem.checked;
	  if(flag){
		  $('#xqd_kfks').val(true);
	  }else{
		  $('#xqd_kfks').val(false);
	  }
   });
  
  //是否开发结束
  form.on('checkbox(xqd_kfjs)', function(data){
	  var flag=data.elem.checked;
	  if(flag){
		  $('#xqd_kfjs').val(true);
	  }else{
		  $('#xqd_kfjs').val(false);
	  }
   });
  
  //是否测试开始
  form.on('checkbox(xqd_csks)', function(data){
	  var flag=data.elem.checked;
	  if(flag){
		  $('#xqd_csks').val(true);
	  }else{
		  $('#xqd_csks').val(false);
	  }
   });
  
  //是否测试结束
  form.on('checkbox(xqd_csjs)', function(data){
	  var flag=data.elem.checked;
	  if(flag){
		  $('#xqd_csjs').val(true);
	  }else{
		  $('#xqd_csjs').val(false);
	  }
   });
  
  
  reloadXMJD(form);
  reloadXMZT(form);
  reloadxmxx(form);
  reloadkhxt(form);
  reloadxqlx(form);
  reloadFZR(form);
  reloadKh(form);
  setxqqd(form);
  setgzlqd(form);
  setkskf(form);
  setkfjs(form);
  setcsks(form);
  setcsjs(form);
  loadXMJD(form);
  loadXMZT(form);
  loadxmxx(form);
  loadssxt(form);
  loadxqlx(form);
  loadfzr(form);
  loadkh(form);
});

  function refreshAndClose(){
	var flag=$('#flag').val();
	if(flag){
		window.parent.location.reload();
		window.close();
	} 
 }
  
  //ajax加载所有的项目信息
  function reloadxmxx(form){
		$.ajax({
			type : "post",
			url : "<c:url value='/xqd/queryAllXMXX.do'/>",
			async : false,
			dataType : 'json',
			error : function() {
				alert("出错");
			},
			success : function(msg) {
				for (var i = 0; i < msg.length; i++) {
					$("#xqd_xmxx").append(
							"<option value='"+msg[i].xmxx_dm+"'>"+ msg[i].xmxx_mc +"</option>");
				}
				form.render('select');
			}
		});
  }
  
  //ajax加载所有的客户系统
  function reloadkhxt(form){
		$.ajax({
			type : "post",
			url : "<c:url value='/xqd/queryAllKHXT.do'/>",
			async : false,
			dataType : 'json',
			error : function() {
				alert("出错");
			},
			success : function(msg) {
				for (var i = 0; i < msg.length; i++) {
					$("#xqd_ssxt").append(
							"<option value='"+msg[i].khxt_dm+"'>"+ msg[i].khxt_mc +"</option>");
				}
				form.render('select');
			}
		});
  }
  
  //ajax加载所有的需求类型
  function reloadxqlx(form){
		$.ajax({
			type : "post",
			url : "<c:url value='/xqd/queryAllWTLX.do'/>",
			async : false,
			dataType : 'json',
			error : function() {
				alert("出错");
			},
			success : function(msg) {
				for (var i = 0; i < msg.length; i++) {
					$("#xqd_xqlx").append(
							"<option value='"+msg[i].wtlx_dm+"'>"+ msg[i].wtlx_mc +"</option>");
				}
				form.render('select');
			}
		});
  }
  
//ajax实现查询所有的负责人
  function  reloadFZR(form){
  	$.ajax({
  		type : "post",
  		url : "<c:url value='/approveproj/allUser.do'/>",
  		async : false,
  		dataType : 'json',
  		error : function() {
  			alert("出错");
  		},
  		success : function(msg) {
  			for (var i = 0; i < msg.length; i++) {
  				$("#xqd_fzr").append(
  						"<option value='"+msg[i].user_id+"'>"+ msg[i].user_name +"</option>");
  			}
  			form.render('select');
  		}
  	});
  }
  
  //ajax加载所有的客户
  function reloadKh(form){
		$.ajax({
			type : "post",
			url : "<c:url value='/hyjy/queryAllKh.do'/>",
			async : false,
			dataType : 'json',
			error : function() {
				alert("出错");
			},
			success : function(msg) {
				for (var i = 0; i < msg.length; i++) {
					$("#xqd_kh").append(
							"<option value='"+msg[i].khdm+"'>"+ msg[i].khmc +"</option>");
				}
				form.render('select');
			}
		});
  }
  
//ajax实现查询所有的问题类型
  function  allWTLX(form){
  	$.ajax({
  		type : "post",
  		url : "<c:url value='/sxwd/queryAllWTLX.do'/>",
  		async : false,
  		dataType : 'json',
  		error : function() {
  			alert("出错");
  		},
  		success : function(msg) {
  			for (var i = 0; i < msg.length; i++) {
  				$("#sxwd_wtlx").append(
  						"<option value='"+msg[i].wtlx_dm+"'>"+ msg[i].wtlx_mc +"</option>");
  			}
  			form.render('select');
  		}
  	});
  }
  
//ajax加载所有的项目阶段
  function reloadXMJD(form){
		$.ajax({
			type : "post",
			url : "<c:url value='/kfxm/queryAllXMJD.do'/>",
			async : false,
			dataType : 'json',
			error : function() {
				alert("出错");
			},
			success : function(msg) {
				for (var i = 0; i < msg.length; i++) {
					$("#xmjd").append(
							"<input type='radio' name='xqd_xqjd' value='"+msg[i].xmjd_dm+"' title='"+msg[i].xmjd_mc+"'>");
				}
				form.render('radio');
			}
		});
  }
  
  //ajax加载所有的项目状态
  function reloadXMZT(form){
		$.ajax({
			type : "post",
			url : "<c:url value='/kfxm/queryAllXMZT.do'/>",
			async : false,
			dataType : 'json',
			error : function() {
				alert("出错");
			},
			success : function(msg) {
				for (var i = 0; i < msg.length; i++) {
					$("#xmzt").append(
							"<input type='radio' name='xqd_xqzt' value='"+msg[i].xmzt_dm+"' title='"+msg[i].xmzt_mc+"'>");
				}
				form.render('radio');
			}
		});
  }
  
  //是否需求签订
  function setxqqd(form){
	  //获得需求签订
	  var flag=$('#xqd_xqqd').val();
	  if(flag=='true'){
		  $('#xqqd').attr("checked",true);
	  }else{
		  $('#xqqd').attr("checked",false);
	  }
	  form.render('checkbox');
  }
  
  //是否工作量签订
  function setgzlqd(form){
	  //获得工作量签订
	  var flag=$('#xqd_gzlqd').val();
	  if(flag=='true'){
		  $('#gzlqd').attr("checked",true);
	  }else{
		  $('#gzlqd').attr("checked",false);
	  }
	  form.render('checkbox');
  }
  
  //是否开始开发
  function setkskf(form){
	  //获得开始开发
	  var flag=$('#xqd_kfks').val();
	  if(flag=='true'){
		  $('#kskf').attr("checked",true);
	  }else{
		  $('#kskf').attr("checked",false);
	  }
	  form.render('checkbox');
  }
  
  //是否开发结束
  function setkfjs(form){
	  //获得开始开发
	  var flag=$('#xqd_kfjs').val();
	  if(flag=='true'){
		  $('#kfjs').attr("checked",true);
	  }else{
		  $('#kfjs').attr("checked",false);
	  }
	  form.render('checkbox');
  }
  
  //是否测试开始
  function setcsks(form){
	  //获得测试开始
	  var flag=$('#xqd_csks').val();
	  if(flag=='true'){
		  $('#csks').attr("checked",true);
	  }else{
		  $('#csks').attr("checked",false);
	  }
	  form.render('checkbox');
  }
  
  //是否测试结束
  function setcsjs(form){
	  //获得测试结束
	  var flag=$('#xqd_csjs').val();
	  if(flag=='true'){
		  $('#csjs').attr("checked",true);
	  }else{
		  $('#csjs').attr("checked",false);
	  }
	  form.render('checkbox');
  }
  
  //加载对应的项目阶段
  function loadXMJD(form){
	  var xmjds=$('#xmjd').find('input');
	  var jd=$('#jd').val();
	  for(var i=0;i<xmjds.length;i++){
		  if(jd==xmjds[i].value){
			  xmjds.eq(i).attr('checked',true);
			  break;
		  }
	  }
	  form.render('radio');
  }
  
  //加载对应的项目状态
  function loadXMZT(form){
	  var xmzts=$('#xmzt').find('input');
	  var zt=$('#zt').val();
	  for(var i=0;i<xmzts.length;i++){
		  if(zt==xmzts[i].value){
			  xmzts.eq(i).attr('checked',true);
			  break;
		  }
	  }
	  form.render('radio');
  }
  
  function loadxmxx(form){
	  //获得项目信息下拉选
	  var xmxxs=$('#xqd_xmxx').find('option');
	  //获得已选项目信息下拉选主键
	  var xmxx=$('#xmxx').val();
	  for(var i=0;i<xmxxs.length;i++){
		  if(xmxxs[i].value==xmxx){
			  xmxxs[i].setAttribute("selected",'true');
			  break;
		  }
	  }
		form.render('select');
  }
  
  function loadssxt(form){
	  //获得所属系统下拉选
	  var ssxts=$('#xqd_ssxt').find('option');
	  //获得已选所属系统下拉选主键
	  var ssxt=$('#ssxt').val();
	  for(var i=0;i<ssxts.length;i++){
		  if(ssxts[i].value==ssxt){
			  ssxts[i].setAttribute("selected",'true');
			  break;
		  }
	  }
		form.render('select');
  }
  
  function loadxqlx(form){
	  //获得需求类型下拉选
	  var xqlxs=$('#xqd_xqlx').find('option');
	  //获得已选需求类型下拉选主键
	  var xqlx=$('#ssxt').val();
	  for(var i=0;i<xqlxs.length;i++){
		  if(xqlxs[i].value==xqlx){
			  xqlxs[i].setAttribute("selected",'true');
			  break;
		  }
	  }
		form.render('select');
  }
  
  function loadfzr(form){
	  //获得负责人下拉选
	  var fzrs=$('#xqd_fzr').find('option');
	  //获得已选需求类型下拉选主键
	  var fzr=$('#fzr').val();
	  for(var i=0;i<fzrs.length;i++){
		  if(fzrs[i].value==fzr){
			  fzrs[i].setAttribute("selected",'true');
			  break;
		  }
	  }
		form.render('select');
  }
  
  function loadkh(form){
	  //获得负责人下拉选
	  var khs=$('#xqd_kh').find('option');
	  //获得已选需求类型下拉选主键
	  var kh=$('#kh').val();
	  for(var i=0;i<khs.length;i++){
		  if(khs[i].value==kh){
			  khs[i].setAttribute("selected",'true');
			  break;
		  }
	  }
		form.render('select');
  }
  
</script>
</body>
</html>