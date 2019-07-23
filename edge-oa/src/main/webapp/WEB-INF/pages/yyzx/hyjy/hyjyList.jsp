<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>会议纪要列表</title>
<link rel="stylesheet" href="../layui-v2.4.5/layui/css/layui.css">
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@page isELIgnored="false" %>
</head>
<body>
	<form class="layui-form" action="" style="margin-top: 10px;">
	 <div class="demoTable" style="background-color: #CAE1FF;height: 110px;" id="gjssq">
		 <div class="layui-form-item" style="width:1280px;height:auto;padding:0px; margin:0 auto;" id="main"">
			 <div class="layui-form-item">
			    <div class="layui-inline" style="left: -25px;">
				      <label class="layui-form-label" style="width:120px;">会议纪要代号</label>
				      <div class="layui-input-inline" style="width: 205px;">
					     <input type="text" name="khdh" lay-verify="khdh" autocomplete="off" class="layui-input" style="width:200px;" id="khdh">
					  </div>
				 </div>
				 
				<div class="layui-inline" style="left: -25px;">
				      <label class="layui-form-label" style="width:120px;">会议纪要代号</label>
				      <div class="layui-input-inline" style="width:205px;">
					     <input type="text" name="khjc" lay-verify="khjc" autocomplete="off" class="layui-input" style="width:200px;" id="khjc">
					  </div>
				 </div>
				 <button class="layui-btn" data-type="reload" type="button" id="do_search">搜索</button>
		 	</div>
			
		 	<div class="layui-form-item">
				 <div class="layui-inline" style="left: -25px;">
				      <label class="layui-form-label" style="width: 120px;">客户名称</label>
				      <div class="layui-input-inline" style="width:205px;">
					     <input type="text" name="khmc" lay-verify="khmc" autocomplete="off" class="layui-input" style="width:200px;" id="khmc">
					  </div>
				 </div>
				 
				<div class="layui-inline" style="left: -25px;">
				      <label class="layui-form-label" style="width:120px;">客户描述</label>
				      <div class="layui-input-inline" style="width:205px;">
					     <input type="text" name="khms" lay-verify="khms" autocomplete="off" class="layui-input" style="width:200px;" id="khms">
					  </div>
				 </div>
				 	<button type="reset" class="layui-btn layui-btn-primary">重置</button>
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
  <div class="layui-btn-container">
    <button class="layui-btn layui-btn-sm" lay-event="getCheckData" type="button" id="add">+新增会议纪要</button>
 	<button class="layui-btn layui-btn-sm" lay-event="gjss" type="button">高级搜索</button>
  </div>
</script>
 
<script type="text/html" id="barDemo">
  <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
  <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
  <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail">查看</a>
</script>
              
          
<script src="../layui-v2.4.5/layui/layui.js" charset="utf-8"></script>
<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 --> 
 <script type="text/javascript" src="../jquery/jquery-3.3.1.js"></script>
<script>
layui.use(['form','table'], function(){
  var table = layui.table;
  var url=$('#url').val();
  var form = layui.form;
  $('#gjssq').hide();
  table.render({
    elem: '#test'
    ,url:url+'hyjy/hyjyList.do'
    ,toolbar: '#toolbarDemo'
    ,title: '会议纪要'
    ,cols: [[
       {field:'index', width:"8%", title: '序号', sort: true,type:'numbers'}
      ,{field:'hyjydh', width:"10%",align:'center', title: '会议纪要代号'}
      ,{field:'hyzt', width:"13%", align:'center', title: '会议主题'}
      ,{field:'khmc', width:"14%", align:'center', title: '客户'}
      ,{field:'cyry', width:"14%", align:'center', title: '参与人员'}
      ,{field:'beginTime', width:"14%", align:'center', title: '开始时间',templet:'<div>{{ layui.util.toDateString(d.beginTime, "yyyy-MM-dd") }}</div>'}
      ,{field:'endTime', width:"14%", align:'center', title: '结束时间',templet:'<div>{{ layui.util.toDateString(d.endTime, "yyyy-MM-dd") }}</div>'}
      ,{fixed: 'right', title:'操作', toolbar: '#barDemo', width:"13%",align:'center'}
    ]]
    ,page: true
    ,id:'testReload'
  });
  
  //头工具栏事件
  table.on('toolbar(test)', function(obj){
    var url=$('#url').val();
    var flag=$('#flag').val();
   	if(obj.event=='getCheckData'){
       	 layer.open({
         	  	type:2,
         	  	title:'新增会议纪要',
         	  	area: ['100%','100%'],
         		shadeClose: false,
         		resize:false,
         	    anim: 1,
         	  	content:[url+"hyjy/initSaveHyjy.do",'yes']
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
  
  //监听行工具事件
  table.on('tool(test)', function(obj){
    var data = obj.data;
    var url=$('#url').val();
    var hyjydm=data.hyjydm;
   	if(obj.event === 'edit'){
   		layer.open({
        	  	type:2,
        	  	title:'编辑会议纪要',
        	  	area: ['100%','100%'],
        		shadeClose: false,
         		resize:false,
         	    anim: 1,
        	  	content:[url+"hyjy/queryHYJYById.do?hyjydm="+hyjydm,'yes']
      	  	});
    }else if(obj.event==='del'){
    	layer.confirm('您确定要删除该会议纪要吗？', {
			  btn: ['确定','取消'], //按钮
			  title:'提示'},function(index){
				  $.ajax({
			    		type : "post",
			    		url : "<c:url value='/hyjy/deleteHyjyById.do'/>",
			    		async : false,
			    		dataType : 'json',
			    		data:{"hyjydm":hyjydm},
			    		error : function() {
			    			alert("出错");
			    		},
			    		success : function(data) {
			    			if(data.flag){
					    		layer.close(index);
					    		window.location.reload();
			    		}
			    	}
			  });
	    });
	}else if(obj.event==='detail'){
	   	 layer.open({
	  	  	type:2,
	  	  	title:'查看',
	  	  	area: ['100%','100%'],
	  		shadeClose: false,
	  		resize:false,
	  	    anim: 1,
	  	  	content:[url+"hyjy/hyjyShowById.do?hyjydm="+hyjydm,'yes']
		  });
    }
  });
  
  
  //执行搜索，表格重载
  $('#do_search').on('click', function () {
      // 搜索条件
      var khdh=$('#khdh').val();//客户代号
   	  var khjc=$('#khjc').val();//客户简称
      var khmc=$('#khmc').val();//客户名称
      var khms=$('#khms').val();//客户描述
      table.reload('testReload', {
          method: 'post'
          , where: {
              'khdh': khdh,
              'khjc':khjc,
              'khmc':khmc,
              'khms':khms
          }
          , page: {
              curr: 1
          }
      });
  });
 
});
</script>
</body>
</html>