<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>新增项目信息</title>
<link rel="stylesheet" href="../layui-v2.4.5/layui/css/layui.css">
<link rel="stylesheet" href="../bootstrap-3.3.7-dist/css/bootstrap.min.css"> 
<link rel="stylesheet" href="../bootstrap-3.3.7-dist/css/bootstrap-theme.min.css"> 
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@page isELIgnored="false" %>
</head>
<body onload="refreshAndClose()" style="width:100%;padding:0px; margin:0px;">
	<div style="width:1280px;height:auto;padding:0px; margin:0 auto;" id="main">
		<form class="layui-form" action='<c:url value="/xmxx/saveXMXX.do"/>' method="post" id="myForm" style="margin-top:30px;">
			<input type="hidden" id="url" value='<c:url value="/"/>'>
			<input type="hidden" id="flag" value="${flag}"> 
			
			<div class="layui-form-item">
			 	<div class="layui-inline" style="left:10px;">
				      <label class="layui-form-label" style="width: 120px;">预算编号</label>
				      <div class="layui-input-inline">
				        <input type="text" name="xmxx_ysbh" lay-verify="xmxx_ysbh" autocomplete="off" class="layui-input" id="xmxx_ysbh">
				      </div>
			    </div>
			    
				<div class="layui-inline" style="left:30px;">
				      <label class="layui-form-label" style="width: 120px;">代号</label>
				      <div class="layui-input-inline">
				        <input type="text" name="xmxx_dh" lay-verify="xmxx_dh" autocomplete="off" class="layui-input" id="xmxx_dh">
				      </div>
			    </div>
			    
			    <div class="layui-inline" style="left:30px;">
				      <label class="layui-form-label" style="width: 120px;">名称</label>
				      <div class="layui-input-inline">
				        <input type="text" name="xmxx_mc" lay-verify="xmxx_mc" autocomplete="off" class="layui-input" id="xmxx_mc">
				      </div>
			    </div>
				 
			 </div>
		 
		 	<div class="layui-form-item">
		 	
			 	 <div class="layui-inline" style="left:34px;">
				  	<label class="layui-form-label" style="width: 95px;">负责人</label>
					<div class="layui-input-inline" style="text-align: left;">
						<select name="xmxx_fzr" id="xmxx_fzr" lay-filter="xmxx_fzr" lay-verify="xmxx_fzr">
							<option value="" selected="selected">请选择负责人</option>
						</select>
					</div>
				 </div>
			    
				<div class="layui-inline" style="left:60px;">
				      <label class="layui-form-label" style="width:115px;">计划开始时间</label>
				      <div class="layui-input-inline">
				        <input type="text" name="xmxx_jhkssj" id="xmxx_jhkssj" lay-verify="xmxx_jhkssj" placeholder="yyyy-mm-dd" autocomplete="off" class="layui-input">
				      </div>
			    </div>
				 
			    <div class="layui-inline" style="left:48px;">
				      <label class="layui-form-label" style="width:133px;">计划结束时间</label>
				      <div class="layui-input-inline">
				        <input type="text" name="xmxx_jhjssj" id="xmxx_jhjssj" lay-verify="xmxx_jhjssj" placeholder="yyyy-mm-dd" autocomplete="off" class="layui-input">
				      </div>
			    </div>
			  
			 </div>
			 
			 
			 <div class="layui-form-item">
		 	
			 	 <div class="layui-inline" style="left:35px;">
				  	<label class="layui-form-label" style="width: 95px;">客户</label>
					<div class="layui-input-inline" style="text-align: left;">
						<select name="xmxx_kh" id="xmxx_kh" lay-filter="xmxx_kh" lay-verify="xmxx_kh">
							<option value="" selected="selected">请选择客户</option>
						</select>
					</div>
				 </div>
			    
				 <div class="layui-inline" style="left:55px;">
				      <label class="layui-form-label" style="width: 120px;">客户部门</label>
				      <div class="layui-input-inline">
				        <input type="text" name="xmxx_khbm" lay-verify="xmxx_khbm" autocomplete="off" class="layui-input" id="xmxx_khbm">
				      </div>
			    </div>
				 
			    <div class="layui-inline" style="left:55px;">
				      <label class="layui-form-label" style="width: 120px;">客户负责人</label>
				      <div class="layui-input-inline">
				        <input type="text" name="xmxx_khfzr" lay-verify="xmxx_khfzr" autocomplete="off" class="layui-input" id="xmxx_khfzr">
				      </div>
			    </div>
			  
			 </div>
			 
			 
			  <div class="layui-form-item">
		 	
			 	<div class="layui-inline" style="left:40px;">
				      <label class="layui-form-label" style="width: 90px;">提出日期</label>
				      <div class="layui-input-inline">
				        <input type="text" name="xmxx_tcrq" id="xmxx_tcrq" lay-verify="xmxx_tcrq" placeholder="yyyy-mm-dd" autocomplete="off" class="layui-input">
				      </div>
			    </div>
			    
				 <div class="layui-inline" style="left:60px;">
				      <label class="layui-form-label" style="width: 120px;">项目金额</label>
				      <div class="layui-input-inline">
				        <input type="text" name="xmxx_xmje" lay-verify="xmxx_xmje" autocomplete="off" class="layui-input" id="xmxx_xmje" onchange="xmjeChange()">
				      </div>
			    </div>
				 
			    <div class="layui-inline" style="left:60px;">
				      <label class="layui-form-label" style="width: 120px;">预计工作量</label>
				      <div class="layui-input-inline">
				        <input type="text" name="xmxx_yjgzl" lay-verify="xmxx_yjgzl" autocomplete="off" class="layui-input" id="xmxx_yjgzl" onchange="yjgzlChange()">
				      </div>
			    </div>
			  
			 </div>
		 
			 <div class="layui-form-item layui-form-text">
			    <label class="layui-form-label" style="width: 128px;">备注</label>
			    <div class="layui-input-block">
			      <textarea placeholder="请输入内容" name="xmxx_bz"  lay-verify="xmxx_bz" id="xmxx_bz" class="layui-textarea" style="width:880px;"></textarea>
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
  
  reloadKh(form);
  allFZR(form);
});
  function refreshAndClose(){
	var flag=$('#flag').val();
	if(flag){
		window.parent.location.reload();
		window.close();
	} 
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
					$("#xmxx_kh").append(
							"<option value='"+msg[i].khdm+"'>"+ msg[i].khmc +"</option>");
				}
				form.render('select');
			}
		});
  }
  
//ajax实现查询所有的负责人
  function  allFZR(form){
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
  				$("#xmxx_fzr").append(
  						"<option value='"+msg[i].user_id+"'>"+ msg[i].user_name +"</option>");
  			}
  			form.render('select');
  		}
  	});
  }
  
	//项目金额带两位小数点
	function xmjeChange(){
		//获得项目金额输入的值
		var xmje=$('#xmxx_xmje').val()*1;
		if(xmje!=""){
			var je=xmje.toFixed(2); 
			$('#xmxx_xmje').val(je);
		}else{
			$('#xmxx_xmje').val("0.00");
		}
	}
	
	//预计工作量带两位小数点
	function yjgzlChange(){
		//获得预计工作量输入的值
		var yjgzl=$('#xmxx_yjgzl').val()*1;
		if(yjgzl!=""){
			var gzl=yjgzl.toFixed(2); 
			$('#xmxx_yjgzl').val(gzl);
		}else{
			$('#xmxx_yjgzl').val("0.00");
		}
	}
</script>
</body>
</html>