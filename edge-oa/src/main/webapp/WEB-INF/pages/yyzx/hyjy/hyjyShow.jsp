<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>会议纪要查看</title>
<link rel="stylesheet" href="../layui-v2.4.5/layui/css/layui.css">
<link rel="stylesheet" href="../bootstrap-3.3.7-dist/css/bootstrap.min.css"> 
<link rel="stylesheet" href="../bootstrap-3.3.7-dist/css/bootstrap-theme.min.css"> 
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@page isELIgnored="false" %>
<style>
  .bj{background-color: #F0F0F0}
 </style>
</head>
<body onload="refreshAndClose()" style="width:100%;padding:0px; margin:0px;">
	<div style="width:1280px;height:auto;padding:0px; margin:0 auto;" id="main">
		<form class="layui-form" action='<c:url value="/hyjy/editHyjy.do"/>' method="post" id="myForm" style="margin-top:30px;">
			<input type="hidden" id="url" value='<c:url value="/"/>'>
			<input type="hidden" id="flag" value="${flag}">
			<input type="hidden" id="khdm" value="${hyjy.kehudm}"> 
			<input type="hidden" name="hyjydm" value="${hyjy.hyjydm}">
			
			<div class="layui-form-item">
			 	<div class="layui-inline" style="left:10px;">
				      <label class="layui-form-label" style="width: 120px;">会议纪要代号</label>
				      <div class="layui-input-inline">
				        <input type="text" name="hyjydh" lay-verify="hyjydh" autocomplete="off" class="layui-input bj" id="hyjydh" value="${hyjy.hyjydh}" disabled="">
				      </div>
			    </div>
			    
				<div class="layui-inline" style="left:30px;">
				      <label class="layui-form-label" style="width: 120px;">会议主题</label>
				      <div class="layui-input-inline">
				        <input type="text" name="hyzt" lay-verify="hyzt" autocomplete="off" class="layui-input bj" id="hyzt" value="${hyjy.hyzt}" disabled="">
				      </div>
			    </div>
				 
				 <div class="layui-inline" style="left:-13px;">
				      <label class="layui-form-label" style="width: 120px;">客户</label>
				      <div class="layui-input-inline">
				        <input type="text" name="hyzt" lay-verify="hyzt" autocomplete="off" class="layui-input bj" id="hyzt" value="${hyjy.khmc}" disabled="">
				      </div>
			    </div>
			  
			 </div>
		 
		 	<div class="layui-form-item">
			 	<div class="layui-inline" style="left:10px;">
				      <label class="layui-form-label" style="width: 120px;">参与人员</label>
				      <div class="layui-input-inline">
				        <input type="text" name="cyry" lay-verify="cyry" autocomplete="off" class="layui-input bj" id="cyry" value="${hyjy.cyry}" disabled="">
				      </div>
			    </div>
			    
				<div class="layui-inline" style="left:60px;">
				      <label class="layui-form-label" style="width: 90px;">开始时间</label>
				      <div class="layui-input-inline">
				        <input type="text" name="beginTime" id="beginTime" lay-verify="beginTime" placeholder="yyyy-mm-dd" autocomplete="off" class="layui-input bj" value="${kssj}" disabled="">
				      </div>
			    </div>
				 
			    <div class="layui-inline" style="left:48px;">
				      <label class="layui-form-label" style="width: 90px;">结束时间</label>
				      <div class="layui-input-inline">
				        <input type="text" name="endTime" id="endTime" lay-verify="endTime" placeholder="yyyy-mm-dd" autocomplete="off" class="layui-input bj" value="${jssj}" disabled="">
				      </div>
			    </div>
			  
			 </div>
		 
			 <div class="layui-form-item layui-form-text">
			    <label class="layui-form-label" style="width: 128px;">备注</label>
			    <div class="layui-input-block">
			      <textarea placeholder="请输入内容" name="bz"  lay-verify="bz" id="bz" class="layui-textarea bj" style="width:840px;" disabled="">${hyjy.bz}</textarea>
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
    elem: '#beginTime'
  });
  laydate.render({
	    elem: '#endTime'
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
  pageReloadKh(form);
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
					$("#kehudm").append(
							"<option value='"+msg[i].khdm+"'>"+ msg[i].khmc +"</option>");
				}
				form.render('select');
			}
		});
  }
  
  //加载已选客户
  function pageReloadKh(form){
	  //获得客户下拉选
	  var khs=$('#kehudm').find('option');
	  //获得已选客户下拉选主键
	  var khdm=$('#khdm').val();
	  for(var i=0;i<khs.length;i++){
		  if(khs[i].value==khdm){
			  khs[i].setAttribute("selected",'true');
			  break;
		  }
	  }
		form.render('select');
  }
</script>
</body>
</html>