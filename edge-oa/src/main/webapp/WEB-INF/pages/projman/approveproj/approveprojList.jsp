<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>项目信息列表</title>
<link rel="stylesheet" href="../layui-v2.4.5/layui/css/layui.css">
<link rel="stylesheet" href="../login/css/static.css">
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@page isELIgnored="false" %>
</head>
<body>
	<form class="layui-form" action="" style="margin-top: 10px;">
	 <div class="demoTable" style="background-color: #CAE1FF" id="gjssq">
		<div class="layui-form-item" style="width:1280px;height:auto;padding:0px; margin:0 auto;" id="main"">
		 <div class="layui-form-item">
			 <div class="layui-inline">
			      <label class="layui-form-label" style="width: 100px;">项目编号</label>
			      <div class="layui-input-inline">
			        <input type="text" name="proj_Code" lay-verify="proj_Code"
					autocomplete="off" class="layui-input" style="width: 200px;" id="proj_Code">
			      </div>
		     </div>
		    <div class="layui-inline" style="width:490px;">
				  	<label class="layui-form-label">项目名称</label>
					<div class="layui-input-inline" style="text-align: left;width: 75%">
						<select name="proj_Id" id="proj_Id" lay-filter="proj_Id" lay-verify="proj_Id" lay-search="">
							<option value="" selected="selected">请选择项目名称</option>
						</select>
					</div>
			</div>
			<div class="layui-inline" style="width: 24.5%;left: -6px;">
			  	<label class="layui-form-label">我方负责人</label>
				<div class="layui-input-inline" style="text-align: left;">
					<select name="user_Id" id="user_Id" lay-filter="required" lay-verify="required">
						<option value="" selected="selected">请选择我方负责人</option>
					</select>
				</div>
		 	</div>
		 	<button class="layui-btn" data-type="reload" type="button" id="do_search" >搜索</button>
	 	</div>
		
		<div class="layui-form-item">
			<div class="layui-inline">
			      <label class="layui-form-label" style="width: 100px;">当前操作</label>
			      <div class="layui-input-inline">
			        <input type="text" name="nextCZ" lay-verify="nextCZ"
					autocomplete="off" class="layui-input" style="width: 200px;" id="nextCZ">
			      </div>
		     </div>
			 <div class="layui-inline" style="width: 25.7%;">
			  	<label class="layui-form-label">审批状态</label>
				<div class="layui-input-inline" style="text-align: left;">
					<select name="appr_Status" id="appr_Status" lay-filter="appr_Status" lay-verify="appr_Status">
						<option value="" selected="selected">请选择审批状态</option>
					</select>
				</div>
		 	</div>
		    <div class="layui-inline" style="left: -44px;width: 512px;">
		      <label class="layui-form-label" style="width: 71px;">提交时间</label>
		      <div class="layui-input-inline">
		        <input type="text" name="time1" id="date" lay-verify="date" placeholder="yyyy-MM-dd" autocomplete="off" class="layui-input">
		      </div>
		       <i class="u-date_line" style="margin-left: -14px;line-height: 35px;">—</i>
		      <div class="layui-input-inline">
		        <input type="text" name="time2" id="date2" lay-verify="date" placeholder="yyyy-MM-dd" autocomplete="off" class="layui-input">
		      </div>
			</div>
			<button type="reset" class="layui-btn layui-btn-primary" style="margin-left: -38px;">重置</button>
	 	</div>
	
	</div> 
	</div>
</form>
	
	<input type="hidden" value='<c:url value="/"/>' id="url">
	<input type="hidden" id="flag" value="false">
	<div style="position:relative;top: -10px;">
		<table class="layui-hide" id="test" lay-filter="test"></table>
	</div>
<script type="text/html" id="toolbarDemo">
  <div class="layui-btn-container" style="width:25%;">
    <button class="layui-btn layui-btn-sm" lay-event="getCheckData" type="button">项目立项</button>
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
  allXMXX(form);
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
    ,url:url+'approveproj/approveprojList.do'
    ,toolbar: '#toolbarDemo'
    ,title: '项目信息'
    ,cols: [[
       {field:'index', width:"8%", title: '序号', sort: true,type:'numbers'}
      ,{field:'proj_Code', width:"18%",align:'center', title: '项目编号'}
      ,{field:'budget_Name', width:"20%", align:'center', title: '项目名称'}
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
	    		 var tr = that.find(".layui-table-box tbody tr[data-index='" + index + "']").css({"color":"#EE3B3B","font-weight":"bold"});
	    	}else if(res.data[index].spzt=='退回'){
	    		 var tr = that.find(".layui-table-box tbody tr[data-index='" + index + "']").css({"color": "#FFA500","font-weight":"bold"});
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
      	  	title:'项目立项',
      	  	area: ['100%','100%'],
      	  	shadeClose: false,
      		resize:false,
      	    anim: 1,
      	  	content:[url+"approveproj/initSaveApproveproj.do",'yes']
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
  	var proj_Id=data.proj_Id;
   	 layer.open({
     	  	type:2,
     	  	title:'查看',
     	  	area: ['100%','100%'],
     		shadeClose: false,
     		resize:false,
     	    anim: 1,
     	  	content:[url+"approveproj/xiangMuXXShowById.do?proj_Id="+proj_Id,'yes']
   	  });
  });
  
  // 执行搜索，表格重载
  $('#do_search').on('click', function () {
      // 搜索条件
      var proj_Code = $('#proj_Code').val();
      var proj_Id=$('#proj_Id').val();
      var user_Id=$('#user_Id').val();
      var nextCZ=$('#nextCZ').val();
      var appr_Status=$('#appr_Status').val();
      var date=$('#date').val();
      var date2=$('#date2').val();
      table.reload('testReload', {
          method: 'post'
          , where: {
              'proj_Code': proj_Code,
              'proj_Id':proj_Id,
              'user_Id':user_Id,
              'nextCZ':nextCZ,
              'appr_Status':appr_Status,
              'time1':date,
              'time2':date2,
          }
          , page: {
              curr: 1
          }
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

//ajax实现查询所有的项目信息
function  allXMXX(form){
	$.ajax({
		type : "post",
		url : "<c:url value='/approveproj/queryAllXMXX.do'/>",
		async : false,
		dataType : 'json',
		error : function() {
			alert("出错");
		},
		success : function(msg) {
			for (var i = 0; i < msg.length; i++) {
				$("#proj_Id").append(
						"<option value='"+msg[i].proj_Id+"'>"+ msg[i].budget_Name +"</option>");
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