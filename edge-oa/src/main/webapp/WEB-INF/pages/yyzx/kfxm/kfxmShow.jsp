<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>开发项目查看</title>
<link rel="stylesheet" href="../layui-v2.4.5/layui/css/layui.css">
<link rel="stylesheet" href="../bootstrap-3.3.7-dist/css/bootstrap.min.css"> 
<link rel="stylesheet" href="../bootstrap-3.3.7-dist/css/bootstrap-theme.min.css"> 
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@page isELIgnored="false" %>
<style>
  .bj{background-color: #F0F0F0}
 </style>
</head>
<body  style="width:100%;padding:0px; margin:0px;">
	<div style="width:1280px;height:auto;padding:0px; margin:0 auto;" id="main">
		<form class="layui-form" action='' method="post" id="myForm" style="margin-top:30px;">
			<input type="hidden" id="url" value='<c:url value="/"/>'>
			<div class="layui-form-item">
			 	<div class="layui-inline" style="left:8px;">
				      <label class="layui-form-label" style="width: 120px;">开发项目代号</label>
				      <div class="layui-input-inline">
				        <input type="text" name="kfxm_dh" lay-verify="kfxm_dh" autocomplete="off" class="layui-input bj" id="kfxm_dh" style="width: 210px;" value="${kfxm.kfxm_dh}" disabled="">
				      </div>
			    </div>
			    
				<div class="layui-inline" style="left:80px;">
				      <label class="layui-form-label" style="width: 120px;">开发项目名称</label>
				      <div class="layui-input-inline">
				        <input type="text" name="kfxm_mc" lay-verify="kfxm_mc" autocomplete="off" class="layui-input bj" id="kfxm_mc" style="width: 500px;" value="${kfxm.kfxm_mc}" disabled="">
				      </div>
			    </div>
			</div>
		 
		 	<div class="layui-form-item">
		 	
				 <div class="layui-inline" style="left:8px;">
				      <label class="layui-form-label" style="width: 120px;">客户</label>
				      <div class="layui-input-inline">
				        <input type="text" name="khmc" lay-verify="khmc" autocomplete="off" class="layui-input bj" id="kfxm_mc" style="width:312px;" value="${kfxm.khmc}" disabled="">
				      </div>
			    </div>
			    
				 <div class="layui-inline" style="left:80px;">
				      <label class="layui-form-label" style="width: 120px;">签约主体</label>
				      <div class="layui-input-inline">
				        <input type="text" name="qyztmc" lay-verify="qyztmc" autocomplete="off" class="layui-input bj" id="qyztmc" style="width: 500px;" value="${kfxm.qyztmc}" disabled="">
				      </div>
			    </div>
			  
			 </div>
			 
			 
			 <div class="layui-form-item">
			    
			     <div class="layui-inline" style="left:22px;">
				      <label class="layui-form-label" style="width: 106px;">是否已编制<br/>测试报告</label>
				      <div class="layui-input-inline">
					      <c:if test="${kfxm.kfxm_sfybzcsbg eq true}">
					        <input type="text" name="qyztmc" lay-verify="qyztmc" autocomplete="off" class="layui-input bj" id="qyztmc" style="width: 100px;" value="是" disabled="">
					      </c:if>
					      <c:if test="${kfxm.kfxm_sfybzcsbg eq false}">
					        <input type="text" name="qyztmc" lay-verify="qyztmc" autocomplete="off" class="layui-input bj" id="qyztmc" style="width: 100px;" value="否" disabled="">
					      </c:if>
				      </div>
			     </div>
			    
			    <div class="layui-inline" style="left:-82px;">
				      <label class="layui-form-label" style="width: 103px;">是否已<br/>签订合同</label>
				      <div class="layui-input-inline">
				      	<c:if test="${kfxm.kfxm_sfyqdht eq true}">
				       		 <input type="text" name="qyztmc" lay-verify="qyztmc" autocomplete="off" class="layui-input bj" id="qyztmc" style="width: 100px;" value="是" disabled="">
				      	</c:if>
				      	<c:if test="${kfxm.kfxm_sfyqdht eq false}">
				       		 <input type="text" name="qyztmc" lay-verify="qyztmc" autocomplete="off" class="layui-input bj" id="qyztmc" style="width: 100px;" value="否" disabled="">
				      	</c:if>
				      </div>
			     </div>
			     
			      <div class="layui-inline" style="left:-219px;">
				      <label class="layui-form-label" style="width: 117px;">是否已确定<br/>设计方案</label>
				      <div class="layui-input-inline">
				      	<c:if test="${kfxm.kfxm_sfyqdsjfa eq true}">
				           <input type="text" name="qyztmc" lay-verify="qyztmc" autocomplete="off" class="layui-input bj" id="qyztmc" style="width: 100px;" value="是" disabled="">
				      	</c:if>
				      	<c:if test="${kfxm.kfxm_sfyqdsjfa eq false}">
				           <input type="text" name="qyztmc" lay-verify="qyztmc" autocomplete="off" class="layui-input bj" id="qyztmc" style="width: 100px;" value="否" disabled="">
				      	</c:if>
				      </div>
			     </div>
			     
			     <div class="layui-inline" style="left:632px;top:-67px;">
				      <label class="layui-form-label" style="width: 120px;">是否已确定<br/>用户使用手册</label>
				      <div class="layui-input-inline">
				       	<c:if test="${kfxm.kfxm_sfyqdyhsysc eq true}">
				          <input type="text" name="qyztmc" lay-verify="qyztmc" autocomplete="off" class="layui-input bj" id="qyztmc" style="width: 100px;" value="是" disabled="">
				      	</c:if>
				      	<c:if test="${kfxm.kfxm_sfyqdyhsysc eq false}">
				          <input type="text" name="qyztmc" lay-verify="qyztmc" autocomplete="off" class="layui-input bj" id="qyztmc" style="width: 100px;" value="否" disabled="">
				      	</c:if>
				      </div>
			     </div>
			     
			       <div class="layui-inline" style="left:481px;top:-67px;">
				      <label class="layui-form-label" style="width: 120px;">是否已<br/>签订验收单</label>
				      <div class="layui-input-inline">
				        <c:if test="${kfxm.kfxm_sfyqdysd eq true}">
				           <input type="text" name="qyztmc" lay-verify="qyztmc" autocomplete="off" class="layui-input bj" id="qyztmc" style="width: 100px;" value="是" disabled="">
				     	</c:if>
				     	<c:if test="${kfxm.kfxm_sfyqdysd eq false}">
				           <input type="text" name="qyztmc" lay-verify="qyztmc" autocomplete="off" class="layui-input bj" id="qyztmc" style="width: 100px;" value="否" disabled="">
				     	</c:if>
				      </div>
			     </div>
				 
			 </div>
			 
			 
			 
			  <div class="layui-form-item">
				   <div class="layui-inline" style="left:8px;top: -90px;">
				      <label class="layui-form-label" style="width: 120px;">项目阶段</label>
				      <div class="layui-input-inline">
				        <input type="text" name="khmc" lay-verify="khmc" autocomplete="off" class="layui-input bj" id="kfxm_mc" style="width:314px;" value="${kfxm.xmjdmc}" disabled="">
				      </div>
			      </div>
			      
				 <div class="layui-inline" style="left:80px;top: -90px;">
				      <label class="layui-form-label" style="width: 120px;">项目状态</label>
				      <div class="layui-input-inline">
				        <input type="text" name="khmc" lay-verify="khmc" autocomplete="off" class="layui-input bj" id="kfxm_mc" style="width: 500px;" value="${kfxm.xmztmc}" disabled="">
				      </div>
			      </div>
			 </div>
		 
			 <div class="layui-form-item layui-form-text">
			    <label class="layui-form-label" style="width: 128px;top:-90px;">项目描述</label>
			    <div class="layui-input-block" style="top:-90px;">
			      <textarea placeholder="请输入内容" name="kfxm_xmms"  lay-verify="kfxm_xmms" id="kfxm_xmms" class="layui-textarea bj" style="width:910px;" disabled="">${kfxm.kfxm_xmms}</textarea>
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

  //创建一个编辑器
  var editIndex = layedit.build('LAY_demo_editor');
  
  //监听提交
  form.on('submit(demo1)', function(data){
    layer.alert(JSON.stringify(data.field), {
      title: '最终的提交信息'
    })
    return true;
  });
  
});

</script>
</body>
</html>