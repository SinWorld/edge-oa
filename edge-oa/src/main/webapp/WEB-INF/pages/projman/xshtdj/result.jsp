<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>审批结果</title>
<link rel="stylesheet" href="../layui-v2.4.5/layui/css/layui.css">
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@page isELIgnored="false" %>
</head>
<body onload="refreshAndClose()">
<div style="margin-top: 70px; margin-left: auto; margin-right: auto; width: auto;">
		<form class="layui-form" id="form" method="post">
			<div class="layui-form-item">
			    <label class="layui-form-label"  style="width: 125px;">审批结果</label>
			    <div class="layui-input-block">
			    <input type="hidden" value="${taskId}" id="taskId">
			    <input type="hidden" value='<c:url value="/"/>' id="url">
			    <input type="hidden" id="flag" value="${flag}"> 
			      <input type="radio" name="outcome" value="同意" title="同意" lay-verify="result"  lay-filter="erweima">
			      <input type="radio" name="outcome" value="不同意" title="不同意" lay-verify="result"  lay-filter="erweima">
			      <input type="radio" name="outcome" value="退回" title="退回" lay-verify="result"  lay-filter="erweima">
			    </div>
			  </div>

			<div class="layui-form-item layui-form-text">
				<label class="layui-form-label" style="width: 125px;">审批意见</label>
				<div class="layui-input-block">
					<textarea placeholder="请输入内容" lay-verify="remark"
						class="layui-textarea" style="width: 56.5%" name="advice" id="advice"></textarea>
				</div>
			</div>

			<div class="layui-form-item" style="text-align: center;">
				<div class="layui-input-block">
					<button class="layui-btn" lay-submit="" lay-filter="demo1"
						style="width: 35%; margin-top: 10px;" type="button" id="sub">立即提交</button>
					<!--  <button type="reset" class="layui-btn layui-btn-primary">重置</button> -->
				</div>
			</div>
		</form>
	</div>
	<script src="../layui-v2.4.5/layui/layui.js" charset="utf-8"></script>
<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 --> 
 <script type="text/javascript" src="../jquery/jquery-3.3.1.js"></script>
<script>
layui.use(['form', 'layedit', 'laydate'], function(){
	  var form = layui.form
	  ,layer = layui.layer
	  ,layedit = layui.layedit
	  ,laydate = layui.laydate;
	  form.render();
	 
	  //监听提交
	  $('#sub').click(function(){
		  var form=document.getElementById('form');
		  var url=$('#url').val();
		  var task_id=$('#taskId').val();
		  form.action=url+"index/saveSubmitTask.do?task_id="+task_id;
		  form.submit();
	  });
	  
	form.verify({
		result: function(value, item){ //value：表单的值、item：表单的DOM对象
			//获得单选按钮对象
			var radios=$('input[name="outcome"]');
			//遍历单选按钮对象 若有一个选择则通过
			var flag=false;
			for(var i=0;i<radios.length;i++){
				if(radios[i].checked==true){
					flag=true;
				}
			}
		    if(flag==false){
		    	 return '评审结果不能为空';
		    }
		    }
		,remark: function(value){
		     if(value==""){
		     	 return '评审意见不能为空';
		     }
		   }
	}); 
	  form.on('radio(erweima)', function (data) {
          var value=data.value;
          if(value=='同意'){
        	  $('#advice').text("同意");
          }if(value=='不同意'){
        	  $('#advice').text("");
          }if(value=='退回'){
        	  $('#advice').text("");
          }
      });
});

function refreshAndClose(){
	var flag=$('#flag').val();
	if(flag){
		window.parent.location.reload();
		window.close();
	} 
}
	
</script>
</body>
</html>