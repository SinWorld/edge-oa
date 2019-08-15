<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>需求单列表</title>
<link rel="stylesheet" href="../layui-v2.4.5/layui/css/layui.css">
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@page isELIgnored="false" %>
</head>
<body>
	<form class="layui-form" action="" style="margin-top: 10px;">
	 <div class="demoTable" style="background-color: #CAE1FF;height:200px;" id="gjssq">
		 <div class="layui-form-item" style="width:1280px;height:auto;padding:0px; margin:0 auto;" id="main"">
			 <div class="layui-form-item">
			    <div class="layui-inline" style="left: -25px;">
				      <label class="layui-form-label" style="width:120px;">需求单号</label>
				      <div class="layui-input-inline" style="width: 205px;">
					     <input type="text" name="xqd_dh" lay-verify="xqd_dh" autocomplete="off" class="layui-input" style="width:200px;" id="xqd_dh">
					  </div>
				 </div>
				 
				 <div class="layui-inline" style="left: -25px;">
				      <label class="layui-form-label" style="width:120px;">需求名称</label>
				      <div class="layui-input-inline" style="width: 205px;">
					     <input type="text" name="xqd_mc" lay-verify="xqd_mc" autocomplete="off" class="layui-input" style="width:200px;" id="xqd_mc">
					  </div>
				 </div>
				 
				   <div class="layui-inline" style="width: 25.5%;left:14px;">
					  	<label class="layui-form-label">项目信息</label>
						<div class="layui-input-inline" style="text-align: left;width: 200px;">
							<select name="xqd_xmxx" id="xqd_xmxx" lay-filter="xqd_xmxx" lay-verify="xqd_xmxx">
								<option value="" selected="selected">请选择项目信息</option>
							</select>
						</div>
					 </div>
				
				</div> 
				
				
				<div class="layui-form-item">
				 
					  <div class="layui-inline" style="width: 25.5%;left:14px;">
					  	<label class="layui-form-label">所属系统</label>
						<div class="layui-input-inline" style="text-align: left;width: 200px;">
							<select name="xqd_ssxt" id="xqd_ssxt" lay-filter="xqd_ssxt" lay-verify="xqd_ssxt">
								<option value="" selected="selected">请选择所属系统</option>
							</select>
						</div>
					 </div>
				 
					  <div class="layui-inline" style="width: 25.5%;left:53px;">
					  	<label class="layui-form-label">需求类型</label>
						<div class="layui-input-inline" style="text-align: left;width: 200px;">
							<select name="xqd_xqlx" id="xqd_xqlx" lay-filter="xqd_xqlx" lay-verify="xqd_xqlx">
								<option value="" selected="selected">请选择需求类型</option>
							</select>
						</div>
					 </div>
				 
					   <div class="layui-inline" style="width: 25.5%;left:92px;">
					  	<label class="layui-form-label">负责人</label>
						<div class="layui-input-inline" style="text-align: left;width: 200px;">
							<select name="xqd_fzr" id="xqd_fzr" lay-filter="xqd_fzr" lay-verify="xqd_fzr">
								<option value="" selected="selected">请选择负责人</option>
							</select>
						</div>
					 </div>
				 
				</div>
				
				<div class="layui-form-item">
				
					<div class="layui-inline" style="width: 25.5%;left:15px;">
					  	<label class="layui-form-label">客户</label>
						<div class="layui-input-inline" style="text-align: left;width: 200px;">
							<select name="xqd_kh" id="xqd_kh" lay-filter="xqd_kh" lay-verify="xqd_kh">
								<option value="" selected="selected">请选择客户</option>
							</select>
						</div>
					 </div>
					 
					 <div class="layui-inline" style="width: 25.5%;left:54px;">
					  	<label class="layui-form-label">需求阶段</label>
						<div class="layui-input-inline" style="text-align: left;width: 200px;">
							<select name="xqd_xqjd" id="xqd_xqjd" lay-filter="xqd_xqjd" lay-verify="xqd_xqjd">
								<option value="" selected="selected">请选择需求阶段</option>
							</select>
						</div>
					 </div>
					 
					 <div class="layui-inline" style="width: 25.5%;left:92px;">
					  	<label class="layui-form-label">需求状态</label>
						<div class="layui-input-inline" style="text-align: left;width: 200px;">
							<select name="xqd_xqzt" id="xqd_xqzt" lay-filter="xqd_xqzt" lay-verify="xqd_xqzt">
								<option value="" selected="selected">请选择需求状态</option>
							</select>
						</div>
					 </div>
					 
					<div class="layui-inline" style="left:10px;width: 520px;">
					      <label class="layui-form-label" style="width:85px;">提出日期</label>
					      <div class="layui-input-inline">
					        <input type="text" name="time1" id="time1" lay-verify="time1" placeholder="yyyy-MM-dd" autocomplete="off" class="layui-input">
					      </div>
					       <i class="u-date_line" style="margin-left: -212px;line-height: 35px;">—</i>
					      <div class="layui-input-inline">
					        <input type="text" name="time2" id="time2" lay-verify="time2" placeholder="yyyy-MM-dd" autocomplete="off" class="layui-input">
					      </div>
				     </div>
					
				 <button class="layui-btn" data-type="reload" type="button" id="do_search" style="margin-left:350px;margin-top:-3px;">搜索</button>
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
    <button class="layui-btn layui-btn-sm" lay-event="getCheckData" type="button" id="add">+新增需求单</button>
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
    ,url:url+'xqd/xqdList.do'
    ,toolbar: '#toolbarDemo'
    ,title: '需求单'
    ,cols: [[
       {field:'index', width:"8%", title: '序号', sort: true,type:'numbers'}
      ,{field:'xqd_dh', width:"10%",align:'center', title: '需求单号'}
      ,{field:'xqd_mc', width:"10%", align:'center', title: '需求名称'}
      ,{field:'xmxxmc', width:"10%", align:'center', title: '项目信息'}
      ,{field:'ssxtmc', width:"10%", align:'center', title: '所属系统'}
      ,{field:'xqlxmc', width:"10%", align:'center', title: '需求类型'}
      ,{field:'fzrmc', width:"10%", align:'center', title: '负责人'}
      ,{field:'khmc', width:"15%", align:'center', title: '客户'}
      ,{field:'xqd_tcrq', width:"10%", align:'center', title: '提出日期',templet:'<div>{{ layui.util.toDateString(d.endTime, "yyyy-MM-dd") }}</div>'}
      ,{field:'xqjdmc', width:"10%", align:'center', title: '需求阶段'}
      ,{field:'xqztmc', width:"10%", align:'center', title: '需求状态'}
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
         	  	title:'新增需求单',
         	  	area: ['100%','100%'],
         		shadeClose: false,
         		resize:false,
         	    anim: 1,
         	  	content:[url+"xqd/initSaveXQD.do",'yes']
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
    var xqd_dm=data.xqd_dm;
   	if(obj.event === 'edit'){
   		layer.open({
        	  	type:2,
        	  	title:'编辑需求单',
        	  	area: ['100%','100%'],
        		shadeClose: false,
         		resize:false,
         	    anim: 1,
        	  	content:[url+"xqd/initEditXQD.do?xqd_dm="+xqd_dm,'yes']
      	  	});
    }else if(obj.event==='del'){
    	layer.confirm('您确定要删除该数据吗？', {
			  btn: ['确定','取消'], //按钮
			  title:'提示'},function(index){
				  $.ajax({
			    		type : "post",
			    		url : "<c:url value='/xqd/deleteXqd.do'/>",
			    		async : false,
			    		dataType : 'json',
			    		data:{"xqd_dm":xqd_dm},
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
	  	  	content:[url+"xqd/xqdShow.do?xqd_dm="+xqd_dm,'yes']
		  });
    }
  });
  
  
  //执行搜索，表格重载
  $('#do_search').on('click', function () {
      // 搜索条件
      var xqd_dh=$('#xqd_dh').val();//需求单号
   	  var xqd_mc=$('#xqd_mc').val();//需求名称
      var xqd_xmxx=$('#xqd_xmxx').val();//项目信息
      var xqd_ssxt=$('#xqd_ssxt').val();//所属系统
      var xqd_xqlx=$('#xqd_xqlx').val();//需求类型
      var xqd_fzr=$('#xqd_fzr').val();//负责人
      var xqd_kh=$('#xqd_kh').val();//客户
      var xqd_xqjd=$('#xqd_xqjd').val();//需求阶段
      var xqd_xqzt=$('#xqd_xqzt').val();//需求状态
      var time1=$('#time1').val();//提出日期
      var time2=$('#time2').val();//提出日期
      table.reload('testReload', {
          method: 'post'
          , where: {
              'xqd_dh': xqd_dh,
              'xqd_mc':xqd_mc,
              'xqd_xmxx':xqd_xmxx,
              'xqd_ssxt':xqd_ssxt,
              'xqd_xqlx':xqd_xqlx,
              'xqd_fzr':xqd_fzr,
              'xqd_kh':xqd_kh,
              'xqd_xqjd':xqd_xqjd,
              'xqd_xqzt':xqd_xqzt,
              'time1':time1,
              'time2':time2
          }
          , page: {
              curr: 1
          }
      });
  });
  
  reloadKh(form);
  reloadXMJD(form);
  reloadXMZT(form);
  reloadxmxx(form);
  reloadkhxt(form);
  reloadxqlx(form);
  reloadFZR(form);
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
						$("#xqd_kh").append(
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
						$("#xqd_xqjd").append(
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
						$("#xqd_xqzt").append(
								"<option value='"+msg[i].xmzt_dm+"'>"+ msg[i].xmzt_mc +"</option>");
					}
					form.render('select');
				}
			});
	  }
	
	  //ajax加载所有的项目信息
	  function reloadxmxx(form){
			$.ajax({
				type : "post",
				url : "<c:url value='/xqd/queryAllXMXX.do'/>",
				async : false,
				dataType : 'json',
				error : function() {
					alert("出错");
				},
				success : function(msg) {
					for (var i = 0; i < msg.length; i++) {
						$("#xqd_xmxx").append(
								"<option value='"+msg[i].xmxx_dm+"'>"+ msg[i].xmxx_mc +"</option>");
					}
					form.render('select');
				}
			});
	  }
	  
	  //ajax加载所有的客户系统
	  function reloadkhxt(form){
			$.ajax({
				type : "post",
				url : "<c:url value='/xqd/queryAllKHXT.do'/>",
				async : false,
				dataType : 'json',
				error : function() {
					alert("出错");
				},
				success : function(msg) {
					for (var i = 0; i < msg.length; i++) {
						$("#xqd_ssxt").append(
								"<option value='"+msg[i].khxt_dm+"'>"+ msg[i].khxt_mc +"</option>");
					}
					form.render('select');
				}
			});
	  }
	  
	//ajax加载所有的需求类型
	  function reloadxqlx(form){
			$.ajax({
				type : "post",
				url : "<c:url value='/xqd/queryAllWTLX.do'/>",
				async : false,
				dataType : 'json',
				error : function() {
					alert("出错");
				},
				success : function(msg) {
					for (var i = 0; i < msg.length; i++) {
						$("#xqd_xqlx").append(
								"<option value='"+msg[i].wtlx_dm+"'>"+ msg[i].wtlx_mc +"</option>");
					}
					form.render('select');
				}
			});
	  }
	
	//ajax实现查询所有的负责人
	  function  reloadFZR(form){
	  	$.ajax({
	  		type : "post",
	  		url : "<c:url value='/approveproj/allUser.do'/>",
	  		async : false,
	  		dataType : 'json',
	  		error : function() {
	  			alert("出错");
	  		},
	  		success : function(msg) {
	  			for (var i = 0; i < msg.length; i++) {
	  				$("#xqd_fzr").append(
	  						"<option value='"+msg[i].user_id+"'>"+ msg[i].user_name +"</option>");
	  			}
	  			form.render('select');
	  		}
	  	});
	  }
</script>
</body>
</html>