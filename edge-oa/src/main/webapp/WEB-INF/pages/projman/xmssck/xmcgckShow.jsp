<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<title>项目采购出库查看页</title>
<link rel="stylesheet" href="../layui-v2.4.5/layui/css/layui.css">
<link rel="stylesheet" href="../login/css/static.css">
<script src="../jquery/jquery-3.3.1.js"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@page isELIgnored="false" %>
<style>
  .bj{background-color: #F0F0F0}
 </style>
</head>
<body style="width:100%;padding:0px; margin:0px;text-align: center;">
	<div style="width:1280px;height:auto;padding:0px; margin:0 auto;" id="main">
		<form class="layui-form" action=""  style="margin-top: 30px;">
			<input type="hidden" id="url" value='<c:url value="/"/>'>
			
			<div class="layui-form-item">
				<div class="layui-inline" style="width: 500px;left: -222px;">
				  	<label class="layui-form-label">产品名称</label>
					<div class="layui-input-inline">
						<input type="text"  lay-verify="bp_Method"
						autocomplete="off" class="layui-input bj" style="width: 308px;"  value="${xmrkif.chanPinMC}" disabled="">
					</div>
				 </div>
				  <div class="layui-inline" style="left: -287px;">
				      <label class="layui-form-label">品牌</label>
				      <div class="layui-input-inline">
				      <input type="text"  lay-verify="cont_Amount"
						autocomplete="off" class="layui-input bj" style="width:356px;"  value="${xmrkif.pinPai}" disabled="">
				      </div>
			    </div>
			 </div>
			 
			 <div class="layui-form-item">
				 <div class="layui-inline" style="left: -311px;">
					     <label class="layui-form-label">规格型号</label>
					      <div class="layui-input-inline">
					      <input type="text"  lay-verify="cont_Amount"
							autocomplete="off" class="layui-input bj" style="width: 308px;"  value="${xmrkif.guiGeXH}" disabled="">
					      </div>
				    </div>
				    <div class="layui-inline" style="left: -199px;">
					     <label class="layui-form-label" style="width: 93px;">主要配置参数</label>
					      <div class="layui-input-inline">
					      <input type="text"  lay-verify="cont_Amount"
							autocomplete="off" class="layui-input bj" style="width: 356px;"  value="${xmrkif.zhuYaoPZCS}" disabled="">
					      </div>
				    </div>
			 </div>
			 
			 <div class="layui-form-item">
					<div class="layui-inline" style="left: -29px;">
					     <label class="layui-form-label">单价</label>
					      <div class="layui-input-inline">
					      <input type="text"  lay-verify="cont_Amount"
							autocomplete="off" class="layui-input bj" style="width:83px;;" id="dj" value="${xmrkif.price}" disabled="">
					     	<span style="position: relative;top: -25px;right: 3px;">元</span>
					      </div>
				    </div>
				    
				     <div class="layui-inline" style="left: -177px;top: -9px;">
					     <label class="layui-form-label" style="width: 93px;">数量</label>
					      <div class="layui-input-inline">
					      <input type="text"  lay-verify="cont_Amount"
							autocomplete="off" class="layui-input bj" style="width: 121px;" id="sl" value="${xmrkif.oldShuLiang}" disabled="">
					      </div>
				    </div>
				    
				    <div class="layui-inline" style="left: -253px;">
					     <label class="layui-form-label" style="width: 93px;">金额</label>
					      <div class="layui-input-inline">
					      <input type="text"  lay-verify="cont_Amount"
							autocomplete="off" class="layui-input bj" style="width: 160px;" id="je"  value="${xmrkif.jinE}" disabled="">
					      <span style="position: relative;top: -25px;right: -75px;">元</span>
					      </div>
				    </div>
				    
			 		<div class="layui-inline" style="left: -304px;top: -9px;">
					     <label class="layui-form-label">单位</label>
					      <div class="layui-input-inline" style="width: 95px;">
					      <input type="text"  lay-verify="cont_Amount"
							autocomplete="off" class="layui-input bj" style="width:83px;;"  value="${xmrkif.danWei}" disabled="">
					      </div>
				    </div>
			 </div>

			<div class="layui-form-item" >
		    <label class="layui-form-label">采购商</label>
			    <div class="layui-input-block">
			      <input type="text" lay-verify="proj_Code" autocomplete="off" value="${xmrkif.buyer}" disabled="" class="layui-input bj" style="width: 63%" >
			    </div>
			</div>
		 
		  <div class="layui-form-item layui-form-text">
		    <label class="layui-form-label">备注</label>
		    <div class="layui-input-block" style="width: 933px;">
		      <textarea  class="layui-textarea bj" style="width: 807px;" disabled="">${xmrkif.bz}</textarea>
		    </div>
		  </div>
			
		</form>
	</div>
			
	
		
<script src="../layui-v2.4.5/layui/layui.js" charset="utf-8"></script>
<script type="text/javascript" src="../jquery-easyui-1.7.0/jquery.easyui.min.js"></script>
<script>
layui.use(['form', 'layedit', 'laydate'], function(){
  var form = layui.form
  ,layer = layui.layer
  ,layedit = layui.layedit
  ,laydate = layui.laydate
 
  form.render();
  setsl();
});

//设置数量
function setsl(){
	var je=$('#je').val();
	var dj=$('#dj').val();
	$('#sl').val((je*1)/(dj*1));
}
</script>
</body>
</html>