<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>开发项目列表</title>
<link rel="stylesheet" href="../layui-v2.4.5/layui/css/layui.css">
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@page isELIgnored="false" %>
</head>
<body>
	<form class="layui-form" action="" style="margin-top: 10px;">
	 <div class="demoTable" style="background-color: #CAE1FF;height:110px;" id="gjssq">
		 <div class="layui-form-item" style="width:1280px;height:auto;padding:0px; margin:0 auto;" id="main"">
			 <div class="layui-form-item">
			 
			    <div class="layui-inline" style="left: -25px;">
				      <label class="layui-form-label" style="width:120px;">售后项目代号</label>
				      <div class="layui-input-inline" style="width: 205px;">
					     <input type="text" name="shxm_dh" lay-verify="shxm_dh" autocomplete="off" class="layui-input" style="width:200px;" id="shxm_dh">
					  </div>
				 </div>
				 
				 <div class="layui-inline" style="left: -25px;">
				      <label class="layui-form-label" style="width:120px;">售后项目名称</label>
				      <div class="layui-input-inline" style="width: 205px;">
					     <input type="text" name="shxm_mc" lay-verify="shxm_mc" autocomplete="off" class="layui-input" style="width:200px;" id="shxm_mc">
					  </div>
				 </div>
				 
				 <div class="layui-inline" style="width: 25.5%;left:14px;">
				  	<label class="layui-form-label">客户</label>
					<div class="layui-input-inline" style="text-align: left;width: 200px;">
						<select name="shxm_kh" id="shxm_kh" lay-filter="shxm_kh" lay-verify="shxm_kh">
							<option value="" selected="selected">请选择客户</option>
						</select>
					</div>
				</div>
				
			</div> 
				
				
				<div class="layui-form-item">
				 
				  <div class="layui-inline" style="width: 25.5%;left:14px;">
				  	<label class="layui-form-label">签约主体</label>
					<div class="layui-input-inline" style="text-align: left;width: 200px;">
						<select name="shxm_qyzt" id="shxm_qyzt" lay-filter="shxm_qyzt" lay-verify="shxm_qyzt">
							<option value="" selected="selected">请选择签约主体</option>
						</select>
					</div>
				  </div>
					 
				  <div class="layui-inline" style="left:14px;">
				      <label class="layui-form-label" style="width:120px;">项目描述</label>
				      <div class="layui-input-inline" style="width: 205px;">
					     <input type="text" name="shxm_ms" lay-verify="shxm_ms" autocomplete="off" class="layui-input" style="width:200px;" id="shxm_ms">
					  </div>
			      </div>
				    
				 <button class="layui-btn" data-type="reload" type="button" id="do_search" style="margin-left:164px;margin-top:-3px;">搜索</button>
				 <button type="reset" class="layui-btn layui-btn-primary" style="margin-top:-2px;margin-left:50px;">重置</button>
				 
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
    <button class="layui-btn layui-btn-sm" lay-event="getCheckData" type="button" id="add">+新增售后项目</button>
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
    ,url:url+'shxm/shxmList.do'
    ,toolbar: '#toolbarDemo'
    ,title: '售后项目'
    ,cols: [[
       {field:'index', width:"8%", title: '序号', sort: true,type:'numbers'}
      ,{field:'shxm_dh', width:"11%",align:'center', title: '售后项目代号'}
      ,{field:'shxm_mc', width:"12%", align:'center', title: '售后项目名称'}
      ,{field:'khmc', width:"12%", align:'center', title: '客户'}
      ,{field:'qyztmc', width:"12%", align:'center', title: '签约主体'}
      ,{field:'shxm_ms', width:"30%", align:'center', title: '项目描述'}
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
         	  	title:'新增售后项目',
         	  	area: ['100%','100%'],
         		shadeClose: false,
         		resize:false,
         	    anim: 1,
         	  	content:[url+"shxm/initSaveSHXM.do",'yes']
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
    var shxm_dm=data.shxm_dm;
   	if(obj.event === 'edit'){
   		layer.open({
        	  	type:2,
        	  	title:'编辑售后项目',
        	  	area: ['100%','100%'],
        		shadeClose: false,
         		resize:false,
         	    anim: 1,
        	  	content:[url+"shxm/initEditSHXM.do?shxm_dm="+shxm_dm,'yes']
      	  	});
    }else if(obj.event==='del'){
    	layer.confirm('您确定要删除该数据吗？', {
			  btn: ['确定','取消'], //按钮
			  title:'提示'},function(index){
				  $.ajax({
			    		type : "post",
			    		url : "<c:url value='/shxm/deleteSHXMById.do'/>",
			    		async : false,
			    		dataType : 'json',
			    		data:{"shxm_dm":shxm_dm},
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
	    parent.layer.open({
	  	  	type:2,
	  	  	title:'查看',
	  	  	area: ['100%','100%'],
	  		shadeClose: false,
	  		resize:false,
	  	    anim: 1,
	  	  	content:[url+"shxm/shxmShow.do?shxm_dm="+shxm_dm,'yes']
		  });
    }
  });
  
  
  //执行搜索，表格重载
  $('#do_search').on('click', function () {
      // 搜索条件
      var shxm_dh=$('#shxm_dh').val();//售后项目代号
   	  var shxm_mc=$('#shxm_mc').val();//售后项目名称
      var shxm_kh=$('#shxm_kh').val();//客户
      var shxm_qyzt=$('#shxm_qyzt').val();//签约主体
      var shxm_ms=$('#shxm_ms').val();//项目描述
      table.reload('testReload', {
          method: 'post'
          , where: {
              'shxm_dh': shxm_dh,
              'shxm_mc':shxm_mc,
              'shxm_kh':shxm_kh,
              'shxm_qyzt':shxm_qyzt,
              'shxm_ms':shxm_ms
          }
          , page: {
              curr: 1
          }
      });
  });
  
  reloadKh(form);
  reloadQYZT(form);
});

	//ajax加载所有的客户
	function reloadKh(form){
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
						$("#shxm_kh").append(
								"<option value='"+msg[i].khdm+"'>"+ msg[i].khmc +"</option>");
					}
					form.render('select');
				}
			});
	}
	
	  //ajax加载所有的签约主体
	  function reloadQYZT(form){
			$.ajax({
				type : "post",
				url : "<c:url value='/kfxm/queryAllQYZT.do'/>",
				async : false,
				dataType : 'json',
				error : function() {
					alert("出错");
				},
				success : function(msg) {
					for (var i = 0; i < msg.length; i++) {
						$("#shxm_qyzt").append(
								"<option value='"+msg[i].qyztdm+"'>"+ msg[i].qyztmc +"</option>");
					}
					form.render('select');
				}
			});
	  }
</script>
</body>
</html>