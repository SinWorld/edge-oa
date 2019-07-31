<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>项目信息列表</title>
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
				      <label class="layui-form-label" style="width:120px;">预算编号</label>
				      <div class="layui-input-inline" style="width: 205px;">
					     <input type="text" name="xmxx_ysbh" lay-verify="xmxx_ysbh" autocomplete="off" class="layui-input" style="width:200px;" id="xmxx_ysbh">
					  </div>
				 </div>
				 
				 <div class="layui-inline" style="left: -25px;">
				      <label class="layui-form-label" style="width:120px;">代号</label>
				      <div class="layui-input-inline" style="width: 205px;">
					     <input type="text" name="xmxx_dh" lay-verify="xmxx_dh" autocomplete="off" class="layui-input" style="width:200px;" id="xmxx_dh">
					  </div>
				 </div>
				 
				  <div class="layui-inline" style="left: -25px;">
				      <label class="layui-form-label" style="width:120px;">名称</label>
				      <div class="layui-input-inline" style="width: 205px;">
					     <input type="text" name="xmxx_mc" lay-verify="xmxx_mc" autocomplete="off" class="layui-input" style="width:200px;" id="xmxx_mc">
					  </div>
				 </div>
				
				</div> 
				
				
				<div class="layui-form-item">
				 
					 <div class="layui-inline" style="width: 25.5%;left:14px;">
					  	<label class="layui-form-label">客户</label>
						<div class="layui-input-inline" style="text-align: left;width: 200px;">
							<select name="xmxx_kh" id="xmxx_kh" lay-filter="xmxx_kh" lay-verify="xmxx_kh">
								<option value="" selected="selected">请选择客户</option>
							</select>
						</div>
					 </div>
				 
					 <div class="layui-inline" style="left:60px;">
					      <label class="layui-form-label" style="width:72px;">客户部门</label>
					      <div class="layui-input-inline" style="width:205px;">
						     <input type="text" name="xmxx_khbm" lay-verify="xmxx_khbm" autocomplete="off" class="layui-input" style="width:200px;" id="xmxx_khbm">
						  </div>
					 </div>
				 
					  <div class="layui-inline" style="left:111px;width: 512px;">
					      <label class="layui-form-label" style="width: 71px;">项目金额</label>
					      <div class="layui-input-inline">
						     <input type="text" name="jinE1" lay-verify="jinE1"autocomplete="off" class="layui-input" style="width: 85px;"id="jinE1" onchange="xmje1Change()">
						  </div>
				       	  <i class="u-date_line" style="margin-left: -312px;line-height: 35px;">—</i>
						      <div class="layui-input-inline" style="left: -85px;">
						     <input type="text" name="jinE2" lay-verify="jinE2"autocomplete="off" class="layui-input" style="width: 85px;"id="jinE2" onchange="xmje2Change()">
					      </div>
					 </div>
				 
				</div>
				
				<div class="layui-form-item">
					 <div class="layui-inline" style="left:10px;width: 520px;top: -10px;">
					      <label class="layui-form-label" style="width:85px;">提出日期</label>
					      <div class="layui-input-inline">
					        <input type="text" name="time1" id="time1" lay-verify="time1" placeholder="yyyy-MM-dd" autocomplete="off" class="layui-input" style="width: 120px;">
					      </div>
					       <i class="u-date_line" style="margin-left: -274px;line-height: 35px;">—</i>
					      <div class="layui-input-inline" style="left: -50px;">
					        <input type="text" name="time2" id="time2" lay-verify="time2" placeholder="yyyy-MM-dd" autocomplete="off" class="layui-input" style="width: 120px;">
					      </div>
					</div>
					
					<div class="layui-inline" style="width: 25.5%;left:-142px;top:-10px;">
					  	<label class="layui-form-label">负责人</label>
						<div class="layui-input-inline" style="text-align: left;width: 200px;">
							<select name="xmxx_fzr" id="xmxx_fzr" lay-filter="xmxx_fzr" lay-verify="xmxx_fzr">
								<option value="" selected="selected">请选择负责人</option>
							</select>
						</div>
					 </div>
				 <button class="layui-btn" data-type="reload" type="button" id="do_search" style="margin-left:7px;margin-top: -27px;">搜索</button>
				 <button type="reset" class="layui-btn layui-btn-primary" style="margin-top: -27px;margin-left: 70px;">重置</button>
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
    <button class="layui-btn layui-btn-sm" lay-event="getCheckData" type="button" id="add">+发起项目信息</button>
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
    ,url:url+'xmxx/xmxxList.do'
    ,toolbar: '#toolbarDemo'
    ,title: '项目信息'
    ,totalRow: true
    ,cols: [[
       {field:'index', width:"8%", title: '序号', sort: true,type:'numbers', totalRowText: '合计',unresize: true}
      ,{field:'xmxx_ysbh', width:"10%",align:'center', title: '预算编号'}
      ,{field:'xmxx_dh', width:"10%", align:'center', title: '代号'}
      ,{field:'xmxx_mc', width:"12%", align:'center', title: '名称'}
      ,{field:'xmxx_khmc', width:"12%", align:'center', title: '客户'}
      ,{field:'xmxx_khbm', width:"9%", align:'center', title: '客户部门'}
      ,{field:'xmxx_xmje', width:"9%", align:'center', title: '项目金额',totalRow: true}
      ,{field:'xmxx_tcrq', width:"9%", align:'center', title: '提出日期',templet:'<div>{{ layui.util.toDateString(d.beginTime, "yyyy-MM-dd") }}</div>'}
      ,{field:'xmxx_fzrmc', width:"9%", align:'center', title: '负责人'}
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
         	  	title:'新增项目信息',
         	  	area: ['100%','100%'],
         		shadeClose: false,
         		resize:false,
         	    anim: 1,
         	  	content:[url+"xmxx/initSaveXMXX.do",'yes']
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
    var xmxx_dm=data.xmxx_dm;
   	if(obj.event === 'edit'){
   		layer.open({
        	  	type:2,
        	  	title:'编辑项目信息',
        	  	area: ['100%','100%'],
        		shadeClose: false,
         		resize:false,
         	    anim: 1,
        	  	content:[url+"xmxx/initEditXMXX.do?xmxx_dm="+xmxx_dm,'yes']
      	  	});
    }else if(obj.event==='del'){
    	layer.confirm('您确定要删除该数据吗？', {
			  btn: ['确定','取消'], //按钮
			  title:'提示'},function(index){
				  $.ajax({
			    		type : "post",
			    		url : "<c:url value='/xmxx/deleteXMXXById.do'/>",
			    		async : false,
			    		dataType : 'json',
			    		data:{"xmxx_dm":xmxx_dm},
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
	  	  	content:[url+"xmxx/xmxxShow.do?xmxx_dm="+xmxx_dm,'yes']
		  });
    }
  });
  
  
  //执行搜索，表格重载
  $('#do_search').on('click', function () {
      // 搜索条件
      var xmxx_ysbh=$('#xmxx_ysbh').val();//预算编号
   	  var xmxx_dh=$('#xmxx_dh').val();//代号
      var xmxx_mc=$('#xmxx_mc').val();//名称
      var xmxx_kh=$('#xmxx_kh').val();//客户
      var xmxx_khbm=$('#xmxx_khbm').val();//客户部门
      var jinE1=$('#jinE1').val();//金额
      var jinE2=$('#jinE2').val();//金额
      var time1=$('#time1').val();//提出日期
      var time2=$('#time2').val();//提出日期
      var xmxx_fzr=$('#xmxx_fzr').val();//负责人
      table.reload('testReload', {
          method: 'post'
          , where: {
              'xmxx_ysbh': xmxx_ysbh,
              'xmxx_dh':xmxx_dh,
              'xmxx_mc':xmxx_mc,
              'xmxx_kh':xmxx_kh,
              'xmxx_khbm':xmxx_khbm,
              'jinE1':jinE1,
              'jinE2':jinE2,
              'time1':time1,
              'time2':time2,
              'xmxx_fzr':xmxx_fzr
          }
          , page: {
              curr: 1
          }
      });
  });
  
  reloadKh(form);
  allFZR(form);
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
						$("#xmxx_kh").append(
								"<option value='"+msg[i].khdm+"'>"+ msg[i].khmc +"</option>");
					}
					form.render('select');
				}
			});
	}
	
	//ajax实现查询所有的负责人
	function  allFZR(form){
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
					$("#xmxx_fzr").append(
							"<option value='"+msg[i].user_id+"'>"+ msg[i].user_name +"</option>");
				}
				form.render('select');
			}
		});
	}
	
	//项目金额带两位小数点
	function xmje1Change(){
		//获得项目金额输入的值
		var jinE1=$('#jinE1').val()*1;
		if(jinE1!=""){
			var je=jinE1.toFixed(2); 
			$('#jinE1').val(je);
		}else{
			$('#jinE1').val("0.00");
		}
	}
	
	//项目金额带两位小数点
	function xmje2Change(){
		//获得项目金额输入的值
		var jinE2=$('#jinE2').val()*1;
		if(jinE2!=""){
			var je=jinE2.toFixed(2); 
			$('#jinE2').val(je);
		}else{
			$('#jinE2').val("0.00");
		}
	}
	
</script>
</body>
</html>