<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户管理</title>
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
  <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
  <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
  <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail" name="defaultAD">重置密码</a>
  <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="setRole" name="defaultAD">角色设置</a>
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
    ,url:url+'user/userList.do'
    ,toolbar: '#toolbarDemo'
    ,title: '用户管理'
    ,cols: [[
       {field:'index', width:"8%", title: '序号', sort: true,type:'numbers'}
      ,{field:'user_login_name', width:"18%",align:'center', title: '登录名'}
      ,{field:'user_name', width:"17%", align:'center', title: '姓名'}
      ,{field:'user_department_name', width:"17%", align:'center', title: '所属部门'}
      ,{field:'userRoleName', width:"20%", align:'center', title: '角色'}
      ,{fixed: 'right', title:'操作', toolbar: '#barDemo', width:"20%",align:'center'}
    ]]
    ,page: true
  });
  
  //头工具栏事件
  table.on('toolbar(test)', function(obj){
    var url=$('#url').val();
    if(obj.event=='getCheckData'){
    	 layer.open({
      	  	type:2,
      	  	title:'新增用户',
      	  	area: ['50%','70%'],
      	  	shadeClose: false,
      		resize:false,
      	    anim: 1,
      	  	content:[url+"user/initSaveUser.do",'yes']
    	  	});
    }
  });
  
  //监听行工具事件
  table.on('tool(test)', function(obj){
    var data = obj.data;
    var url=$('#url').val();
    var user_id=data.user_id;
    //console.log(obj)
    if(obj.event === 'del'){
    	 layer.confirm('您确定要删除该用户吗？', {
			  btn: ['确定','取消'], //按钮
			  title:'提示'},function(index){
				  //获取表单
				  var form=document.getElementById('form');
				  form.action=url+"user/deleteUser.do?user_id="+user_id;
				  form.submit();
				  layer.close(index);
			  }
		  );
    } else if(obj.event === 'edit'){
    	layer.open({
     	  	type:2,
     	  	title:'编辑用户',
     	  	area: ['50%','70%'],
     	  	shadeClose: false,
      		resize:false,
      	    anim: 1,
     	  	content:[url+"user/initEditUser.do?user_id="+user_id,'yes']
   	  	});
    }else if(obj.event === 'detail'){
    	$.ajax({
    		type : "post",
    		url : "<c:url value='/user/resertPassword.do'/>",
    		async : false,
    		dataType : 'json',
    		data:{"user_id":user_id},
    		error : function() {
    			alert("出错");
    		},
    		success : function(msg) {
    			if(msg.flag=='success'){
    				layer.msg('您当前密码已被管理员重置,新密码已发送至您邮箱!!!');
    			}
    		}
    	});
    }else if(obj.event === 'setRole'){
    	layer.open({
     	  	type:2,
     	  	title:'设置角色',
     	  	area: ['60%','70%'],
     	  	shadeClose: false,
      		resize:false,
      	    anim: 1,
     	  	content:[url+"user/initSetRole.do?user_id="+user_id,'yes']
   	  	});
    }
  });
});
</script>
</body>
</html>