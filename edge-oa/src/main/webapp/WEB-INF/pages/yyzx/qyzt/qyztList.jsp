<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>签约主体列表</title>
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
				      <label class="layui-form-label" style="width:120px;">签约主体代号</label>
				      <div class="layui-input-inline" style="width: 205px;">
					     <input type="text" name="qyztdh" lay-verify="qyztdh" autocomplete="off" class="layui-input" style="width:200px;" id="qyztdh">
					  </div>
				 </div>
				 
				<div class="layui-inline" style="left: -25px;">
				      <label class="layui-form-label" style="width:120px;">签约主体简称</label>
				      <div class="layui-input-inline" style="width:205px;">
					     <input type="text" name="qyztjc" lay-verify="qyztjc" autocomplete="off" class="layui-input" style="width:200px;" id="qyztjc">
					  </div>
				 </div>
				 <button class="layui-btn" data-type="reload" type="button" id="do_search">搜索</button>
		 	</div>
			
		 	<div class="layui-form-item">
				 <div class="layui-inline" style="left: -25px;">
				      <label class="layui-form-label" style="width: 120px;">签约主体名称</label>
				      <div class="layui-input-inline" style="width:205px;">
					     <input type="text" name="qyztmc" lay-verify="qyztmc" autocomplete="off" class="layui-input" style="width:200px;" id="qyztmc">
					  </div>
				 </div>
				 
				<div class="layui-inline" style="left: -25px;">
				      <label class="layui-form-label" style="width:120px;">签约主体描述</label>
				      <div class="layui-input-inline" style="width:205px;">
					     <input type="text" name="qyztms" lay-verify="qyztms" autocomplete="off" class="layui-input" style="width:200px;" id="qyztms">
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
    <button class="layui-btn layui-btn-sm" lay-event="getCheckData" type="button" id="add">+新增签约主体</button>
 	<button class="layui-btn layui-btn-sm" lay-event="gjss" type="button">高级搜索</button>
  </div>
</script>
 
<script type="text/html" id="barDemo">
  <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
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
    ,url:url+'qyzt/qyztList.do'
    ,toolbar: '#toolbarDemo'
    ,title: '签约主体'
    ,cols: [[
       {field:'index', width:"8%", title: '序号', sort: true,type:'numbers'}
      ,{field:'qyztdh', width:"12%",align:'center', title: '签约主体代号'}
      ,{field:'qyztjc', width:"15%", align:'center', title: '签约主体简称'}
      ,{field:'qyztmc', width:"15%", align:'center', title: '签约主体名称'}
      ,{field:'qyztms', width:"40%", align:'center', title: '签约主体描述'}
      ,{fixed: 'right', title:'操作', toolbar: '#barDemo', width:"10%",align:'center'}
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
         	  	title:'新增签约主体',
         	  	area: ['100%','100%'],
         		shadeClose: false,
         		resize:false,
         	    anim: 1,
         	  	content:[url+"qyzt/initSaveQYZT.do",'yes']
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
    var qyztdm=data.qyztdm;
   	if(obj.event === 'edit'){
   		layer.open({
        	  	type:2,
        	  	title:'编辑签约主体',
        	  	area: ['100%','100%'],
        		shadeClose: false,
         		resize:false,
         	    anim: 1,
        	  	content:[url+"qyzt/queryQYZTById.do?qyztdm="+qyztdm,'yes']
      	  	});
    }else if(obj.event==='detail'){
	   	 parent.layer.open({
	  	  	type:2,
	  	  	title:'查看',
	  	  	area: ['100%','100%'],
	  		shadeClose: false,
	  		resize:false,
	  	    anim: 1,
	  	  	content:[url+"qyzt/qyztdmShow.do?qyztdm="+qyztdm,'yes']
		  });
    }
  });
  
  
  //执行搜索，表格重载
  $('#do_search').on('click', function () {
      // 搜索条件
      var qyztdh = $('#qyztdh').val();//签约主体代号
   	  var qyztjc=$('#qyztjc').val();//签约主体简称
      var qyztmc=$('#qyztmc').val();//签约主体名称
      var qyztms=$('#qyztms').val();//签约主体描述
      table.reload('testReload', {
          method: 'post'
          , where: {
              'qyztdh': qyztdh,
              'qyztjc':qyztjc,
              'qyztmc':qyztmc,
              'qyztms':qyztms
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