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
<title>项目采购入库</title>
<link rel="stylesheet" href="../layui-v2.5.4/layui/css/layui.css">
<link rel="stylesheet" href="../bootstrap-3.3.7-dist/css/bootstrap.min.css"> 
<link rel="stylesheet" href="../bootstrap-3.3.7-dist/css/bootstrap-theme.min.css"> 
<script src="../jquery/jquery-3.3.1.js"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@page isELIgnored="false" %>
</head>
<body  style="width:100%;padding:0px; margin:0px;text-align: center;">
	<form class="layui-form">
		<div style="width:1280px;height:auto;padding:0px; margin:0 auto;" id="main">
			<input type="hidden" id="url" value='<c:url value="/"/>'>
			<input type="hidden" id="dms" name="hwdms">
			  <div class="layui-form-item" style="margin-top: 5%">
			    <label class="layui-form-label" style="width: 120px;">销售合同名称</label>
					<div class="layui-input-inline" style="width: 88%;text-align: left;">
						<select name="proj_Id" id="proj_Id" lay-filter="proj_Id" lay-verify="proj_Id" lay-search="">
							<option value="" selected="selected">请选择所属销售合同</option>
						</select>
					</div>
			  </div>
			  <div class="layui-form-item" style="text-align: left;margin-left: 120px;">
			 	<div id="test4" class="demo-transfer"></div>
			  </div>
	 </div>
 </form>
<script src="../bootstrap-3.3.7-dist/js/bootstrap.js"></script>
<script src="../layui-v2.5.4/layui/layui.js" charset="utf-8"></script>
<script>
layui.use(['form', 'layedit', 'laydate','transfer','util'], function(){
  var form = layui.form
  ,layer = layui.layer
  ,layedit = layui.layedit
  var url=$('#url').val();
  var transfer = layui.transfer;
  var util = layui.util;
  form.render();
  allXSHT(form);
  //创建一个编辑器
  var editIndex = layedit.build('LAY_demo_editor');
  
//ajax实现下拉销售合同在搜索框中展现货物产品内容
	form.on('select(proj_Id)', function(data){
			//获取销售合同代码
			var xshtdm=data.value;
			if(xshtdm!=""){
				$.ajax({
					type : "post",
					url : "<c:url value='/xmcgrk/queryXMCKRKByXshtdm.do'/>",
					async : false,
					data:{"xshtdm":xshtdm},
					dataType : 'json',
					error : function() {
						alert("出错");
					},
					success : function(msg) {
						//显示搜索框
						  transfer.render({
						    elem: '#test4'
						    ,data: msg
						    ,title: ['货物产品', '入库']
						    ,showSearch: true
						    ,onchange: function(data, index){
						    	//左边 索引为0 右边为1
						    	if(index==0){
						    		//遍历结果集
						    		for(var i=0;i<data.length;i++){
						    			//获得穿梭的数据代码
							    		var hwdm=data[i].value;
							    		var dms=$('#dms').val();
						    			//拼接id字符串
							    		if(undefined!=dms){
											 dms=dms+","+hwdm;
											 $('#dms').val(dms);
										 }else{
											 dms=hwdm;
											 $('#dms').val(dms);
										 }
						    		}
						    		//弹出页面查看货物信息
						    		var d=$('#dms').val();
						    		parent.layer.open({
						          	  	type:2,
						          	  	title:'入库内容',
						          	  	area: ['100%','100%'],
						          	  	shadeClose: true,
						          		resize:false,
						          	    anim: 1,
						          	  	content:[url+"xmcgrk/hwnrShow.do?hwdms="+d,'yes']
						        	});
						    	}else{
						    		for(var i=0;i<data.length;i++){
						    			var dm=$('#dms').val();
						    			//获得穿梭的数据代码
							    		var hwdm=data[i].value;
						    			//拼接id字符串
							    		var str=dm.replace(","+hwdm,"");
							    		$('#dms').val(str);
						    		}
						    	}
						      } 
						  })
					}
				});
			}else{
				 transfer.render({
					    elem: '#test4'
					    ,data: ""
					    ,title: ['货物产品', '入库']
					    ,showSearch: true
					  })
			}
	});
	
	 //自定义验证规则
	  form.verify({
		  proj_Id: function(value){
	      if(value==""||value==null){
	        return '请选择销售合同';
	      }
	    }
	  });
  
  
});


//ajax实现查询所有的流程已结束的销售合同
function  allXSHT(form){
	$.ajax({
		type : "post",
		url : "<c:url value='/xmcgrk/queryAllXSHT.do'/>",
		async : false,
		dataType : 'json',
		error : function() {
			alert("出错");
		},
		success : function(msg) {
			for (var i = 0; i < msg.length; i++) {
				$("#proj_Id").append(
						"<option value='"+msg[i].proj_Info_Id+"'>"+ msg[i].proj_Name +"</option>");
			}
			form.render('select');
		}
	});
}


</script>
</body>
</html>