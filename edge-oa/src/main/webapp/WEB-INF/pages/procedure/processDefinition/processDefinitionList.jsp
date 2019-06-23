<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>流程定义列表</title>
<link rel="stylesheet" href="../layui-v2.4.5/layui/css/layui.css">
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@page isELIgnored="false"%>
</head>
<body>
    <form id="form" method="post">
		<input type="hidden" value='<c:url value="/"/>' id="url">
		<div style="position:relative;top: -10px;">
			<table class="layui-hide" id="test" lay-filter="test"></table>
		</div>
	</form>
	<script type="text/html" id="toolbarDemo">
  	<div class="layui-btn-container">
    	<button class="layui-btn layui-btn-sm" lay-event="getCheckData" type="button">部署流程定义</button>
 	 </div>
	</script>
	<script type="text/html" id="barDemo">
 		 <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
    	 <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail" name="defaultAD" >查看流程图</a>
    </script>

	<script src="../layui-v2.4.5/layui/layui.js" charset="utf-8"></script>
	<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
	<script type="text/javascript" src="../jquery/jquery-3.3.1.js"></script>
	<script type="text/javascript">
		layui.use([ 'form', 'table' ], function() {
			var table = layui.table;
			var url = $('#url').val();
			var form = layui.form;
			table.render({
				elem : '#test',
				url : url + 'processDefinition/processDefinitionList.do',
				toolbar : '#toolbarDemo',
				title : '审批流程管理',
				cols : [ [ {
					field : 'index',
					width : "8%",
					title : '序号',
					sort : true,
					type : 'numbers'
				}, {
					field : 'NAME_',
					width : "55%",
					align : 'center',
					title : '流程名称'
				}, {
					field : 'VERSION_',
					width : "22%",
					align : 'center',
					title : '最新版本'
				}, {
					fixed : 'right',
					title : '操作',
					toolbar : '#barDemo',
					width : "15%",
					align : 'center'
				} ] ],
				page : true
			});
			 //头工具栏事件
			  table.on('toolbar(test)', function(obj){
			    var url=$('#url').val();
			    if(obj.event=='getCheckData'){
			    	 layer.open({
			      	  	type:2,
			      	  	title:'部署流程定义',
			      	  	area: ['50%','60%'],
			      		shadeClose: false,
			      		resize:false,
			      	    anim: 1,
			      	  	content:[url+"processDefinition/initDeploy.do",'yes']
			    	  });
			    }
			  });
			 
			//监听行工具事件
			  table.on('tool(test)', function(obj){
			    var data = obj.data;
			    var url=$('#url').val();
			    var key=data.KEY_;
			    var form=document.getElementById('form');
			  	var pdId=data.ID_;
			    //console.log(obj)
			    if(obj.event === 'del'){
			    	 layer.confirm('您确定要删除该流程定义吗？', {
						  btn: ['确定','取消'], //按钮
						  title:'提示'},function(index){
							//删除部门
							  form.action=url+"processDefinition/deleteProcessDefinition.do?key="+key;
							  form.submit();
							  return;
						  }
					  );
			    } else if(obj.event === 'detail'){
			    	layer.open({
			     	  	type:2,
			     	  	title:'流程图',
			     	  	area: ['100%','100%'],
			     		shadeClose: false,
			      		resize:false,
			      	    anim: 1,
			     	  	content:[url+"processDefinition/showPng.do?pdId="+pdId,'yes']
			   	  	});
			    }
			  });
		});
	</script>
</body>
</html>
