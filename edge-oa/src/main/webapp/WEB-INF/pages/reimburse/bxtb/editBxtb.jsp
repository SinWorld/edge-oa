<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>编辑报销填报</title>
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
		<form class="layui-form" action='<c:url value="/bxtb/editBxtb.do"/>' method="post" style="margin-top: 30px;">
			<input type="hidden" id="flag" value="${flag}"> 
			<input type="hidden" id="xmxxdm" value="${xmxx.proj_Id}">
			<input type="hidden" id="fylxdm" value="${fylx.fylx_dm}">
			<input type="hidden" id="fyssdm" value="${user.user_id}">
			<input type="hidden" name="reimbursement_dm" value="${reimbursement.reimbursement_dm}">
			<input type="hidden" name="taskId" value="${taskId }">
			
			<div class="layui-form-item" style="margin-top: 20px;">
				<label class="layui-form-label" style="width: 120px;">项目名称</label>
				<div class="layui-input-inline" style="width: 1070px;text-align: left;">
					<select name="proj_dm" id="proj_dm" lay-filter="proj_dm" lay-verify="proj_dm" lay-search="">
						<option value="" selected="selected">请选择所属项目</option>
					</select>
				</div>
			</div>
			
			<div class="layui-form-item">
			 	<div class="layui-inline" style="left:30px;">
				      <label class="layui-form-label" style="width: 90px;">审批编号</label>
				      <div class="layui-input-inline">
				        <input type="text" name="reimbursement_code" lay-verify="reimbursement_code" autocomplete="off" class="layui-input bj" id="reimbursement_code" disabled="" value="${reimbursement.reimbursement_code}">
				      </div>
			    </div>
				<div class="layui-inline" style="left:12px;">
				  	<label class="layui-form-label" style="width: 95px;">费用类型</label>
					<div class="layui-input-inline" style="text-align: left;">
						<select name="reimbursement_dm_fylx" id="reimbursement_dm_fylx" lay-filter="reimbursement_dm_fylx" lay-verify="reimbursement_dm_fylx">
							<option value="" selected="selected">请选择费用类型</option>
						</select>
					</div>
				 </div>
				 
			    <div class="layui-inline" style="left:30px;">
				      <label class="layui-form-label" style="width: 90px;">发生日期</label>
				      <div class="layui-input-inline">
				        <input type="text" name="reimbursement_begintime" id="reimbursement_begintime" lay-filter="reimbursement_begintime" lay-verify="reimbursement_begintime" placeholder="yyyy-mm-dd" autocomplete="off" class="layui-input" value="${reimbursement.fsrq}">
				      </div>
			    </div>
			     <div class="layui-inline" style="left: 35px;top: 7px;">
				      <label class="layui-form-label" style="width: 90px;">报销金额</label>
				      <div class="layui-input-inline" style="width: 130px;">
				        <input type="text" name="reimbursement_bxje" id="reimbursement_bxje" lay-verify="reimbursement_bxje" autocomplete="off" class="layui-input" onchange="bxjeChange()" value="${reimbursement.reimbursement_bxje}">
				        <span style="position: relative;top: -25px;right: -133px;">元</span>
				      </div>
			    </div>
			 </div>
		 
			<div class="layui-form-item">
				<div class="layui-inline" style="left:25px;">
				  	<label class="layui-form-label" style="width: 95px;">费用所属</label>
					<div class="layui-input-inline" style="text-align: left;">
						<select name="reimbursement_user_dm" id="reimbursement_user_dm" lay-filter="reimbursement_user_dm" disabled="" lay-verify="reimbursement_user_dm">
							<option value="" selected="selected">请选择所属费用</option>
						</select>
					</div>
				 </div>
				 
			    <div class="layui-inline" style="left:27px;">
				      <label class="layui-form-label" style="width: 76px;">报销人</label>
				      <div class="layui-input-inline"> 
				        <input type="text" name="reimbursement_bxr" id="reimbursement_bxr" lay-verify="reimbursement_bxr" autocomplete="off" class="layui-input bj" disabled="" value="${reimbursement.reimbursement_bxr}">
				      </div>
			    </div>
			     <div class="layui-inline" style="left: 44px;top: 7px;">
				      <label class="layui-form-label" style="width: 90px;">审核金额</label>
				      <div class="layui-input-inline" style="width: 130px;">
				        <input type="text"  id="reimbursement_shje" lay-verify="reimbursement_shje" autocomplete="off" class="layui-input bj" disabled="" name="reimbursement_shje" value="${reimbursement.reimbursement_shje}">
				        <span style="position: relative;top: -25px;right: -140px;">元</span>
				      </div>
			    </div>
			     <div class="layui-inline" style="left: 110px;top: 7px;">
				      <label class="layui-form-label" style="width: 90px;">发票金额</label>
				      <div class="layui-input-inline" style="width: 130px;">
				        <input type="text" id="reimbursement_fpje" lay-verify="reimbursement_fpje" autocomplete="off" class="layui-input" name="reimbursement_fpje" value="${reimbursement.reimbursement_fpje}">
				        <span style="position: relative;top: -25px;right: -132px;">元</span>
				      </div>
			    </div>
			 </div>
		 
			 <div class="layui-form-item layui-form-text">
			    <label class="layui-form-label" style="width: 120px;">费用明细</label>
			    <div class="layui-input-block">
			      <textarea placeholder="请输入内容" name="reimbursement_details"  lay-verify="reimbursement_details" id="reimbursement_details" class="layui-textarea" style="width:1070px;">${reimbursement.reimbursement_details}</textarea>
			    </div>
			</div>
		 

			<div class="layui-form-item">
			    <div class="layui-input-block" style="text-align: center;">
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
    elem: '#reimbursement_begintime'
  });
  
  //创建一个编辑器
  var editIndex = layedit.build('LAY_demo_editor');
  
	//ajax实现下拉项目带出项目的负责人
	form.on('select(proj_dm)', function(data){
		//获得项目信息主键
		var xmxxdm=data.value;
		if(xmxxdm==""||xmxxdm==undefined){
			return;
		}
		//ajax根据Id查询项目信息并设置其它属性值
		$.ajax({
			type : "post",
			url : "<c:url value='/xshtdj/queryXMXXById.do'/>",
			async : false,
			dataType : 'json',
			data :{"proj_Id":xmxxdm},
			error : function() {
				alert("出错");
			},
			success : function(msg) {
				//设置我方负责人
				$("#reimbursement_user_dm").html('');
				$("#reimbursement_user_dm").append(
						"<option value='"+msg.xmxx.user_Id+"' selected='selected'>"+ msg.xmxx.user_Name +"</option>");
			}
		});
		 form.render('select');
	}); 
	
	//监听提交
	  form.on('submit(demo1)', function(data){
	    layer.alert(JSON.stringify(data.field), {
	      title: '最终的提交信息'
	    })
	    return true;
	  });
	
	
	  //自定义验证规则
	  form.verify({
		  proj_dm: function(value){
		      if(value==""){
		        return '所属项目不能为空';
		      }
	    }
		 ,reimbursement_dm_fylx: function(value){
		      if(value==""){
		        return '费用类型不能为空';
		      }
	    }
		 ,reimbursement_begintime: function(value){
		      if(value==""){
		        return '发生日期不能为空';
		      }
	    }
	  });
	
	allUser(form);
	ylxXmXX(form);
	allfylx(form);
	loadXMXX(form);
	loadFYLX(form);
	loadFYSS(form);
});
  
