<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>请假管理</title>
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
  <div class="layui-btn-container">
    <button class="layui-btn layui-btn-sm" lay-event="getCheckData" type="button" id="add">添加请假申请</button>
  </div>
</script>
 
<script type="text/html" id="barDemo">
  <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail" name="defaultAD" >查看</a>
</script>
              
          
<script src="../layui-v2.4.5/layui/layui.js" charset="utf-8"></script>
<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 --> 
 <script type="text/javascript" src="../jquery/jquery-3.3.1.js"></script>
<script>
layui.use(['form','table'], function(){
  //gnyc();	
  var table = layui.table;
  var url=$('#url').val();
  var form = layui.form;
  table.render({
    elem: '#test'
    ,url:url+'vacation/vacationList.do'
    ,toolbar: '#toolbarDemo'
    ,title: '请假管理'
    ,cols: [[
       {field:'index', width:"8%", title: '序号', sort: true,type:'numbers'}
      ,{field:'user_id', width:"12%",align:'center', title: '请假人'}
      ,{field:'days', width:"10%", align:'center', title: '请假天数'}
      ,{field:'reason', width:"30%", align:'center', title: '请假事由'}
      ,{field:'beginDate', width:"20%", align:'center', title: '请假时间'}
      ,{field:'state', width:"10%", align:'center', title: '请假状态'}
      ,{fixed: 'right', title:'操作', toolbar: '#barDemo', width:"10%",align:'center'}
    ]]
    ,page: true
  });
  
  //头工具栏事件
  table.on('toolbar(test)', function(obj){
    var url=$('#url').val();
 	if(obj.event=='getCheckData'){
     	 layer.open({
       	  	type:2,
       	  	title:'填报请假申请',
       	  	area: ['50%','70%'],
       		shadeClose: false,
       		resize:false,
       	    anim: 1,
       	  	content:[url+"vacation/initAddVacation.do",'yes']
     	  });
    }
  });
  
  //监听行工具事件 查看
  table.on('tool(test)', function(obj){
    var data = obj.data;
    var url=$('#url').val();
  	var vacation_id=data.vacation_id;
   	 layer.open({
     	  	type:2,
     	  	title:'查看',
     	  	area: ['100%','100%'],
     		shadeClose: false,
     		resize:false,
     	    anim: 1,
     	  	content:[url+"vacation/vacationShowById.do?vacation_id="+vacation_id,'yes']
   	  });
  });
});
</script>
</body>
</html>