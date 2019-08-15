<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>部门管理</title>
<link rel="stylesheet" href="../layui-v2.4.5/layui/css/layui.css">
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@page isELIgnored="false" %>
</head>
<body>
<form id="form" method="post">
	<input type="hidden" value='<c:url value="/"/>' id="url">
	<div  style="width:100%;overflow:hidden">
		<div style="width:15%;float:left;">
			<div style="height:-webkit-fill-available;padding-top:10%;padding-bottom:10%;background:#eee" class="layui-form-item">
				<h2 style="text-align: center;">部门机构</h2>
			 	<ul id="tree" style="font-size: 20px;"></ul>  
			</div>
		</div>
		<div style="width:85%;float:right;position:relative;top: -10px;">
			<table class="layui-hide" id="test" lay-filter="test" ></table>
		</div>
	</div>
 </form>
<script type="text/html" id="toolbarDemo">
  <div class="layui-btn-container" style="width:10%;">
    <button class="layui-btn layui-btn-sm" lay-event="getCheckData" type="button">新增</button>
  </div>
</script>
 
<script type="text/html" id="barDemo">
  <!--<a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail" name="defaultAD">授权</a>-->
  <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
  <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>
              
          
<script src="../layui-v2.4.5/layui/layui.js" charset="utf-8"></script>
<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 --> 
 <script type="text/javascript" src="../jquery/jquery-3.3.1.js"></script>
<script>
layui.use(['table','tree','form'], function(){
  var form = layui.form
  var table = layui.table;
  var url=$('#url').val();
  initTree(layui,form);
  table.render({
    elem: '#test'
    ,url:url+'department/department.do'
    ,toolbar: '#toolbarDemo'
    ,title: '部门管理'
    ,cols:[[
       {field:'index', width:"8%", title: '序号', sort: true,type:'numbers'}
      ,{field:'dep_name', width:"22%",align:'center', title: '部门名称'}
      ,{field:'dep_description', width:"40%", align:'center', title: '部门描述'}
      ,{field:'dep_parentName', width:"18%", align:'center', title: '上级部门'}
      ,{fixed: 'right', title:'操作', toolbar: '#barDemo', width:"12%",align:'center'}
    ]]
    ,id:'testReload'
    ,page: true
    
  });
  
  //头工具栏事件
  table.on('toolbar(test)', function(obj){
    var url=$('#url').val();
    if(obj.event=='getCheckData'){
    	 layer.open({
      	  	type:2,
      	  	title:'新增部门',
      	  	area: ['50%','70%'],
      		shadeClose: false,
      		resize:false,
      	    anim: 1,
      	  	content:[url+"department/initSaveDepartment.do",'yes']
    	});
    }
  });
  
  //监听行工具事件
  table.on('tool(test)', function(obj){
    var data = obj.data;
    var url=$('#url').val();
    var id=data.dep_id;
    //console.log(obj)
    if(obj.event === 'del'){
    	 layer.confirm('您确定要删除该部门吗？', {
			  btn: ['确定','取消'], //按钮
			  title:'提示'},function(index){
				//删除部门
				  $.ajax({  
					    type: "post",  
					    url:  "<c:url value='/department/deleteDepartment.do'/>",
					    dataType: 'json',
					    async:false,
					    data:{"id":id},
					    error:function(){
					    	alert("出错");
					    },
					    success: function (data) {  
					    	if(data.flag){
					    		layer.close(index);
					    		window.location.reload();
					    	}else{
					    		layer.close(index);
					    		layer.msg("当前部门下存在子部门无法删除，请先删除子部门")
					    	}
					    }  
					});
			  }
		  );
    } else if(obj.event === 'edit'){
    	layer.open({
     	  	type:2,
     	  	title:'编辑部门',
     	  	area: ['50%','70%'],
     		shadeClose: false,
      		resize:false,
      	    anim: 1,
     	  	content:[url+"department/initEdgeDepartment.do?id="+id,'yes']
   	  	});
    }
  });
});

function initTree(layui,form){
	 var url=$('#url').val();
	 var table = layui.table;
	//初始化部门树
	  $.ajax({  
		    type: "post",  
		    url:  "<c:url value='/department/departmentList.do'/>",
		    dataType: 'json',
		    async:false,
		    error:function(){
		    	alert("出错");
		    },
		    success: function (data) {  
		        layui.tree({  
		            elem: '#tree',  
		            nodes: data,
		            click: function (node) {
		            	//点击左侧菜单右侧表格内容跟随变化
		            	  table.render({
	            		    elem: '#test'
	            		    ,url:url+'department/queryDepartment.do?id='+node.id
	            		    ,toolbar: '#toolbarDemo'
	            		    ,title: '部门管理'
	            		    ,cols:[[
	            		       {field:'index', width:"8%", title: '序号', sort: true,type:'numbers'}
	            		      ,{field:'dep_name', width:"22%",align:'center', title: '部门名称'}
	            		      ,{field:'dep_description', width:"40%", align:'center', title: '部门描述'}
	            		      ,{field:'dep_parentName', width:"20%", align:'center', title: '上级部门'}
	            		      ,{fixed: 'right', title:'操作', toolbar: '#barDemo', width:"10%",align:'center'}
	            		    ]]
	            		    ,id:'testReload'
	            		    ,page: true
	            		    
	            		  });
		            },  
		            success: function () {
		            	
		            }  
		        });  
		    }  
		});
}
</script>
</body>
</html>