function refreshAndClose(){
	var flag=$('#flag').val();
	if(flag){
		window.parent.location.reload();
		window.close();
	} 
}




//ajax加载所有的已立项的项目
function ylxXmXX(form){
	$.ajax({
		type : "post",
		url : "<c:url value='/xshtdj/queryAllYLXXMXX.do'/>",
		async : false,
		dataType : 'json',
		error : function() {
			alert("出错");
		},
		success : function(msg) {
			for (var i = 0; i < msg.length; i++) {
				$("#proj_dm").append(
						"<option value='"+msg[i].proj_Id+"'>"+ msg[i].budget_Name +"</option>");
			}
			form.render('select');
		}
	});
}

//ajax加载所有的费用类型
function allfylx(form){
	$.ajax({
		type : "post",
		url : "<c:url value='/bxtb/queryAllFYLX.do'/>",
		async : false,
		dataType : 'json',
		error : function() {
			alert("出错");
		},
		success : function(msg) {
			for (var i = 0; i < msg.length; i++) {
				$("#reimbursement_dm_fylx").append(
						"<option value='"+msg[i].fylx_dm+"'>"+ msg[i].fylx_mc +"</option>");
			}
			form.render('select');
		}
	});
}

//报销金额带两位小数点
function bxjeChange(){
	//获得报销金额输入的值
	var bxje=$('#reimbursement_bxje').val()*1;
	if(bxje!=""){
		var je=bxje.toFixed(2); 
		$('#reimbursement_bxje').val(je);
		//审核金额
		$('#reimbursement_shje').val(je);
		//发票金额
		$('#reimbursement_fpje').val(je);
	}else{
		$('#reimbursement_bxje').val("0.00");
		//审核金额
		$('#reimbursement_shje').val("0.00");
		//发票金额
		$('#reimbursement_fpje').val("0.00");
	}
}

	//自动加载所属项目
	function loadXMXX(form){
		//获得所属项目代码
		var xmxxdm=$('#xmxxdm').val();
		//遍历项目信息下拉选
		var xmxxs=$('#proj_dm').find('option');
		for(var i=0;i<xmxxs.length;i++){
			if(xmxxs[i].value==xmxxdm){
				xmxxs[i].setAttribute("selected",'true');
				break;
			}
		}
		form.render('select');
	}
	
	//自动加载费用类型
	function loadFYLX(form){
		//获得费用类型代码
		var fylxdm=$('#fylxdm').val();
		//遍历费用类型下拉选 //费用类型
		var fyxls=$('#reimbursement_dm_fylx').find('option');
		for(var i=0;i<fyxls.length;i++){
			if(fyxls[i].value==fylxdm){
				fyxls[i].setAttribute("selected",'true');
				break;
			}
		}
		form.render('select');
	}
	
	//自动加载费用所属
	function loadFYSS(form){
		//获得费用所属代码
		var fyssdm=$('#fyssdm').val();
		//遍历费用类型下拉选 //费用类型
		var fyss=$('#reimbursement_user_dm').find('option');
		for(var i=0;i<fyss.length;i++){
			if(fyss[i].value==fyssdm){
				fyss[i].setAttribute("selected",'true');
				break;
			}
		}
		form.render('select');
	}
	
	//ajax实现查询所有的我方负责人
	function  allUser(form){
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
					$("#reimbursement_user_dm").append(
							"<option value='"+msg[i].user_id+"'>"+ msg[i].user_name +"</option>");
				}
				form.render('select');
			}
		});
	}
</script>
</body>
</html>