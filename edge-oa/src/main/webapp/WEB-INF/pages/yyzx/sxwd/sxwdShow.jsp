<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>新增上线文档</title>
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
			<input type="hidden" id="flag" value="${flag}"> 
			
			 
			<div class="layui-form-item">
			 	<div class="layui-inline" style="left:10px;">
				      <label class="layui-form-label" style="width: 120px;">上线文档名称</label>
				      <div class="layui-input-inline">
				        <input type="text" name="sxwd_mc" lay-verify="sxwd_mc" autocomplete="off" class="layui-input bj" id="sxwd_mc" value="${sxwd.sxwd_mc}" disabled="">
				      </div>
			    </div>
			    
				<div class="layui-inline" style="left:30px;">
				      <label class="layui-form-label" style="width: 120px;">编号</label>
				      <div class="layui-input-inline">
				        <input type="text" name="sxwd_bh" lay-verify="sxwd_bh" autocomplete="off" class="layui-input bj" id="sxwd_bh" value="${sxwd.sxwd_bh}" disabled="">
				      </div>
			    </div>
			    
			    <div class="layui-inline" style="left:30px;">
				      <label class="layui-form-label" style="width: 120px;">系统</label>
				      <div class="layui-input-inline">
				        <input type="text" name="sxwd_xt" lay-verify="sxwd_xt" autocomplete="off" class="layui-input bj" id="sxwd_xt" value="${sxwd.sxwd_xt}" disabled="">
				      </div>
			    </div>
				 
			 </div>
		 
		 	<div class="layui-form-item">
		 	
				  <div class="layui-inline" style="left:10px;">
				      <label class="layui-form-label" style="width: 120px;">客户单位</label>
				      <div class="layui-input-inline">
				        <input type="text" name="khdwmc" lay-verify="khdwmc" autocomplete="off" class="layui-input bj" id="khdwmc" value="${sxwd.khdwmc}"disabled="">
				      </div>
			    </div>
				 
				<div class="layui-inline" style="left:30px;">
				      <label class="layui-form-label" style="width: 120px;">分支</label>
				      <div class="layui-input-inline">
				        <input type="text" name="sxwd_fz" lay-verify="sxwd_fz" autocomplete="off" class="layui-input bj" id="sxwd_fz" value="${sxwd.sxwd_fz}" disabled="">
				      </div>
			    </div>
			    
			    <div class="layui-inline" style="left:30px;">
				      <label class="layui-form-label" style="width: 120px;">GIT版本标签</label>
				      <div class="layui-input-inline">
				        <input type="text" name="sxwd_git" lay-verify="sxwd_git" autocomplete="off" class="layui-input bj" id="sxwd_git" value="${sxwd.sxwd_git}" disabled="">
				      </div>
			    </div>
			    
			 </div>
			 
			 <div class="layui-form-item">
				 
				 <div class="layui-inline" style="left:10px;">
				      <label class="layui-form-label" style="width: 120px;">问题类型</label>
				      <div class="layui-input-inline">
				        <input type="text" name="wtlxmc" lay-verify="wtlxmc" autocomplete="off" class="layui-input bj" id="wtlxmc" value="${sxwd.wtlxmc}" disabled="">
				      </div>
			    </div>
				 
				 <div class="layui-inline" style="left:30px;">
				      <label class="layui-form-label" style="width: 120px;">开发验收人员</label>
				      <div class="layui-input-inline">
				        <input type="text" name="kfysrymc" lay-verify="kfysrymc" autocomplete="off" class="layui-input bj" id="kfysrymc" value="${sxwd.kfysrymc}" disabled="">
				      </div>
			    </div>
				 
				  <div class="layui-inline" style="left:30px;">
				      <label class="layui-form-label" style="width: 120px;">开发人员</label>
				      <div class="layui-input-inline">
				        <input type="text" name="kfrymc" lay-verify="kfrymc" autocomplete="off" class="layui-input bj" id="kfrymc" value="${sxwd.kfrymc}" disabled="">
				      </div>
			    </div>
		 	</div>
		 	
		 	 <div class="layui-form-item">
		 		<div class="layui-inline" style="left:10px;">
				      <label class="layui-form-label" style="width:120px;">计划上线时间</label>
				      <div class="layui-input-inline">
				        <input type="text" name="sxwd_jhsxsj" id="sxwd_jhsxsj" lay-verify="sxwd_jhsxsj" placeholder="yyyy-mm-dd" autocomplete="off" class="layui-input bj" value="${sxwd.jhsxsj}" disabled="">
				      </div>
			    </div>
			    
			    <div class="layui-inline" style="left:-2px;">
				      <label class="layui-form-label" style="width: 152px;">是否需要执行程序</label>
				      <div class="layui-input-inline">
				      	<c:if test="${sxwd.sxwd_sfxyzxcx eq true}">
				        	<input type="text" name="sxwd_sfxyzxcx" lay-verify="sxwd_sfxyzxcx" autocomplete="off" class="layui-input bj" id="sxwd_sfxyzxcx" value="是" disabled="">
				        </c:if>
				        <c:if test="${sxwd.sxwd_sfxyzxcx eq false}">
				        	<input type="text" name="sxwd_sfxyzxcx" lay-verify="sxwd_sfxyzxcx" autocomplete="off" class="layui-input bj" id="sxwd_sfxyzxcx" value="否" disabled="">
				        </c:if>
				      </div>
			    </div>
			   
			   <div class="layui-inline" style="left:-2px;" id="zxcxm">
				      <label class="layui-form-label" style="width: 120px;">执行程序名</label>
				      <div class="layui-input-inline">
				        <input type="text" name="sxwd_zxcxm" lay-verify="sxwd_zxcxm" autocomplete="off" class="layui-input bj" id="sxwd_zxcxm" value="${sxwd.sxwd_zxcxm}" disabled="">
				      </div>
			    </div>
			</div>
			
			
			<div class="layui-form-item">
			   
			     <div class="layui-inline" style="left:-52px;">
				      <label class="layui-form-label" style="width: 182px;">是否通过<br/>研发中心验收</label>
				      <div class="layui-input-inline">
				      <c:if test="${sxwd.sxwd_sftgyfzxys eq true}">
				       		 <input type="text" name="sxwd_sftgyfzxys" lay-verify="sxwd_sftgyfzxys" autocomplete="off" class="layui-input bj" id="sxwd_sftgyfzxys" value="是" disabled="">
				      </c:if>
				      <c:if test="${sxwd.sxwd_sftgyfzxys eq false}">
				       		 <input type="text" name="sxwd_sftgyfzxys" lay-verify="sxwd_sftgyfzxys" autocomplete="off" class="layui-input bj" id="sxwd_sftgyfzxys" value="否" disabled="">
				      </c:if>
				      </div>
			    </div>
			    
			    <div class="layui-inline" style="left:-62px;top: -11px;">
				      <label class="layui-form-label" style="width: 150px;">是否通过需求验收</label>
				      <div class="layui-input-inline">
				        <c:if test="${sxwd.sxwd_sftgxqys eq true}">
				        	<input type="text" name="sxwd_sftgxqys" lay-verify="sxwd_sftgxqys" autocomplete="off" class="layui-input bj" id="sxwd_sftgxqys" value="是" disabled="">
				      	</c:if>
				      	 <c:if test="${sxwd.sxwd_sftgxqys eq false}">
				        	<input type="text" name="sxwd_sftgxqys" lay-verify="sxwd_sftgxqys" autocomplete="off" class="layui-input bj" id="sxwd_sftgxqys" value="否" disabled="">
				      	</c:if>
				      </div>
			    </div>
			   
			    <div class="layui-inline" style="left:-62px;top: -10px;">
				      <label class="layui-form-label" style="width: 120px;">是否有报表</label>
				      <div class="layui-input-inline">
				      	<c:if test="${sxwd.sxwd_sfybb eq true }">
			        	 	<input type="text" name="sxwd_sfybb" lay-verify="sxwd_sfybb" autocomplete="off" class="layui-input bj" id="sxwd_sfybb" value="是" disabled="">
				      	</c:if>
				      	<c:if test="${sxwd.sxwd_sfybb eq false }">
			        	 	<input type="text" name="sxwd_sfybb" lay-verify="sxwd_sfybb" autocomplete="off" class="layui-input bj" id="sxwd_sfybb" value="否" disabled="">
				      	</c:if>
				      </div>
			    </div>
			   
			   <div class="layui-inline" style="left:-2px;">
				      <label class="layui-form-label" style="width: 130px;">是否需要授权</label>
				      <div class="layui-input-inline">
				      	<c:if test="${sxwd.sxwd_sfxysq eq true }">
				        	<input type="text" name="sxwd_sfxysq" lay-verify="sxwd_sfxysq" autocomplete="off" class="layui-input bj" id="sxwd_sfxysq" value="是" disabled="">
				      	</c:if>
				      	<c:if test="${sxwd.sxwd_sfxysq eq false }">
				        	<input type="text" name="sxwd_sfxysq" lay-verify="sxwd_sfxysq" autocomplete="off" class="layui-input bj" id="sxwd_sfxysq" value="否" disabled="">
				      	</c:if>
				      </div>
			    </div>
			</div>
			
			 <div class="layui-form-item layui-form-text">
			    <label class="layui-form-label" style="width: 128px;">本次更新内容</label>
			    <div class="layui-input-block">
			      <textarea placeholder="请输入内容" name="sxwd_bcgxnr"  lay-verify="sxwd_bcgxnr" id="sxwd_bcgxnr" class="layui-textarea bj" style="width:878px;" disabled="">${sxwd.sxwd_bcgxnr}</textarea>
			    </div>
			</div>
			
			<div class="layui-form-item layui-form-text" style="margin-left: -14px;" id="baoBiaoWJFZWZ">
			    <label class="layui-form-label" style="width: 142px;">报表文件放置位置</label>
			    <div class="layui-input-block">
			      <textarea placeholder="请输入内容" name="sxwd_bbwjfzwz"  lay-verify="sxwd_bbwjfzwz" id="sxwd_bbwjfzwz" class="layui-textarea bj" style="width:878px;" disabled="">${sxwd.sxwd_bbwjfzwz}</textarea>
			    </div>
			</div>
			
			<div class="layui-form-item layui-form-text" id="shouQuanSM">
			    <label class="layui-form-label" style="width: 128px;">授权说明</label>
			    <div class="layui-input-block">
			      <textarea placeholder="请输入内容" name="sxwd_sqsm"  lay-verify="sxwd_sqsm" id="sxwd_sqsm" class="layui-textarea bj" style="width:878px;" disabled="">${sxwd.sxwd_sqsm}</textarea>
			    </div>
			</div>
			
			<div class="layui-form-item layui-form-text">
			    <label class="layui-form-label" style="width: 128px;">其它情况</label>
			    <div class="layui-input-block">
			      <textarea placeholder="请输入内容" name="sxwd_qtqk"  lay-verify="sxwd_qtqk" id="sxwd_qtqk" class="layui-textarea bj" style="width:878px;" disabled="">${sxwd.sxwd_qtqk}</textarea>
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
  
  pageReady();

});
 
  

  
  //页面加载事件 
  function pageReady(){
	  //是否需要执行程序
	  var sfxyzxcx=$('#sxwd_sfxyzxcx').val();
	  //是否有报表
	  var sfybb=$('#sxwd_sfybb').val();
	  //是否需要授权
	  var sfxysq=$('#sxwd_sfxysq').val();
	  if(sfxyzxcx=='是'){
		  $('#zxcxm').show();
	  }else{
		  $('#zxcxm').hide();
	  }
	  if(sfybb=='是'){
		  $('#baoBiaoWJFZWZ').show();
	  }else{
		  $('#baoBiaoWJFZWZ').hide();
	  }
	  if(sfxysq=='是'){
		  $('#shouQuanSM').show();
	  }else{
		  $('#shouQuanSM').hide();
	  }
  }
  

</script>
</body>
</html>