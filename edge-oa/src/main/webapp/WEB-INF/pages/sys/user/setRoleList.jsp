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
<body onload="refreshAndClose()">
<form id="form" method="post">
	<input type="hidden" value='<c:url value="/"/>' id="url">
	<input type="hidden" id="selectId" value="" name="selectId">
	<input type="hidden" id="userId" value="${user_id}" name="userId">
	<input type="hidden" id="flag" value="${flag}">
	<!-- <div class="layui-btn-group demoTable">
  		<button class="layui-btn" data-type="getCheckData" type="button">提交</button>
	</div> -->
	<table class="layui-hide" id="test" lay-filter="test"></table>
 </form>
<script type="text/html" id="toolbarDemo">
    <div class="layui-btn-container">
     	<button class="layui-btn layui-btn-sm" lay-event="getCheckData" type="button">提交</button>
    </div>
</script>
 
<script src="../layui-v2.4.5/layui/layui.js" charset="utf-8"></script>
<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 --> 
 <script type="text/javascript" src="../jquery/jquery-3.3.1.js"></script>
<script>
layui.use(['table','form'], function(){
  var table = layui.table;
  var $ = layui.$;
  var url=$('#url').val();
  var form= layui.form;
  table.render({
    elem: '#test'
    ,url:url+'role/roleList.do'
    ,title: '角色管理'
    ,cols: [[
       {type:'checkbox',width:"10%"}
      ,{field:'index', width:"8%", title: '序号', sort: true,type:'numbers'}
      ,{field:'role_name', width:"22%",align:'center', title: '角色名称'}
      ,{field:'role_infor', width:"60%", align:'center', title: '角色说明'}
    ]]
    ,page: true
    ,id:'idTest'
    ,toolbar: '#toolbarDemo'
	,done: function(res, curr, count){
 	    //如果是异步请求数据方式，res即为你接口返回的信息。
 	    //如果是直接赋值的方式，res即为：{data: [], count: 99} data为当前页数据、count为数据总长度
 	   //ajax请求后台获取当前用户的所有角色
 	   var userId=$('#userId').val();
 	   $.ajax({
   				url : "<c:url value='/userRole/checkedUserRole.do'/>",
   				type : "post",
   				dataType : 'json',
   				async : false,
   				data : {
   					"userId" : userId
   				},
   				error : function() {
   					alert("出错");
   				},
   				success : function(data) {
   					//遍历结果集
   					for(var i=0;i<data.length;i++){
   						//取出结果集中所有的角色主键
   						var roleId=data[i].roleId;
   					 	//遍历res中的结果集
   				 	    for(var j=0;j<res.data.length;j++){
   				 	    	//取出表格数据中所有的角色主键
   				 	    	var id=res.data[j].role_id;
   				 	    	//若结果集中的主键等于数据表格中的主键值则设置复选框为选中
   				 	    	if(roleId==id){
   				 	    	$('input[name="layTableCheckbox"]')[j+1].checked=true;
				 	    		
   				 	    	}
   				 	    } 
   					}
   					form.render();
   				}
   			});
 	   
 	    
 	    //得到当前页码
 	    console.log(curr); 
 	    
 	    //得到数据总量
 	    console.log(count);
 	  }
  });
	/* active = {
	   getCheckData: function(){ //获取选中数据
	     var checkStatus = table.checkStatus('idTest');
	     var data = checkStatus.data;
	     var form=document.getElementById('form');
	  	 //用于存储所有选中状态的数据主键
		 var selectId=$('#selectId').val();
	     //layer.alert(JSON.stringify(data));
	     //遍历选中结果集
	     for(var i=0;i<data.length;i++){
	    	//得到所有的选中状态数据的主键 用于拼接在字符串中
			 if(undefined!=selectId){
				//获取角色主键
				 var roleId=data[i].role_id;
					 selectId=selectId+","+roleId;
			 }else{
					selectId=roleId;
			 }
	     }
	     $('#selectId').val(selectId);
			var ids=$('#selectId').val()
			var roleId=ids.substring(1,ids.length);
			$('#selectId').val(roleId);
			//提交表单
			form.action=url+"userRole/setUserRole.do";
			form.submit();
	   }
   }; */
	/*  $('.demoTable .layui-btn').on('click', function(){
	   var type = $(this).data('type');
	   active[type] ? active[type].call(this) : '';
	 }); */
	 
	 //头工具栏事件
	    table.on('toolbar(test)', function(res){
	    	 var checkStatus = table.checkStatus(res.config.id);
	    	 var data=checkStatus.data;
	    	 var form=document.getElementById('form');
	 	  	 //用于存储所有选中状态的数据主键
	 		 var selectId=$('#selectId').val();
	 	     //layer.alert(JSON.stringify(data));
	 	     //遍历选中结果集
	 	     for(var i=0;i<data.length;i++){
	 	    	//得到所有的选中状态数据的主键 用于拼接在字符串中
	 			 if(undefined!=selectId){
	 				//获取角色主键
	 				 var roleId=data[i].role_id;
	 					 selectId=selectId+","+roleId;
	 			 }else{
	 					selectId=roleId;
	 			 }
	 	     }
	 	     $('#selectId').val(selectId);
	 			var ids=$('#selectId').val()
	 			var roleId=ids.substring(1,ids.length);
	 			$('#selectId').val(roleId);
	 			//提交表单
	 			form.action=url+"userRole/setUserRole.do";
	 			form.submit();
	    });
	 
});

function refreshAndClose(){
	var flag=$('#flag').val();
	if(flag){
		window.parent.location.reload();
		window.close();
	}
}
</script>
</body>
</html>