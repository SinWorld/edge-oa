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
	 <div class="demoTable" style="background-color: #CAE1FF;height:160px;" id="gjssq">
		 <div class="layui-form-item" style="width:1280px;height:auto;padding:0px; margin:0 auto;" id="main"">
			 <div class="layui-form-item">
			    <div class="layui-inline" style="left: -25px;">
				      <label class="layui-form-label" style="width:120px;">开发项目代号</label>
				      <div class="layui-input-inline" style="width: 205px;">
					     <input type="text" name="kfxm_dh" lay-verify="kfxm_dh" autocomplete="off" class="layui-input" style="width:200px;" id="kfxm_dh">
					  </div>
				 </div>
				 
				 <div class="layui-inline" style="left: -25px;">
				      <label class="layui-form-label" style="width:120px;">开发项目名称</label>
				      <div class="layui-input-inline" style="width: 205px;">
					     <input type="text" name="kfxm_mc" lay-verify="kfxm_mc" autocomplete="off" class="layui-input" style="width:200px;" id="kfxm_mc">
					  </div>
				 </div>
				 
				   <div class="layui-inline" style="width: 25.5%;left:14px;">
					  	<label class="layui-form-label">项目阶段</label>
						<div class="layui-input-inline" style="text-align: left;width: 200px;">
							<select name="kfxm_xmjd" id="kfxm_xmjd" lay-filter="kfxm_xmjd" lay-verify="kfxm_xmjd">
								<option value="" selected="selected">请选择项目阶段</option>
							</select>
						</div>
					 </div>
				
				</div> 
				
				
				<div class="layui-form-item">
				 
					  <div class="layui-inline" style="width: 25.5%;left:14px;">
					  	<label class="layui-form-label">项目状态</label>
						<div class="layui-input-inline" style="text-align: left;width: 200px;">
							<select name="kfxm_xmzt" id="kfxm_xmzt" lay-filter="kfxm_xmzt" lay-verify="kfxm_xmzt">
								<option value="" selected="selected">请选择项目状态</option>
							</select>
						</div>
					 </div>
				 
					  <div class="layui-inline" style="width: 25.5%;left:53px;">
					  	<label class="layui-form-label">客户</label>
						<div class="layui-input-inline" style="text-align: left;width: 200px;">
							<select name="kfxm_kh" id="kfxm_kh" lay-filter="kfxm_kh" lay-verify="kfxm_kh">
								<option value="" selected="selected">请选择客户</option>
							</select>
						</div>
					 </div>
				 
					   <div class="layui-inline" style="width: 25.5%;left:92px;">
					  	<label class="layui-form-label">签约主体</label>
						<div class="layui-input-inline" style="text-align: left;width: 200px;">
							<select name="kfxm_qyzt" id="kfxm_qyzt" lay-filter="kfxm_qyzt" lay-verify="kfxm_qyzt">
								<option value="" selected="selected">请选择签约主体</option>
							</select>
						</div>
					 </div>
				 
				</div>
				
				<div class="layui-form-item">
				
					<div class="layui-inline" style="left: -25px;">
				      <label class="layui-form-label" style="width:120px;">项目描述</label>
				      <div class="layui-input-inline" style="width: 205px;">
					     <input type="text" name="kfxm_xmms" lay-verify="kfxm_xmms" autocomplete="off" class="layui-input" style="width:200px;" id="kfxm_xmms">
					  </div>
				    </div>
					
				 <button class="layui-btn" data-type="reload" type="button" id="do_search" style="margin-left:125px;margin-top:-3px;">搜索</button>
				 <button type="reset" class="layui-btn layui-btn-primary" style="margin-top:-6px;margin-left:50px;">重置</button>
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
    <button class="layui-btn layui-btn-sm" lay-event="getCheckData" type="button" id="add">+新增开发项目</button>
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
  //日期
  laydate.render({
    elem: '#time1'
  });
  laydate.render({
	elem: '#time2'
  });
 
  table.render({
    elem: '#test'
    ,url:url+'kfxm/kfxmList.do'
    ,toolbar: '#toolbarDemo'
    ,title: '开发项目'
    ,cols: [[
       {field:'index', width:"8%", title: '序号', sort: true,type:'numbers'}
      ,{field:'kfxm_dh', width:"10%",align:'center', title: '开发项目代号'}
      ,{field:'kfxm_mc', width:"10%", align:'center', title: '开发项目名称'}
      ,{field:'xmjdmc', width:"10%", align:'center', title: '项目阶段'}
      ,{field:'xmztmc', width:"10%", align:'center', title: '项目状态'}
      ,{field:'khmc', width:"10%", align:'center', title: '客户'}
      ,{field:'qyztmc', width:"10%", align:'center', title: '签约主体'}
      ,{field:'kfxm_xmms', width:"20%", align:'center', title: '项目描述'}
      ,{fixed: 'right', title:'操作', toolbar: '#barDemo', width:"12%",align:'center'}
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
         	  	title:'新增开发项目',
         	  	area: ['100%','100%'],
         		shadeClose: false,
         		resize:false,
         	    anim: 1,
         	  	content:[url+"kfxm/initSaveKFXM.do",'yes']
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
    var kfxm_dm=data.kfxm_dm;
   	if(obj.event === 'edit'){
   		layer.open({
        	  	type:2,
        	  	title:'编辑开发项目',
        	  	area: ['100%','100%'],
        		shadeClose: false,
         		resize:false,
         	    anim: 1,
        	  	content:[url+"kfxm/initEditKFXM.do?kfxm_dm="+kfxm_dm,'yes']
      	  	});
    }else if(obj.event==='del'){
    	layer.confirm('您确定要删除该数据吗？', {
			  btn: ['确定','取消'], //按钮
			  title:'提示'},function(index){
				  $.ajax({
			    		type : "post",
			    		url : "<c:url value='/kfxm/deleteKFXMById.do'/>",
			    		async : false,
			    		dataType : 'json',
			    		data:{"kfxm_dm":kfxm_dm},
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
	  	  	content:[url+"kfxm/kfxmShow.do?kfxm_dm="+kfxm_dm,'yes']
		  });
    }
  });
  
  
  //执行搜索，表格重载
  $('#do_search').on('click', function () {
      // 搜索条件
      var kfxm_dh=$('#kfxm_dh').val();//开发项目代号
   	  var kfxm_mc=$('#kfxm_mc').val();//开发项目名称
      var kfxm_xmjd=$('#kfxm_xmjd').val();//项目阶段
      var kfxm_xmzt=$('#kfxm_xmzt').val();//项目状态
      var kfxm_kh=$('#kfxm_kh').val();//客户
      var kfxm_qyzt=$('#kfxm_qyzt').val();//签约主体
      var kfxm_xmms=$('#kfxm_xmms').val();//项目描述
      table.reload('testReload', {
          method: 'post'
          , where: {
              'kfxm_dh': kfxm_dh,
              'kfxm_mc':kfxm_mc,
              'kfxm_xmjd':kfxm_xmjd,
              'kfxm_xmzt':kfxm_xmzt,
              'kfxm_kh':kfxm_kh,
              'kfxm_qyzt':kfxm_qyzt,
              'kfxm_xmms':kfxm_xmms
          }
          , page: {
              curr: 1
          }
      });
  });
  
  reloadKh(form);
  reloadXMJD(form);
  reloadXMZT(form);
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
						$("#kfxm_kh").append(
								"<option value='"+msg[i].khdm+"'>"+ msg[i].khmc +"</option>");
					}
					form.render('select');
				}
			});
	}
	
	
	 //ajax加载所有的项目阶段
	  function reloadXMJD(form){
			$.ajax({
				type : "post",
				url : "<c:url value='/kfxm/queryAllXMJD.do'/>",
				async : false,
				dataType : 'json',
				error : function() {
					alert("出错");
				},
				success : function(msg) {
					for (var i = 0; i < msg.length; i++) {
						$("#kfxm_xmjd").append(
								"<option value='"+msg[i].xmjd_dm+"'>"+ msg[i].xmjd_mc +"</option>");
					}
					form.render('select');
				}
			});
	  }
	

	 //ajax加载所有的项目状态
	  function reloadXMZT(form){
			$.ajax({
				type : "post",
				url : "<c:url value='/kfxm/queryAllXMZT.do'/>",
				async : false,
				dataType : 'json',
				error : function() {
					alert("出错");
				},
				success : function(msg) {
					for (var i = 0; i < msg.length; i++) {
						$("#kfxm_xmzt").append(
								"<option value='"+msg[i].xmzt_dm+"'>"+ msg[i].xmzt_mc +"</option>");
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
						$("#kfxm_qyzt").append(
								"<option value='"+msg[i].qyztdm+"'>"+ msg[i].qyztmc +"</option>");
					}
					form.render('select');
				}
			});
	  }
</script>
</body>
</html>