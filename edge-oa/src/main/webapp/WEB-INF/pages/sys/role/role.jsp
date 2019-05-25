<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>角色管理</title>
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
    <button class="layui-btn layui-btn-sm" lay-event="getCheckData" type="button">新增</button>
  </div>
</script>
 
<script type="text/html" id="barDemo">
  <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail" name="defaultAD">授权</a>
  <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
  <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>
              
          
<script src="../layui-v2.4.5/layui/layui.js" charset="utf-8"></script>
<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 --> 
 <script type="text/javascript" src="../jquery/jquery-3.3.1.js"></script>
<script>
layui.use('table', function(){
  var table = layui.table;
  var url=$('#url').val();
  table.render({
    elem: '#test'
    ,url:url+'role/roleList.do'
    ,toolbar: '#toolbarDemo'
    ,title: '角色管理'
    ,cols: [[
       {field:'index', width:"8%", title: '序号', sort: true,type:'numbers'}
      ,{field:'role_name', width:"22%",align:'center', title: '角色名称'}
      ,{field:'role_infor', width:"55%", align:'center', title: '角色说明'}
      ,{fixed: 'right', title:'操作', toolbar: '#barDemo', width:"15%",align:'center'}
    ]]
    ,page: true
  });
  
  //头工具栏事件
  table.on('toolbar(test)', function(obj){
    var url=$('#url').val();
    if(obj.event=='getCheckData'){
    	 layer.open({
      	  	type:2,
      	  	title:'新增角色',
      	  	area: ['50%','60%'],
      		shadeClose: false,
      		resize:false,
      	    anim: 1,
      	  	content:[url+"role/initSaveRole.do",'yes']
    	  	});
    }
  });
  
  //监听行工具事件
  table.on('tool(test)', function(obj){
    var data = obj.data;
    var url=$('#url').val();
    var roleId=data.role_id;
    //console.log(obj)
    if(obj.event === 'del'){
    	 layer.confirm('您确定要删除该角色吗？', {
			  btn: ['确定','取消'], //按钮
			  title:'提示'},function(index){
				  //获取表单
				  var form=document.getElementById('form');
				  form.action=url+"role/deleteRole.do?roleId="+roleId;
				  form.submit();
				  layer.close(index);
			  }
		  );
    } else if(obj.event === 'edit'){
    	layer.open({
     	  	type:2,
     	  	title:'编辑角色',
     	  	area: ['50%','60%'],
     		shadeClose: false,
      		resize:false,
      	    anim: 1,
     	  	content:[url+"role/initEditRole.do?roleId="+roleId,'yes']
   	  	});
    }else if(obj.event === 'detail'){
    	layer.open({
     	  	type:2,
     	  	title:'角色授权',
     	  	area: ['100%','100%'],
     		shadeClose: false,
      		resize:false,
      	    anim: 1,
     	  	content:[url+"privilege/initPrivilegeList.do?roleId="+roleId,'yes']
   	  	});
    }
  });
});
</script>
</body>
</html>