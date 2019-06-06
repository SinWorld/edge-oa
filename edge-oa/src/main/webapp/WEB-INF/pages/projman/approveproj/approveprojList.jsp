<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>项目信息列表</title>
<link rel="stylesheet" href="../layui-v2.4.5/layui/css/layui.css">
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@page isELIgnored="false" %>
</head>
<body>
<form id="form" method="post">
	<input type="hidden" value='<c:url value="/"/>' id="url">
	<table class="layui-hide" id="test" lay-filter="test"></table>
 </form>
<script type="text/html" id="toolbarDemo">
  <div class="layui-btn-container" style="width:10%;">
    <button class="layui-btn layui-btn-sm" lay-event="getCheckData" type="button">项目立项</button>
  </div>
</script>
<script src="../layui-v2.4.5/layui/layui.js" charset="utf-8"></script>
<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 --> 
<script type="text/javascript" src="../jquery/jquery-3.3.1.js"></script>
<script src="../layui-v2.4.5/layui/layui.js" charset="utf-8"></script>
<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 --> 
<script>
layui.use(['table','form'], function(){
  var table = layui.table;
  var url=$('#url').val();
  var form= layui.form;
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
});
</script>
</body>
</html>