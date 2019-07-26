<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>客户系统列表</title>
<link rel="stylesheet" href="../layui-v2.4.5/layui/css/layui.css">
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@page isELIgnored="false" %>
</head>
<body>
	<form class="layui-form" action="" style="margin-top: 10px;">
	 <div class="demoTable" style="background-color: #CAE1FF;height:105px;" id="gjssq">
		 <div class="layui-form-item" style="width:1280px;height:auto;padding:0px; margin:0 auto;" id="main"">
			 <div class="layui-form-item">
			    <div class="layui-inline" style="left: -25px;">
				      <label class="layui-form-label" style="width:120px;">代号</label>
				      <div class="layui-input-inline" style="width: 205px;">
					     <input type="text" name="khxt_dh" lay-verify="khxt_dh" autocomplete="off" class="layui-input" style="width:200px;" id="khxt_dh">
					  </div>
				 </div>
				 
				<div class="layui-inline" style="left: -25px;">
				      <label class="layui-form-label" style="width:120px;">名称</label>
				      <div class="layui-input-inline" style="width:205px;">
					     <input type="text" name="khxt_mc" lay-verify="khxt_mc" autocomplete="off" class="layui-input" style="width:200px;" id="khxt_mc">
					  </div>
				 </div>
				 
				  <div class="layui-inline" style="width: 24.5%;left: -33px;">
				  	<label class="layui-form-label">客户</label>
					<div class="layui-input-inline" style="text-align: left;">
						<select name="khxt_khdm" id="khxt_khdm" lay-filter="kehudm" lay-verify="khxt_khdm">
							<option value="" selected="selected">请选择客户</option>
						</select>
					</div>
				 </div>
				  <button class="layui-btn" data-type="reload" type="button" id="do_search" style="margin-top: -5px;margin-left: -5px;">搜索</button>
				  <button type="reset" class="layui-btn layui-btn-primary" style="margin-top: -5px;margin-right: -187px;">重置</button>
			</div>
				
			<div class="layui-form-item">
				<div class="layui-inline" style="left: -25px;">
				      <label class="layui-form-label" style="width:120px;">客户部门</label>
				      <div class="layui-input-inline" style="width:205px;">
					     <input type="text" name="khxt_khbm" lay-verify="khxt_khbm" autocomplete="off" class="layui-input" style="width:200px;" id="khxt_khbm">
					  </div>
				 </div>
				 
				 <div class="layui-inline" style="left: -25px;">
				      <label class="layui-form-label" style="width:120px;">客户负责人</label>
				      <div class="layui-input-inline" style="width:205px;">
					     <input type="text" name="khxt_khfzr" lay-verify="khxt_khfzr" autocomplete="off" class="layui-input" style="width:200px;" id="khxt_khfzr">
					  </div>
				 </div>
				 
				  <div class="layui-inline" style="left:-24px;width: 501px;">
				      <label class="layui-form-label" style="width: 71px;">上线日期</label>
				      <div class="layui-input-inline">
				        <input type="text" name="time1" id="time1" lay-verify="time1" placeholder="yyyy-MM-dd" autocomplete="off" class="layui-input">
				      </div>
				       <i class="u-date_line" style="margin-left: -212px;line-height: 35px;">—</i>
				      <div class="layui-input-inline">
				        <input type="text" name="time2" id="time2" lay-verify="time2" placeholder="yyyy-MM-dd" autocomplete="off" class="layui-input">
				      </div>
				</div>
				
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
    <button class="layui-btn layui-btn-sm" lay-event="getCheckData" type="button" id="add">+新增客户系统</button>
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
  laydate.render({
	    elem: '#time1'
  });
  laydate.render({
	elem: '#time2'
  });
  
  table.render({
    elem: '#test'
    ,url:url+'khxt/khxtList.do'
    ,toolbar: '#toolbarDemo'
    ,title: '客户系统'
    ,cols: [[
       {field:'index', width:"8%", title: '序号', sort: true,type:'numbers'}
      ,{field:'khxt_dh', width:"10%",align:'center', title: '代号'}
      ,{field:'khxt_mc', width:"13%", align:'center', title: '名称'}
      ,{field:'khxt_khmc', width:"17%", align:'center', title: '客户'}
      ,{field:'khxt_khbm', width:"12%", align:'center', title: '客户部门'}
      ,{field:'khxt_khfzr', width:"10%", align:'center', title: '客户负责人'}
      ,{field:'khxt_sxrq', width:"15%", align:'center', title: '上线日期',templet:'<div>{{ layui.util.toDateString(d.endTime, "yyyy-MM-dd") }}</div>'}
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
         	  	title:'新增客户系统',
         	  	area: ['100%','100%'],
         		shadeClose: false,
         		resize:false,
         	    anim: 1,
         	  	content:[url+"khxt/initSaveKHXT.do",'yes']
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
    var khxt_dm=data.khxt_dm;
   	if(obj.event === 'edit'){
   		layer.open({
        	  	type:2,
        	  	title:'编辑客户系统',
        	  	area: ['100%','100%'],
        		shadeClose: false,
         		resize:false,
         	    anim: 1,
        	  	content:[url+"khxt/initEditKHXT.do?khxt_dm="+khxt_dm,'yes']
      	  	});
    }else if(obj.event==='del'){
    	layer.confirm('您确定要删除该数据吗？', {
			  btn: ['确定','取消'], //按钮
			  title:'提示'},function(index){
				  $.ajax({
			    		type : "post",
			    		url : "<c:url value='/khxt/deleteKHXTById.do'/>",
			    		async : false,
			    		dataType : 'json',
			    		data:{"khxt_dm":khxt_dm},
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
	  	  	content:[url+"khxt/khxtShow.do?khxt_dm="+khxt_dm,'yes']
		  });
    }
  });
  
  
  //执行搜索，表格重载
  $('#do_search').on('click', function () {
      // 搜索条件
      var khxt_dh=$('#khxt_dh').val();//代号
   	  var khxt_mc=$('#khxt_mc').val();//名称
      var khxt_khdm=$('#khxt_khdm').val();//客户
      var khxt_khbm=$('#khxt_khbm').val();//客户部门
      var khxt_khfzr=$('#khxt_khfzr').val();//客户负责人
      var time1=$('#time1').val();//上线日期
      var time2=$('#time2').val();//上线日期
      table.reload('testReload', {
          method: 'post'
          , where: {
              'khxt_dh': khxt_dh,
              'khxt_mc':khxt_mc,
              'khxt_khdm':khxt_khdm,
              'khxt_khbm':khxt_khbm,
              'khxt_khfzr':khxt_khfzr,
              'time1':time1,
              'time2':time2
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
						$("#khxt_khdm").append(
						    "<option value='"+msg[i].khdm+"'>"+ msg[i].khmc +"</option>"); 
				}
				form.render('select');
			}
		});
	}
</script>
</body>
</html>