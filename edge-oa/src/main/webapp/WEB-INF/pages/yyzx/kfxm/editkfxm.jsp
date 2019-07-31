<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>编辑开发项目</title>
<link rel="stylesheet" href="../layui-v2.4.5/layui/css/layui.css">
<link rel="stylesheet" href="../bootstrap-3.3.7-dist/css/bootstrap.min.css"> 
<link rel="stylesheet" href="../bootstrap-3.3.7-dist/css/bootstrap-theme.min.css"> 
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@page isELIgnored="false" %>
</head>
<body onload="refreshAndClose()" style="width:100%;padding:0px; margin:0px;">
	<div style="width:1280px;height:auto;padding:0px; margin:0 auto;" id="main">
		<form class="layui-form" action='<c:url value="/kfxm/editKFXM.do"/>' method="post" id="myForm" style="margin-top:30px;">
			<input type="hidden" id="url" value='<c:url value="/"/>'>
			<input type="hidden" id="flag" value="${flag}">
			<input type="hidden" value="${kfxm.kfxm_sfybzcsbg}" name="kfxm_sfybzcsbg" id="kfxm_sfybzcsbg">
			<input type="hidden" value="${kfxm.kfxm_sfyqdht}" name="kfxm_sfyqdht" id="kfxm_sfyqdht">
			<input type="hidden" value="${kfxm.kfxm_sfyqdsjfa}" name="kfxm_sfyqdsjfa" id="kfxm_sfyqdsjfa">
			<input type="hidden" value="${kfxm.kfxm_sfyqdyhsysc}" name="kfxm_sfyqdyhsysc" id="kfxm_sfyqdyhsysc">
			<input type="hidden" value="${kfxm.kfxm_sfyqdysd}" name="kfxm_sfyqdysd" id="kfxm_sfyqdysd"> 
			<input type="hidden" value="${kfxm.kfxm_xmjd }" id="jd">
			<input type="hidden" value="${kfxm.kfxm_xmzt }" id="zt">
			<input type="hidden" value="${kfxm.kfxm_kh}" id="kh">
			<input type="hidden" value="${kfxm.kfxm_qyzt}" id="qyzt">
			<input type="hidden" value="${kfxm.kfxm_dm}" name="kfxm_dm">
			<div class="layui-form-item">
			 	<div class="layui-inline" style="left:10px;">
				      <label class="layui-form-label" style="width: 120px;">开发项目代号</label>
				      <div class="layui-input-inline">
				        <input type="text" name="kfxm_dh" lay-verify="kfxm_dh" autocomplete="off" class="layui-input" id="kfxm_dh" style="width: 210px;" value="${kfxm.kfxm_dh}">
				      </div>
			    </div>
			    
				<div class="layui-inline" style="left:80px;">
				      <label class="layui-form-label" style="width: 120px;">开发项目名称</label>
				      <div class="layui-input-inline">
				        <input type="text" name="kfxm_mc" lay-verify="kfxm_mc" autocomplete="off" class="layui-input" id="kfxm_mc" style="width: 500px;" value="${kfxm.kfxm_mc}">
				      </div>
			    </div>
			</div>
		 
		 	<div class="layui-form-item">
		 	
			 	 <div class="layui-inline" style="left:34px;">
				  	<label class="layui-form-label" style="width: 95px;">客户</label>
					<div class="layui-input-inline" style="text-align: left;width: 400px;">
						<select name="kfxm_kh" id="kfxm_kh" lay-filter="kfxm_kh" lay-verify="kfxm_kh" style="width: 400px;">
							<option value="" selected="selected">请选择客户</option>
						</select>
					</div>
				 </div>
			    
				 <div class="layui-inline" style="left:34px;">
				  	<label class="layui-form-label" style="width: 95px;">签约主体</label>
					<div class="layui-input-inline" style="text-align: left;width:386px;">
						<select name="kfxm_qyzt" id="kfxm_qyzt" lay-filter="kfxm_qyzt" lay-verify="kfxm_qyzt" style="width:386px;">
							<option value="" selected="selected">请选择签约主体</option>
						</select>
					</div>
				 </div>
			  
			 </div>
			 
			 
			 <div class="layui-form-item">
			 	 <div class="layui-inline" style="left:23px;">
			    	<label class="layui-form-label" style="width:170px;">是否已编制测试报告</label>
				    <div class="layui-input-block" style="width: 200px;">
				      <input type="checkbox"  lay-skin="primary" lay-filter="sfybzcsbg" id="sfbzcsbg">
				    </div>
			    </div>
			    
				 <div class="layui-inline" style="left:200px;">
			    	<label class="layui-form-label" style="width:152px;">是否已签订合同</label>
				    <div class="layui-input-block" style="width: 200px;">
				      <input type="checkbox"  lay-skin="primary" lay-filter="sfyqdht" id="sfyqdht">
				    </div>
			    </div>
				 
			     <div class="layui-inline" style="left:420px;">
			    	<label class="layui-form-label" style="width:170px;">是否已确定设计方案</label>
				    <div class="layui-input-block" style="width: 200px;">
				      <input type="checkbox"  lay-skin="primary" lay-filter="sfyqdsjfa" id="sfyqdsjfa">
				    </div>
			    </div>
			 </div>
			 
			 
			 <div class="layui-form-item">
			 	 <div class="layui-inline" style="left:3px;">
			    	<label class="layui-form-label" style="width:190px;">是否已确定用户使用手册</label>
				    <div class="layui-input-block" style="width: 235px;">
				      <input type="checkbox"  lay-skin="primary" lay-filter="sfyqdyhsysc" id="sfyqdyhsysc">
				    </div>
			    </div>
			    
				 <div class="layui-inline" style="left:165px;">
			    	<label class="layui-form-label" style="width:152px;">是否已签订验收单</label>
				    <div class="layui-input-block" style="width: 200px;">
				      <input type="checkbox"  lay-skin="primary" lay-filter="sfyqdysd" id="sfyqdysd">
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
			    <label class="layui-form-label" style="width: 128px;">项目描述</label>
			    <div class="layui-input-block">
			      <textarea placeholder="请输入内容" name="kfxm_xmms"  lay-verify="kfxm_xmms" id="kfxm_xmms" class="layui-textarea" style="width:910px;">${kfxm.kfxm_xmms}</textarea>
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
    elem: '#xmxx_jhkssj'
  });
  
  laydate.render({
	    elem: '#xmxx_jhjssj'
  });
  
  laydate.render({
	    elem: '#xmxx_tcrq'
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
  
  reloadXMJD(form);
  reloadXMZT(form);
  reloadKh(form);
  reloadQYZT(form);
  
  //是否已编制测试报告
  form.on('checkbox(sfybzcsbg)', function(data){
	  var flag=data.elem.checked;
	  if(flag){
		  $('#kfxm_sfybzcsbg').val(true);
	  }else{
		  $('#kfxm_sfybzcsbg').val(false);
	  }
   });
  
  //是否已编签订合同
  form.on('checkbox(sfyqdht)', function(data){
	  var flag=data.elem.checked;
	  if(flag){
		  $('#kfxm_sfyqdht').val(true);
	  }else{
		  $('#kfxm_sfyqdht').val(false);
	  }
   });
  
  //是否已确定设计方案
  form.on('checkbox(sfyqdsjfa)', function(data){
	  var flag=data.elem.checked;
	  if(flag){
		  $('#kfxm_sfyqdsjfa').val(true);
	  }else{
		  $('#kfxm_sfyqdsjfa').val(false);
	  }
   });
  
  //是否已确定用户使用手册
  form.on('checkbox(sfyqdyhsysc)', function(data){
	  var flag=data.elem.checked;
	  if(flag){
		  $('#kfxm_sfyqdyhsysc').val(true);
	  }else{
		  $('#kfxm_sfyqdyhsysc').val(false);
	  }
   });
  
  //是否已签订验收单
  form.on('checkbox(sfyqdysd)', function(data){
	  var flag=data.elem.checked;
	  if(flag){
		  $('#kfxm_sfyqdysd').val(true);
	  }else{
		  $('#kfxm_sfyqdysd').val(false);
	  }
   });
  
  setbzcsbg(form);
  setqdht(form);
  setqdfa(form);
  setyhsysc(form);
  setysd(form);
  loadXMJD(form);
  loadXMZT(form);
  loadkh(form);
  loadqyzt(form);
});

  function refreshAndClose(){
	var flag=$('#flag').val();
	if(flag){
		window.parent.location.reload();
		window.close();
	} 
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
							"<input type='radio' name='kfxm_xmjd' value='"+msg[i].xmjd_dm+"' title='"+msg[i].xmjd_mc+"'>");
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
							"<input type='radio' name='kfxm_xmzt' value='"+msg[i].xmzt_dm+"' title='"+msg[i].xmzt_mc+"'>");
				}
				form.render('radio');
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
					$("#kfxm_kh").append(
							"<option value='"+msg[i].khdm+"'>"+ msg[i].khmc +"</option>");
				}
				form.render('select');
			}
		});
  }
  
  //ajax加载所有的签约主体
  function reloadQYZT(form){
		$.ajax({
			type : "post",
			url : "<c:url value='/kfxm/queryAllQYZT.do'/>",
			async : false,
			dataType : 'json',
			error : function() {
				alert("出错");
			},
			success : function(msg) {
				for (var i = 0; i < msg.length; i++) {
					$("#kfxm_qyzt").append(
							"<option value='"+msg[i].qyztdm+"'>"+ msg[i].qyztmc +"</option>");
				}
				form.render('select');
			}
		});
  }
  
  //是否已编制测试报告
  function setbzcsbg(form){
	  //获得编制测试报告
	  var flag=$('#kfxm_sfybzcsbg').val();
	  if(flag=='true'){
		  $('#sfbzcsbg').attr("checked",true);
	  }else{
		  $('#sfbzcsbg').attr("checked",false);
	  }
	  form.render('checkbox');
  }
  
  //是否已签订合同
  function setqdht(form){
	  var flag=$('#kfxm_sfyqdht').val();
	  if(flag=='true'){
		  $('#sfyqdht').attr("checked",true);
	  }else{
		  $('#sfyqdht').attr("checked",false);
	  }
	  form.render('checkbox');
  }
  
  //是否已确定设计方案
  function setqdfa(form){
	  var flag=$('#kfxm_sfyqdsjfa').val();
	  if(flag=='true'){
		  $('#sfyqdsjfa').attr("checked",true);
	  }else{
		  $('#sfyqdsjfa').attr("checked",false);
	  }
	  form.render('checkbox');
  }
  
  //是否已确定用户使用手册
  function setyhsysc(form){
	  var flag=$('#kfxm_sfyqdyhsysc').val();
	  if(flag=='true'){
		  $('#sfyqdyhsysc').attr("checked",true);
	  }else{
		  $('#sfyqdyhsysc').attr("checked",false);
	  }
	  form.render('checkbox');
  }
  
  //是否已确定验收单
  function setysd(form){
	  var flag=$('#kfxm_sfyqdysd').val();
	  if(flag=='true'){
		  $('#sfyqdysd').attr("checked",true);
	  }else{
		  $('#sfyqdysd').attr("checked",false);
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
  
  function loadkh(form){
	  //获得客户下拉选
	  var khs=$('#kfxm_kh').find('option');
	  //获得已选客户下拉选主键
	  var kh=$('#kh').val();
	  for(var i=0;i<khs.length;i++){
		  if(khs[i].value==kh){
			  khs[i].setAttribute("selected",'true');
			  break;
		  }
	  }
		form.render('select');
  }
  
  function loadqyzt(form){
	  //获得签约主体下拉选
	  var qyzts=$('#kfxm_qyzt').find('option');
	  //获得已选签约主体下拉选主键
	  var qyzt=$('#qyzt').val();
	  for(var i=0;i<qyzts.length;i++){
		  if(qyzts[i].value==qyzt){
			  qyzts[i].setAttribute("selected",'true');
			  break;
		  }
	  }
		form.render('select');
  }
  
  
  
</script>
</body>
</html>