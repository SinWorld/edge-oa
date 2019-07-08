<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>首页</title>
<link rel="stylesheet" href="../layui-v2.4.5/layui/css/layui.css">
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@page isELIgnored="false"%>
</head>
<body>
<div class="layui-tab">
  <ul class="layui-tab-title">
    <li class="layui-this">待办 <span class="layui-badge">${dbCount}</span></li>
    <li>已完成</li>
    
  </ul>
  <div class="layui-tab-content">
    <div class="layui-tab-item layui-show">
    	<input type="hidden" value='<c:url value="/"/>' id="url">
     	<table class="layui-hide" id="db" lay-filter="db"></table>
    </div>
   
    <div class="layui-tab-item">
    	<table class="layui-hide" id="ywc" lay-filter="ywc"></table>
    </div>
   
  </div>
</div>
<!--  <script type="text/html" id="dbcz">
  <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="show" name="defaultAD" >查看</a>
</script>-->
<script src="../jquery/jquery-3.3.1.js"></script>
<script src="../layui-v2.4.5/layui/layui.js"></script>
<script  type="text/javascript">
//注意：选项卡 依赖 element 模块，否则无法进行功能性操作
layui.use(['element','form','table'], function(){
  var element = layui.element;
  var table = layui.table;
  var url=$('#url').val();
  var form = layui.form;
  table.render({
    elem: '#db'
    ,url:url+'index/myTaskList.do'
    ,title: '我的待办'
    ,cols: [[
       {field:'index', width:"8%", title: '序号', sort: true,type:'numbers'}
      ,{field:'taskDecription', width:"55%", title: '待办任务描述'}
      ,{field:'ASSIGNEE_', width:"15%", align:'center', title: '办理人'}
      ,{field:'startTime', width:"22%", align:'center', title: '创建日期'}
    /*   ,{fixed: 'right', title:'操作', toolbar: '#dbcz', width:"10%",align:'center'} */
    ]]
    ,page: true
  });
  //…
  table.render({
	    elem: '#ywc'
	    ,url:url+'index/taskListYWC.do'
	    ,title: '已完成'
	    ,cols: [[
	       {field:'index', width:"8%", title: '序号', sort: true,type:'numbers'}
	       ,{field:'taskDecription', width:"42%", title: '已完成任务描述'}
	       ,{field:'ASSIGNEE_', width:"10%", align:'center', title: '发起人'}
	       ,{field:'beginTime', width:"20%", align:'center', title: '创建日期'}
	      ,{field:'endTime', width:"20%", align:'center', title: '结束日期'}
	    ]]
	    ,page: true
	  });
  
  //我的代办 监听行工具事件
  table.on('row(db)', function(obj){
    var data = obj.data;
    var url=$('#url').val();
    var id=data.ID_;
    //console.log(obj)
	$.ajax({  
	    type: "post",  
	    url:  "<c:url value='/index/querObjId.do'/>",
	    dataType: 'json',
	    async:false,
	    data:{"task_id":id},
	    error:function(){
	    	alert("出错");
	    },
	    success: function (data) {
	    	var obj=data.obj;//获得数据对像类型
	    	if(obj=='Foll_up_Proj'){
	    		layer.open({
		       	  	type:2,
		       	  	title:'任务信息',
		       	  	area: ['100%','100%'],
		       		shadeClose: false,
		       		resize:false,
		       	    anim: 1,
		       	  	content:[url+"approveproj/approveprojShow.do?id="+data.id+"&task_id="+data.taskId,'yes']
	     	  });
	    	}else if(obj=='XiaoShouHT'){
	    		layer.open({
		       	  	type:2,
		       	  	title:'任务信息',
		       	  	area: ['100%','100%'],
		       		shadeClose: false,
		       		resize:false,
		       	    anim: 1,
		       	  	content:[url+"xshtdj/xshtdjShow.do?id="+data.id+"&task_id="+data.taskId,'yes']
	     	  });
	    	}else if(obj=='Reimbursement'){
	    		layer.open({
		       	  	type:2,
		       	  	title:'任务信息',
		       	  	area: ['100%','100%'],
		       		shadeClose: false,
		       		resize:false,
		       	    anim: 1,
		       	  	content:[url+"bxtb/reimburseShow.do?id="+data.id+"&task_id="+data.taskId,'yes']
	     	  });
	    	}
	    }  
	});
	  
  });
  
  //已完成办 监听行工具事件
  table.on('row(ywc)', function(obj){
    var data = obj.data;
    var url=$('#url').val();
    var id=data.BUSINESS_KEY_;
    //历史流程实例Id
    var proIndeId=data.ID_;
    //流程部署Id
    var PROC_DEF_ID_=data.PROC_DEF_ID_;
    //console.log(obj)
	//查看业务数据
	  $.ajax({  
		    type: "post",  
		    url:  "<c:url value='/index/querywcObjId.do'/>",
		    dataType: 'json',
		    async:false,
		    data:{"task_id":id,"proIndeId":proIndeId,"PROC_DEF_ID_":PROC_DEF_ID_},
		    error:function(){
		    	alert("出错");
		    },
		    success: function (data) {  
		    	if(data.obj=='Foll_up_Proj'){
			    	 layer.open({
				       	  	type:2,
				       	  	title:'业务数据',
				       	  	area: ['100%','100%'],
				       		shadeClose: false,
				       		resize:false,
				       	    anim: 1,
				       	  	content:[url+"approveproj/ObjYWCShow.do?id="+data.id+"&proIndeId="+data.proIndeId+"&PROC_DEF_ID_="+data.PROC_DEF_ID_,'yes']
			     	  });
		    	}else if(data.obj=='XiaoShouHT'){
		    		layer.open({
			       	  	type:2,
			       	  	title:'任务信息',
			       	  	area: ['100%','100%'],
			       		shadeClose: false,
			       		resize:false,
			       	    anim: 1,
			       	 	content:[url+"xshtdj/ObjYWCShow.do?id="+data.id+"&proIndeId="+data.proIndeId+"&PROC_DEF_ID_="+data.PROC_DEF_ID_,'yes']
		     	  });
		    	}else if(data.obj=='Reimbursement'){
		    		layer.open({
			       	  	type:2,
			       	  	title:'任务信息',
			       	  	area: ['100%','100%'],
			       		shadeClose: false,
			       		resize:false,
			       	    anim: 1,
			       	 	content:[url+"bxtb/ObjYWCShow.do?id="+data.id+"&proIndeId="+data.proIndeId+"&PROC_DEF_ID_="+data.PROC_DEF_ID_,'yes']
		     	  });
		    	}  
		    }
		});
  });
});
</script>
</body>
</html>