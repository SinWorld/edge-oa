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
</head>
<body onload="refreshAndClose()" style="width:100%;padding:0px; margin:0px;">
	<div style="width:1280px;height:auto;padding:0px; margin:0 auto;" id="main">
		<form class="layui-form" action='<c:url value="/sxwd/saveSXWD.do"/>' method="post" id="myForm" style="margin-top:30px;">
			<input type="hidden" id="url" value='<c:url value="/"/>'>
			<input type="hidden" id="flag" value="${flag}"> 
			<input type="hidden" name="sxwd_sfxyzxcx" value="false" id="sxwd_sfxyzxcx">
			<input type="hidden" name="sxwd_sftgyfzxys" value="false" id="sxwd_sftgyfzxys">
			<input type="hidden" name="sxwd_sftgxqys" value="flase" id="sxwd_sftgxqys">
			<input type="hidden" name="sxwd_sfybb" value="false" id="sxwd_sfybb">
			<input type="hidden" name="sxwd_sfxysq" value="false" id="sxwd_sfxysq">
			 
			<div class="layui-form-item">
			 	<div class="layui-inline" style="left:10px;">
				      <label class="layui-form-label" style="width: 120px;">上线文档名称</label>
				      <div class="layui-input-inline">
				        <input type="text" name="sxwd_mc" lay-verify="sxwd_mc" autocomplete="off" class="layui-input" id="sxwd_mc">
				      </div>
			    </div>
			    
				<div class="layui-inline" style="left:30px;">
				      <label class="layui-form-label" style="width: 120px;">编号</label>
				      <div class="layui-input-inline">
				        <input type="text" name="sxwd_bh" lay-verify="sxwd_bh" autocomplete="off" class="layui-input" id="sxwd_bh">
				      </div>
			    </div>
			    
			    <div class="layui-inline" style="left:30px;">
				      <label class="layui-form-label" style="width: 120px;">系统</label>
				      <div class="layui-input-inline">
				        <input type="text" name="sxwd_xt" lay-verify="sxwd_xt" autocomplete="off" class="layui-input" id="sxwd_xt">
				      </div>
			    </div>
				 
			 </div>
		 
		 	<div class="layui-form-item">
		 	
			 	<div class="layui-inline" style="left:35px;">
				  	<label class="layui-form-label" style="width: 95px;">客户单位</label>
					<div class="layui-input-inline" style="text-align: left;">
						<select name="sxwd_kh" id="sxwd_kh" lay-filter="sxwd_kh" lay-verify="sxwd_kh">
							<option value="" selected="selected">请选择客户单位</option>
						</select>
					</div>
				 </div>
				 
				<div class="layui-inline" style="left:55px;">
				      <label class="layui-form-label" style="width: 120px;">分支</label>
				      <div class="layui-input-inline">
				        <input type="text" name="sxwd_fz" lay-verify="sxwd_fz" autocomplete="off" class="layui-input" id="sxwd_fz">
				      </div>
			    </div>
			    
			    <div class="layui-inline" style="left:55px;">
				      <label class="layui-form-label" style="width: 120px;">GIT版本标签</label>
				      <div class="layui-input-inline">
				        <input type="text" name="sxwd_git" lay-verify="sxwd_git" autocomplete="off" class="layui-input" id="sxwd_git">
				      </div>
			    </div>
			    
			 </div>
			 
			 <div class="layui-form-item">
				 <div class="layui-inline" style="left:35px;">
					  	<label class="layui-form-label" style="width: 95px;">问题类型</label>
						<div class="layui-input-inline" style="text-align: left;">
							<select name="sxwd_wtlx" id="sxwd_wtlx" lay-filter="sxwd_wtlx" lay-verify="sxwd_wtlx">
								<option value="" selected="selected">请选择问题类型</option>
							</select>
						</div>
				 </div>
				 
				 <div class="layui-inline" style="left:55px;">
					  	<label class="layui-form-label" style="width:120px;">开发验收人员</label>
						<div class="layui-input-inline" style="text-align: left;">
							<select name="sxwd_kfysry" id="sxwd_kfysry" lay-filter="sxwd_kfysry" lay-verify="sxwd_kfysry">
								<option value="" selected="selected">请选择开发验收人员</option>
							</select>
						</div>
				 </div>
				 
				  <div class="layui-inline" style="left:80px;">
					  	<label class="layui-form-label" style="width: 95px;">开发人员</label>
						<div class="layui-input-inline" style="text-align: left;">
							<select name="sxwd_kfry" id="sxwd_kfry" lay-filter="sxwd_kfry" lay-verify="sxwd_kfry">
								<option value="" selected="selected">请选择开发人员</option>
							</select>
						</div>
				 </div>
		 	</div>
		 	
		 	 <div class="layui-form-item">
		 		<div class="layui-inline" style="left:10px;">
				      <label class="layui-form-label" style="width:120px;">计划上线时间</label>
				      <div class="layui-input-inline">
				        <input type="text" name="sxwd_jhsxsj" id="sxwd_jhsxsj" lay-verify="sxwd_jhsxsj" placeholder="yyyy-mm-dd" autocomplete="off" class="layui-input">
				      </div>
			    </div>
			    
			    <div class="layui-inline" style="left:23px;">
			    	<label class="layui-form-label" style="width:152px;">是否需要执行程序</label>
				    <div class="layui-input-block" style="width: 200px;">
				      <input type="checkbox"  lay-skin="primary" lay-filter="sxwd_sfxyzxcx">
				    </div>
			   </div>
			   
			   <div class="layui-inline" style="left:150px;" id="zhiXingCXM">
				      <label class="layui-form-label" style="width: 120px;">执行程序名</label>
				      <div class="layui-input-inline">
				        <input type="text" name="sxwd_zxcxm" lay-verify="sxwd_zxcxm" autocomplete="off" class="layui-input" id="sxwd_zxcxm">
				      </div>
			    </div>
			</div>
			
			
			<div class="layui-form-item">
		 	   <div class="layui-inline" style="left:5px;">
		 	    <label class="layui-form-label" style="width:182px;">是否通过研发中心验收</label>
				    <div class="layui-input-block" style="width: 220px;">
				      <input type="checkbox"  lay-skin="primary" lay-filter="sxwd_sftgyfzxys">
				    </div>
			   </div>
			    
			    <div class="layui-inline" style="left:125px;">
			      <label class="layui-form-label" style="width:150px;">是否通过需求验收</label>
				    <div class="layui-input-block" style="width: 200px;">
				      <input type="checkbox"  lay-skin="primary" lay-filter="sxwd_sftgxqys">
				    </div>
			   </div>
			   
			    <div class="layui-inline" style="left:165px;">
			      <label class="layui-form-label" style="width: 120px;">是否有报表</label>
				    <div class="layui-input-block" style="width: 200px;">
				      <input type="checkbox"  lay-skin="primary" lay-filter="sxwd_sfybb">
				    </div>
			   </div>
			   
			   <div class="layui-inline" style="left:195px;">
			      <label class="layui-form-label" style="width:130px;">是否需要授权</label>
				    <div class="layui-input-block" style="width: 170px;">
				      <input type="checkbox"  lay-skin="primary" lay-filter="sxwd_sfxysq">
				    </div>
			   </div>
			</div>
			
			 <div class="layui-form-item layui-form-text">
			    <label class="layui-form-label" style="width: 128px;">本次更新内容</label>
			    <div class="layui-input-block">
			      <textarea placeholder="请输入内容" name="sxwd_bcgxnr"  lay-verify="sxwd_bcgxnr" id="sxwd_bcgxnr" class="layui-textarea" style="width:878px;"></textarea>
			    </div>
			</div>
			
			<div class="layui-form-item layui-form-text" style="margin-left: -14px;" id="baoBiaoWJFZWZ">
			    <label class="layui-form-label" style="width: 142px;">报表文件放置位置</label>
			    <div class="layui-input-block">
			      <textarea placeholder="请输入内容" name="sxwd_bbwjfzwz"  lay-verify="sxwd_bbwjfzwz" id="sxwd_bbwjfzwz" class="layui-textarea" style="width:878px;"></textarea>
			    </div>
			</div>
			
			<div class="layui-form-item layui-form-text" id="shouQuanSM">
			    <label class="layui-form-label" style="width: 128px;">授权说明</label>
			    <div class="layui-input-block">
			      <textarea placeholder="请输入内容" name="sxwd_sqsm"  lay-verify="sxwd_sqsm" id="sxwd_sqsm" class="layui-textarea" style="width:878px;"></textarea>
			    </div>
			</div>
			
			<div class="layui-form-item layui-form-text">
			    <label class="layui-form-label" style="width: 128px;">其它情况</label>
			    <div class="layui-input-block">
			      <textarea placeholder="请输入内容" name="sxwd_qtqk"  lay-verify="sxwd_qtqk" id="sxwd_qtqk" class="layui-textarea" style="width:878px;"></textarea>
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
    elem: '#sxwd_jhsxsj'
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
  
  //是否需要执行程序
  form.on('checkbox(sxwd_sfxyzxcx)', function(data){
	  var flag=data.elem.checked;
	  var zxcxm=$('#zhiXingCXM');
	  if(flag){
		  zxcxm.show();
		  $('#sxwd_sfxyzxcx').val(true);
	  }else{
		  $('#sxwd_zxcxm').val('');
		  $('#sxwd_sfxyzxcx').val(false);
		  zxcxm.hide();
	  }
   });
  
  //是否有报表
  form.on('checkbox(sxwd_sfybb)', function(data){
	  var flag=data.elem.checked;
	  //报表文件放置位置
	  var bbwjfzwz=$('#baoBiaoWJFZWZ');
	  if(flag){
		  bbwjfzwz.show();
		  $('#sxwd_sfybb').val(true);
	  }else{
		  $('#sxwd_bbwjfzwz').val('');
		  $('#sxwd_sfybb').val(false);
		  bbwjfzwz.hide();
	  }
   });
  
  //是否需要授权
  form.on('checkbox(sxwd_sfxysq)', function(data){
	  var flag=data.elem.checked;
	  //授权说明
	  var sqsm=$('#shouQuanSM');
	  if(flag){
		  sqsm.show();
		  $('#sxwd_sfxysq').val(true);
	  }else{
		  $('#sxwd_sqsm').val('');
		  $('#sxwd_sfxysq').val(false);
		  sqsm.hide();
	  }
   });
  
  //是否通过研发中心验收
  form.on('checkbox(sxwd_sftgyfzxys)', function(data){
	  var flag=data.elem.checked;
	  if(flag){
		  $('#sxwd_sftgyfzxys').val(true);
	  }else{
		  $('#sxwd_sftgyfzxys').val(false);
	  }
   });
  
  //是否通过需求验收
  form.on('checkbox(sxwd_sftgxqys)', function(data){
	  var flag=data.elem.checked;
	  if(flag){
		  $('#sxwd_sftgxqys').val(true);
	  }else{
		  $('#sxwd_sftgxqys').val(false);
	  }
   });
  
  
  reloadKh(form);
  pageReady();
  allKFYSRY(form);
  allKFRY(form);
  allWTLX(form);
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
					$("#sxwd_kh").append(
							"<option value='"+msg[i].khdm+"'>"+ msg[i].khmc +"</option>");
				}
				form.render('select');
			}
		});
  }
  
  //页面加载事件 
  function pageReady(){
	  //执行程序名
	  var zxcxm=$('#zhiXingCXM');
	  //报表文件放置位置
	  var bbwjfzwz=$('#baoBiaoWJFZWZ');
	  //授权说明
	  var sqsm=$('#shouQuanSM');
	  zxcxm.hide();
	  bbwjfzwz.hide();
	  sqsm.hide();
  }
  
//ajax实现查询所有的开发验收人员
  function  allKFYSRY(form){
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
  				$("#sxwd_kfysry").append(
  						"<option value='"+msg[i].user_id+"'>"+ msg[i].user_name +"</option>");
  			}
  			form.render('select');
  		}
  	});
  }
  
//ajax实现查询所有的开发人员
  function  allKFRY(form){
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
  				$("#sxwd_kfry").append(
  						"<option value='"+msg[i].user_id+"'>"+ msg[i].user_name +"</option>");
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
</script>
</body>
</html>