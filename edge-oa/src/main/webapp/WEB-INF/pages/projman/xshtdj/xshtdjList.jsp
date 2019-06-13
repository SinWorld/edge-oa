<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>销售合同列表</title>
<link rel="stylesheet" href="../layui-v2.4.5/layui/css/layui.css">
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@page isELIgnored="false"%>

</head>
<body>
<form class="layui-form" action="" style="margin-top: 10px;">
	 <div class="demoTable" style="background-color: #CAE1FF" id="gjssq">
		<div class="layui-form-item" style="margin-bottom: 2%;width: 340px;">
			<label class="layui-form-label">合同编号</label>
			<div class="layui-input-block" style="width: 312px;">
				<input type="text" name="proj_Code" lay-verify="proj_Code"
					autocomplete="off" class="layui-input" style="width: 200px;" id="proj_Code">
			</div>
		</div>
		
		<div class="layui-form-item" style="margin-top:-64px;width: 530px;float: right;margin-right: 465px;">
				<label class="layui-form-label">合同名称</label>
				<div class="layui-input-inline" style="width: 400px;">
					<select name="proj_Info_Id" id="proj_Info_Id" lay-filter="required" lay-verify="required">
						<option value="" selected="selected">请选择合同</option>
					</select>
				</div>
			</div>
		
			<div class="layui-form-item" style="margin-top: -64px;float: right;margin-right: 140px;">
				<label class="layui-form-label">我方负责人</label>
				<div class="layui-input-inline">
					<select name="user_Id" id="user_Id" lay-filter="required" lay-verify="required">
						<option value="" selected="selected">请选择我方负责人</option>
					</select>
				</div>
			</div>
			 <button class="layui-btn" data-type="reload" type="button" id="do_search"style="float: right;margin-top: -64px;margin-right: 35px;">搜索</button>
		
		<div class="layui-form-item" style="width: 320px;float: right;margin-right: 673px;">
				<label class="layui-form-label">审批状态</label>
				<div class="layui-input-inline" style="width: 200px;">
					<select name="appr_Status" id="appr_Status" lay-filter="appr_Status" lay-verify="appr_Status">
						<option value="" selected="selected">请选择审批状态</option>
					</select>
				</div>
		</div>
		
		
		<div class="layui-form-item" style="margin-bottom: 2%;width: 340px;display:inline">
			<label class="layui-form-label">当前操作</label>
			<div class="layui-input-block" style="width: 312px;">
				<input type="text" name="nextCZ" lay-verify="nextCZ"
					autocomplete="off" class="layui-input" style="width: 200px;" id="nextCZ">
			</div>
		</div>
		
		<div class="layui-inline" style="display:inline;float: right;margin-top: -54px;margin-right: 148px;">
		      <label class="layui-form-label" style="width: 120px;">提交时间</label>
		      <div class="layui-input-inline">
		        <input type="text" name="time1" id="date" lay-verify="date" placeholder="yyyy-MM-dd" autocomplete="off" class="layui-input">
		      </div>-
		      <div class="layui-input-inline">
		        <input type="text" name="time2" id="date2" lay-verify="date" placeholder="yyyy-MM-dd" autocomplete="off" class="layui-input">
		      </div>
		</div>
		<button type="reset" class="layui-btn layui-btn-primary" style="float: right;margin-top: -54px;margin-right: 35px;">重置</button>
	</div> 
</form>
<input type="hidden" value='<c:url value="/"/>' id="url">
<input type="hidden" id="flag" value="false">
<table class="layui-hide" id="test" lay-filter="test"></table>
<script type="text/html" id="toolbarDemo">
  <div class="layui-btn-container" style="width:25%;">
    <button class="layui-btn layui-btn-sm" lay-event="getCheckData" type="button">销售合同登记</button>
 	<button class="layui-btn layui-btn-sm" lay-event="gjss" type="button">高级搜索</button>
  </div>
