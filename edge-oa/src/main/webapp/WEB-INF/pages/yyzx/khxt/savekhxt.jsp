<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>新增客户系统</title>
<link rel="stylesheet" href="../layui-v2.4.5/layui/css/layui.css">
<link rel="stylesheet" href="../bootstrap-3.3.7-dist/css/bootstrap.min.css"> 
<link rel="stylesheet" href="../bootstrap-3.3.7-dist/css/bootstrap-theme.min.css"> 
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@page isELIgnored="false" %>
</head>
<body onload="refreshAndClose()" style="width:100%;padding:0px; margin:0px;">
	<div style="width:1280px;height:auto;padding:0px; margin:0 auto;" id="main">
		<form class="layui-form" action='<c:url value="/khxt/saveKHXT.do"/>' method="post" id="myForm" style="margin-top:30px;">
			<input type="hidden" id="url" value='<c:url value="/"/>'>
			<input type="hidden" id="flag" value="${flag}"> 
			
			<div class="layui-form-item">
			 	<div class="layui-inline" style="left:10px;">
				      <label class="layui-form-label" style="width: 120px;">代号</label>
				      <div class="layui-input-inline">
				        <input type="text" name="khxt_dh" lay-verify="khxt_dh" autocomplete="off" class="layui-input" id="khxt_dh">
				      </div>
			    </div>
			    
				<div class="layui-inline" style="left:30px;">
				      <label class="layui-form-label" style="width: 120px;">名称</label>
				      <div class="layui-input-inline">
				        <input type="text" name="khxt_mc" lay-verify="khxt_mc" autocomplete="off" class="layui-input" id="khxt_mc">
				      </div>
			    </div>
				 
			    <div class="layui-inline" style="left:12px;">
				  	<label class="layui-form-label" style="width: 95px;">客户</label>
					<div class="layui-input-inline" style="text-align: left;">
						<select name="khxt_khdm" id="khxt_khdm" lay-filter="khxt_khdm" lay-verify="khxt_khdm">
							<option value="" selected="selected">请选择客户</option>
						</select>
					</div>
				 </div>
			  
			 </div>
		 
		 	<div class="layui-form-item">
			 	<div class="layui-inline" style="left:10px;">
				      <label class="layui-form-label" style="width: 120px;">客户部门</label>
				      <div class="layui-input-inline">
				        <input type="text" name="khxt_khbm" lay-verify="khxt_khbm" autocomplete="off" class="layui-input" id="khxt_khbm">
				      </div>
			    </div>
			    
				<div class="layui-inline" style="left:40px;">
				      <label class="layui-form-label" style="width:110px;">客户负责人</label>
				      <div class="layui-input-inline">
				        <input type="text" name="khxt_khfzr" id="khxt_khfzr" lay-verify="khxt_khfzr"  autocomplete="off" class="layui-input">
				      </div>
			    </div>
				 
			    <div class="layui-inline" style="left:28px;">
				      <label class="layui-form-label" style="width: 90px;">上线日期</label>
				      <div class="layui-input-inline">
				        <input type="text" name="khxt_sxrq" id="khxt_sxrq" lay-verify="khxt_sxrq" placeholder="yyyy-mm-dd" autocomplete="off" class="layui-input">
				      </div>
			    </div>
			  
			 </div>
		 
			 <div class="layui-form-item layui-form-text">
			    <label class="layui-form-label" style="width: 128px;">备注</label>
			    <div class="layui-input-block">
			      <textarea placeholder="请输入内容" name="khxt_bz"  lay-verify="khxt_bz" id="khxt_bz" class="layui-textarea" style="width:840px;"></textarea>
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
    elem: '#khxt_sxrq'
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
					$("#khxt_khdm").append(
							"<option value='"+msg[i].khdm+"'>"+ msg[i].khmc +"</option>");
				}
				form.render('select');
			}
		});
  }
</script>
</body>
</html>