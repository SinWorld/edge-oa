<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>标签维护列表</title>
<link rel="stylesheet" href="../layui-v2.4.5/layui/css/layui.css">
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@page isELIgnored="false" %>
</head>
<body>
	<form class="layui-form" action="" style="margin-top: 10px;">
	 <div class="demoTable" style="background-color: #CAE1FF;height:40px;" id="gjssq">
		 <div class="layui-form-item" style="width:1280px;height:auto;padding:0px; margin:0 auto;" id="main"">
			 <div class="layui-form-item">
			    <div class="layui-inline" style="left: -25px;">
				      <label class="layui-form-label" style="width:120px;">标签编号</label>
				      <div class="layui-input-inline" style="width: 205px;">
					     <input type="text" name="bqwhbh" lay-verify="bqwhbh" autocomplete="off" class="layui-input" style="width:200px;" id="bqwhbh">
					  </div>
				 </div>
				 
				<div class="layui-inline" style="left: -25px;">
				      <label class="layui-form-label" style="width:120px;">标签代号</label>
				      <div class="layui-input-inline" style="width:205px;">
					     <input type="text" name="bqwhdh" lay-verify="bqwhdh" autocomplete="off" class="layui-input" style="width:200px;" id="bqwhdh">
					  </div>
				 </div>
				 
				 <div class="layui-inline" style="left: -25px;">
				      <label class="layui-form-label" style="width:120px;">标签名称</label>
				      <div class="layui-input-inline" style="width:205px;">
					     <input type="text" name="bqwhmc" lay-verify="bqwhmc" autocomplete="off" class="layui-input" style="width:200px;" id="bqwhmc">
					  </div>
				 </div>
				 
				<button class="layui-btn" data-type="reload" type="button" id="do_search" style="margin-top: -5px;">搜索</button>
				<button type="reset" class="layui-btn layui-btn-primary" style="margin-top: -5px;margin-right: -187px;">重置</button>
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
    <button class="layui-btn layui-btn-sm" lay-event="getCheckData" type="button" id="add">+新增标签维护</button>
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
layui.use(['form','table','laydate'], function(){
  var table = layui.table;
  var url=$('#url').val();
  var laydate = layui.laydate;
  var form = layui.form;
  $('#gjssq').hide();
  
  table.render({
    elem: '#test'
    ,url:url+'bqwh/bqwhList.do'
    ,toolbar: '#toolbarDemo'
    ,title: '标签维护'
    ,cols: [[
       {field:'index', width:"8%", title: '序号', sort: true,type:'numbers'}
      ,{field:'bqwhbh', width:"13%",align:'center', title: '标签编号'}
      ,{field:'bqwhdh', width:"14%", align:'center', title: '标签代号'}
      ,{field:'bqwhmc', width:"50%", align:'center', title: '标签名称'}
      ,{fixed: 'right', title:'操作', toolbar: '#barDemo', width:"15%",align:'center'}
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
         	  	title:'新增标签维护',
         	  	area: ['100%','100%'],
         		shadeClose: false,
         		resize:false,
         	    anim: 1,
         	  	content:[url+"bqwh/initSaveBqwh.do",'yes']
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
    var bqwhdm=data.bqwhdm;
   	if(obj.event === 'edit'){
   		layer.open({
        	  	type:2,
        	  	title:'编辑标签维护',
        	  	area: ['100%','100%'],
        		shadeClose: false,
         		resize:false,
         	    anim: 1,
        	  	content:[url+"bqwh/initEditBqwh.do?bqwhdm="+bqwhdm,'yes']
      	  	});
    }else if(obj.event==='del'){
    	layer.confirm('您确定要删除该数据吗？', {
			  btn: ['确定','取消'], //按钮
			  title:'提示'},function(index){
				  $.ajax({
			    		type : "post",
			    		url : "<c:url value='/bqwh/deleteBqwhById.do'/>",
			    		async : false,
			    		dataType : 'json',
			    		data:{"bqwhdm":bqwhdm},
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
	  	  	content:[url+"bqwh/bqwhShow.do?bqwhdm="+bqwhdm,'yes']
		  });
    }
  });
  
  
  //执行搜索，表格重载
  $('#do_search').on('click', function () {
      // 搜索条件
      var bqwhbh=$('#bqwhbh').val();//标签编号
   	  var bqwhdh=$('#bqwhdh').val();//标签代号
      var bqwhmc=$('#bqwhmc').val();//标签名称
      table.reload('testReload', {
          method: 'post'
          , where: {
              'bqwhbh': bqwhbh,
              'bqwhdh':bqwhdh,
              'bqwhmc':bqwhmc
          }
          , page: {
              curr: 1
          }
      });
  });
  
  initKh(form);
});

	//ajax初始化客户
	function initKh(form) {
		$.ajax({
			type : "post",
			url : "<c:url value='/hyjy/queryAllKh.do'/>",
			async : false,
			dataType : 'json',
			error : function() {
				alert("出错");
			},
			success : function(msg) {
				for (var i = 0; i < msg.length; i++) {
						$("#kehudm").append(
						    "<option value='"+msg[i].khdm+"'>"+ msg[i].khmc +"</option>"); 
				}
				form.render('select');
			}
		});
	}
</script>
</body>
</html>