</script>
<script src="../layui-v2.4.5/layui/layui.js" charset="utf-8"></script>
<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
<script type="text/javascript" src="../jquery/jquery-3.3.1.js"></script>
<script src="../layui-v2.4.5/layui/layui.js" charset="utf-8"></script>
<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
<script>
layui.use(['table','form','layedit', 'laydate'], function(){
  var table = layui.table;
  var url=$('#url').val();
  var form= layui.form;
  var layer = layui.layer;
  var layedit = layui.layedit;
  var laydate = layui.laydate;
  $('#gjssq').hide();
  allUser(form);
  allXSHT(form);
  allSPZT(form);
  form.render();
  //日期
  laydate.render({
    elem: '#date'
  });
  laydate.render({
	elem: '#date2'
  });
  table.render({
    elem: '#test'
    ,url:url+'xshtdj/xshtdjList.do'
    ,toolbar: '#toolbarDemo'
    ,title: '销售合同'
    ,cols: [[
       {field:'index', width:"8%", title: '序号', sort: true,type:'numbers'}
      ,{field:'proj_Code', width:"18%",align:'center', title: '合同编号'}
      ,{field:'proj_Name', width:"20%", align:'center', title: '合同名称'}
      ,{field:'user_Name', width:"10%", align:'center', title: '我方负责人姓名'}
      ,{field:'spzt', width:"10%", align:'center', title: '审批状态'}
      ,{field:'subm_Name', width:"10%", align:'center', title: '提交人姓名'}
      ,{field:'nextCZ', width:"10%", align:'center', title: '当前操作'}
      ,{field:'tjTime', width:"14%", align:'center', title: '提交时间'}
    ]]
    ,id:'testReload'
    ,page: true
    ,done: function(res, curr, count){
    	var that = this.elem.next();
	    res.data.forEach(function (item, index) {
	    	if(res.data[index].spzt=='作废'){
	    		 var tr = that.find(".layui-table-box tbody tr[data-index='" + index + "']").css("background-color", "#EE3B3B");
	    	}else if(res.data[index].spzt=='退回'){
	    		 var tr = that.find(".layui-table-box tbody tr[data-index='" + index + "']").css("background-color", "#FFA500");
	    	}
        });

	  }
  });
  
  //头工具栏事件
  table.on('toolbar(test)', function(obj){
    var url=$('#url').val();
    var flag=$('#flag').val();
    if(obj.event=='getCheckData'){
    	 layer.open({
      	  	type:2,
      	  	title:'销售合同登记',
      	  	area: ['100%','100%'],
      	  	shadeClose: false,
      		resize:false,
      	    anim: 1,
      	  	content:[url+"xshtdj/initXSHTDJAppend.do",'yes']
    	  	});
    }else if(obj.event=='gjss'){
    	if(flag=='false'){
    		$('#gjssq').fadeIn();
    		$('#flag').val(true);
    	}else{
    		$('#gjssq').fadeOut();
    		$('#flag').val(false);
    	}
    	
    }
  });
  
  //监听行工具事件 查看
  table.on('row(test)', function(obj){
    var data = obj.data;
    var url=$('#url').val();
  	var proj_Id=data.proj_Info_Id;
   	 layer.open({
     	  	type:2,
     	  	title:'查看',
     	  	area: ['100%','100%'],
     		shadeClose: false,
     		resize:false,
     	    anim: 1,
     	  	content:[url+"xshtdj/xiaoShouHTShowById.do?proj_Id="+proj_Id,'yes']
   	  });
  });
});
 

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
				$("#user_Id").append(
						"<option value='"+msg[i].user_id+"'>"+ msg[i].user_name +"</option>");
			}
			form.render('select');
		}
	});
}

//ajax实现查询所有的销售合同信息
function  allXSHT(form){
	$.ajax({
		type : "post",
		url : "<c:url value='/xshtdj/queryAllXSHT.do'/>",
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

//ajax实现查询所有的审批状态
function  allSPZT(form){
	$.ajax({
		type : "post",
		url : "<c:url value='/approveproj/queryAllSPZT.do'/>",
		async : false,
		dataType : 'json',
		error : function() {
			alert("出错");
		},
		success : function(msg) {
			for (var i = 0; i < msg.length; i++) {
				$("#appr_Status").append(
						"<option value='"+msg[i].appr_Status_Id+"'>"+ msg[i].appr_Status_Name +"</option>");
			}
			form.render('select');
		}
	});
}

</script>
</body>
</html>