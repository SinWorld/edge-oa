<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>需求单查看</title>
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
			 
			<div class="layui-form-item">
			 	<div class="layui-inline" style="left:10px;">
				      <label class="layui-form-label" style="width: 120px;">需求单号</label>
				      <div class="layui-input-inline">
				        <input type="text" name="xqd_dh" lay-verify="xqd_dh" autocomplete="off" class="layui-input bj" id="xqd_dh" value="${xqd.xqd_dh}" disabled="">
				      </div>
			    </div>
			    
				<div class="layui-inline" style="left:30px;">
				      <label class="layui-form-label" style="width: 120px;">需求名称</label>
				      <div class="layui-input-inline">
				        <input type="text" name="xqd_mc" lay-verify="xqd_mc" autocomplete="off" class="layui-input bj" id="xqd_mc" value="${xqd.xqd_mc}" disabled="">
				      </div>
			    </div>
			    
			    <div class="layui-inline" style="left:30px;">
				      <label class="layui-form-label" style="width: 120px;">项目信息</label>
				      <div class="layui-input-inline">
				        <input type="text" name="xqd_mc" lay-verify="xqd_mc" autocomplete="off" class="layui-input bj" id="xqd_mc" value="${xqd.xmxxmc}" disabled="">
				      </div>
			    </div>
			    
			 </div>
		 
		 	<div class="layui-form-item">
		 	
			    <div class="layui-inline" style="left:10px;">
				      <label class="layui-form-label" style="width: 120px;">所属系统</label>
				      <div class="layui-input-inline">
				        <input type="text" name="xqd_mc" lay-verify="xqd_mc" autocomplete="off" class="layui-input bj" id="xqd_mc" value="${xqd.ssxtmc}" disabled="">
				      </div>
			    </div>
			    
			     <div class="layui-inline" style="left:30px;">
				      <label class="layui-form-label" style="width: 120px;">需求类型</label>
				      <div class="layui-input-inline">
				        <input type="text" name="xqd_mc" lay-verify="xqd_mc" autocomplete="off" class="layui-input bj" id="xqd_mc" value="${xqd.xqlxmc}" disabled="">
				      </div>
			    </div>
		 	
				<div class="layui-inline" style="left:30px;">
				      <label class="layui-form-label" style="width: 120px;">负责人</label>
				      <div class="layui-input-inline">
				        <input type="text" name="xqd_mc" lay-verify="xqd_mc" autocomplete="off" class="layui-input bj" id="xqd_mc" value="${xqd.fzrmc}" disabled="">
				      </div>
			    </div>
			    
			 </div>
			 
			 <div class="layui-form-item">
			 
			    <div class="layui-inline" style="left:10px;">
				      <label class="layui-form-label" style="width: 120px;">客户</label>
				      <div class="layui-input-inline">
				        <input type="text" name="xqd_mc" lay-verify="xqd_mc" autocomplete="off" class="layui-input bj" id="xqd_mc" value="${xqd.khmc}" disabled="">
				      </div>
			    </div>
			 
				 
				<div class="layui-inline" style="left:30px;">
				      <label class="layui-form-label" style="width: 120px;">客户系统</label>
				      <div class="layui-input-inline">
				        <input type="text" name="xqd_khxt" lay-verify="xqd_khxt" autocomplete="off" class="layui-input bj" id="xqd_khxt" value="${xqd.xqd_khxt}" disabled="">
				      </div>
			    </div>
				 
				 <div class="layui-inline" style="left:30px;">
				      <label class="layui-form-label" style="width: 120px;">客户负责人</label>
				      <div class="layui-input-inline">
				        <input type="text" name="xqd_khfzr" lay-verify="xqd_khfzr" autocomplete="off" class="layui-input bj" id="xqd_khfzr" value="${xqd.xqd_khfzr}" disabled="">
				      </div>
			    </div>
		 	</div>
		 	
		 	 <div class="layui-form-item">
		 		<div class="layui-inline" style="left:10px;">
				      <label class="layui-form-label" style="width:120px;">提出日期</label>
				      <div class="layui-input-inline">
				        <input type="text" name="xqd_tcrq" id="xqd_tcrq" lay-verify=""xqd_tcrq"" placeholder="yyyy-mm-dd" autocomplete="off" class="layui-input bj" value="${xqd.tcrq}" disabled="">
				      </div>
			    </div>
			    
			    <div class="layui-inline" style="left:30px;">
				      <label class="layui-form-label" style="width:120px;">计划开始日期</label>
				      <div class="layui-input-inline">
				        <input type="text" name="xqd_jhksrq" id="xqd_jhksrq" lay-verify=""xqd_jhksrq"" placeholder="yyyy-mm-dd" autocomplete="off" class="layui-input bj" value="${xqd.jhksrq}" disabled="">
				      </div>
			    </div>
			    
			     <div class="layui-inline" style="left:30px;">
				      <label class="layui-form-label" style="width:120px;">计划结束日期</label>
				      <div class="layui-input-inline">
				        <input type="text" name="xqd_jhjsrq" id="xqd_jhjsrq" lay-verify=""xqd_jhjsrq"" placeholder="yyyy-mm-dd" autocomplete="off" class="layui-input bj" value="${xqd.jhjsrq}" disabled="">
				      </div>
			    </div>
			</div>
			
			
			<div class="layui-form-item">
			
			  <div class="layui-inline" style="left:10px;">
			      <label class="layui-form-label" style="width: 120px;">工作量</label>
			      <div class="layui-input-inline">
			        <input type="text" name="xqd_gzl" lay-verify="xqd_gzl" autocomplete="off" class="layui-input bj" id="xqd_gzl" value="${xqd.xqd_gzl}" disabled="">
			      </div>
			  </div>
			  
			  <div class="layui-inline" style="left:30px;">
			      <label class="layui-form-label" style="width: 120px;">是否需求签订</label>
			      <div class="layui-input-inline">
			       <c:if test="${xqd.xqd_xqqd eq true}">
			         <input type="text" name="xqd_gzl" lay-verify="xqd_gzl" autocomplete="off" class="layui-input bj" id="xqd_gzl" value="是" disabled="">
			      </c:if>
			      <c:if test="${xqd.xqd_xqqd eq false}">
			         <input type="text" name="xqd_gzl" lay-verify="xqd_gzl" autocomplete="off" class="layui-input bj" id="xqd_gzl" value="否" disabled="">
			      </c:if>
			      </div>
			  </div>
			  
			  <div class="layui-inline" style="left:10px;">
			      <label class="layui-form-label" style="width: 140px;">是否工作量签订</label>
			      <div class="layui-input-inline">
			       <c:if test="${xqd.xqd_gzlqd eq true}">
			         <input type="text" name="xqd_gzl" lay-verify="xqd_gzl" autocomplete="off" class="layui-input bj" id="xqd_gzl" value="是" disabled="">
			      </c:if>
			      <c:if test="${xqd.xqd_gzlqd eq false}">
			         <input type="text" name="xqd_gzl" lay-verify="xqd_gzl" autocomplete="off" class="layui-input bj" id="xqd_gzl" value="否" disabled="">
			      </c:if>
			      </div>
			  </div>
			   
			</div>
			
			<div class="layui-form-item">
			   
				  <div class="layui-inline" style="left:10px;">
				      <label class="layui-form-label" style="width: 120px;">是否开始开发</label>
				      <div class="layui-input-inline">
				       <c:if test="${xqd.xqd_kfks eq true}">
				         <input type="text" name="xqd_gzl" lay-verify="xqd_gzl" autocomplete="off" class="layui-input bj" id="xqd_gzl" value="是" disabled="">
				      </c:if>
				      <c:if test="${xqd.xqd_kfks eq false}">
				         <input type="text" name="xqd_gzl" lay-verify="xqd_gzl" autocomplete="off" class="layui-input bj" id="xqd_gzl" value="否" disabled="">
				      </c:if>
				      </div>
				  </div>
				  
				  <div class="layui-inline" style="left:30px;">
				      <label class="layui-form-label" style="width: 120px;">是否开发结束</label>
				      <div class="layui-input-inline">
				       <c:if test="${xqd.xqd_kfjs eq true}">
				         <input type="text" name="xqd_gzl" lay-verify="xqd_gzl" autocomplete="off" class="layui-input bj" id="xqd_gzl" value="是" disabled="">
				      </c:if>
				      <c:if test="${xqd.xqd_kfjs eq false}">
				         <input type="text" name="xqd_gzl" lay-verify="xqd_gzl" autocomplete="off" class="layui-input bj" id="xqd_gzl" value="否" disabled="">
				      </c:if>
				      </div>
				  </div>
				   
				  <div class="layui-inline" style="left:30px;">
				      <label class="layui-form-label" style="width: 120px;">是否测试开始</label>
				      <div class="layui-input-inline">
				       <c:if test="${xqd.xqd_csks eq true}">
				         <input type="text" name="xqd_gzl" lay-verify="xqd_gzl" autocomplete="off" class="layui-input bj" id="xqd_gzl" value="是" disabled="">
				      </c:if>
				      <c:if test="${xqd.xqd_csks eq false}">
				         <input type="text" name="xqd_gzl" lay-verify="xqd_gzl" autocomplete="off" class="layui-input bj" id="xqd_gzl" value="否" disabled="">
				      </c:if>
				      </div>
				  </div>
				  
				  
			   
			</div>
			
			<div class="layui-form-item">
			
			     <div class="layui-inline" style="left:10px;">
				      <label class="layui-form-label" style="width: 120px;">是否测试结束</label>
				      <div class="layui-input-inline">
				       <c:if test="${xqd.xqd_csjs eq true}">
				         <input type="text" name="xqd_gzl" lay-verify="xqd_gzl" autocomplete="off" class="layui-input bj" id="xqd_gzl" value="是" disabled="">
				      </c:if>
				      <c:if test="${xqd.xqd_csjs eq false}">
				         <input type="text" name="xqd_gzl" lay-verify="xqd_gzl" autocomplete="off" class="layui-input bj" id="xqd_gzl" value="否" disabled="">
				      </c:if>
				      </div>
				  </div>
				  
			    <div class="layui-inline" style="left:30px;">
				      <label class="layui-form-label" style="width:120px;">实施日期</label>
				      <div class="layui-input-inline">
				        <input type="text" name="xqd_ssrq" id="xqd_ssrq" lay-verify=""xqd_ssrq"" placeholder="yyyy-mm-dd" autocomplete="off" class="layui-input bj" value="${xqd.ssrq}" disabled="">
				      </div>
			    </div>
			    
			    <div class="layui-inline" style="left:30px;">
				      <label class="layui-form-label" style="width:120px;">验收日期</label>
				      <div class="layui-input-inline">
				        <input type="text" name="xqd_ysrq" id="xqd_ysrq" lay-verify=""xqd_ysrq"" placeholder="yyyy-mm-dd" autocomplete="off" class="layui-input bj" value="${xqd.ysrq}" disabled="">
				      </div>
			    </div>
			    
			 </div>
			 
			 <div class="layui-form-item">
			    
			     <div class="layui-inline" style="left:10px;">
			      <label class="layui-form-label" style="width: 120px;">项目阶段</label>
			      <div class="layui-input-inline">
			        <input type="text" name="xqd_gzl" lay-verify="xqd_gzl" autocomplete="off" class="layui-input bj" id="xqd_gzl" value="${xqd.xqjdmc}" disabled="">
			      </div>
			  </div>
				
			   <div class="layui-inline" style="left:30px;">
			      <label class="layui-form-label" style="width: 120px;">项目状态</label>
			      <div class="layui-input-inline">
			        <input type="text" name="xqd_gzl" lay-verify="xqd_gzl" autocomplete="off" class="layui-input bj" id="xqd_gzl" value="${xqd.xqztmc}" disabled="">
			      </div>
			  </div>
			 </div>
			
			 <div class="layui-form-item layui-form-text">
			    <label class="layui-form-label" style="width: 128px;">备注</label>
			    <div class="layui-input-block">
			      <textarea placeholder="请输入内容" name="xqd_bz"  lay-verify="xqd_bz" id="xqd_bz" class="layui-textarea bj" style="width:878px;" disabled="">${xqd.xqd_bz}</textarea>
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
  
});
  
</script>
</body>
</html>