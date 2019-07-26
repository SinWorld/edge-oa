<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>上线文档列表</title>
<link rel="stylesheet" href="../layui-v2.4.5/layui/css/layui.css">
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@page isELIgnored="false" %>
</head>
<body>
	<form class="layui-form" action="" style="margin-top: 10px;">
	 <div class="demoTable" style="background-color: #CAE1FF;height: 138px;" id="gjssq">
		 <div class="layui-form-item" style="width:1280px;height:auto;padding:0px; margin:0 auto;" id="main"">
			 <div class="layui-form-item">
			 
			    <div class="layui-inline" style="left: -25px;">
				      <label class="layui-form-label" style="width:120px;">编号</label>
				      <div class="layui-input-inline" style="width: 205px;">
					     <input type="text" name="sxwd_bh" lay-verify="sxwd_bh" autocomplete="off" class="layui-input" style="width:200px;" id="sxwd_bh">
					  </div>
				 </div>
				 
				 <div class="layui-inline" style="width: 24.5%;left: -33px;">
				  	<label class="layui-form-label">问题类型</label>
					<div class="layui-input-inline" style="text-align: left;">
						<select name="sxwd_wtlx" id="sxwd_wtlx" lay-filter="sxwd_wtlx" lay-verify="sxwd_wtlx">
							<option value="" selected="selected">请选择问题类型</option>
						</select>
					</div>
				 </div>
				 
				<div class="layui-inline" style="left: -25px;">
				      <label class="layui-form-label" style="width:120px;">上线内容</label>
				      <div class="layui-input-inline" style="width:205px;">
					     <input type="text" name="sxwd_bcgxnr" lay-verify="sxwd_bcgxnr" autocomplete="off" class="layui-input" style="width:200px;" id="sxwd_bcgxnr">
					  </div>
				 </div>
				 
				 <button class="layui-btn" data-type="reload" type="button" id="do_search" style="margin-left:74px;margin-top: -5px;">搜索</button>
				 
				 <div class="layui-inline" style="left: -25px;">
				      <label class="layui-form-label" style="width:120px;">系统</label>
				      <div class="layui-input-inline" style="width:205px;">
					     <input type="text" name="sxwd_xt" lay-verify="sxwd_xt" autocomplete="off" class="layui-input" style="width:200px;" id="sxwd_xt">
					  </div>
				 </div>
				 
				 <div class="layui-inline" style="left: -25px;">
				      <label class="layui-form-label" style="width:72px;">分支</label>
				      <div class="layui-input-inline" style="width:205px;">
					     <input type="text" name="sxwd_fz" lay-verify="sxwd_fz" autocomplete="off" class="layui-input" style="width:190px;" id="sxwd_fz">
					  </div>
				 </div>
				 
				 <div class="layui-inline" style="left: -28px;">
				      <label class="layui-form-label" style="width:120px;">GIT版本</label>
				      <div class="layui-input-inline" style="width:205px;">
					     <input type="text" name="sxwd_git" lay-verify="sxwd_git" autocomplete="off" class="layui-input" style="width:200px;" id="sxwd_git">
					  </div>
				 </div>
				 
				 <button type="reset" class="layui-btn layui-btn-primary" style="margin-top: -5px;margin-left: 70px;">重置</button>
				 
		 	</div>
			
		 	<div class="layui-form-item">
				
				 <div class="layui-inline" style="width: 25.5%;left:14px;top:-10px;">
				  	<label class="layui-form-label">开发负责人</label>
					<div class="layui-input-inline" style="text-align: left;width: 200px;">
						<select name="sxwd_kfry" id="sxwd_kfry" lay-filter="sxwd_kfry" lay-verify="sxwd_kfry">
							<option value="" selected="selected">请选择开发负责人</option>
						</select>
					</div>
				 </div>
				 
				 <div class="layui-inline" style="width: 24.5%;left:7px;top:-10px;">
				  	<label class="layui-form-label">上线人员</label>
					<div class="layui-input-inline" style="text-align: left;">
						<select name="sxwd_kfysry" id="sxwd_kfysry" lay-filter="sxwd_kfysry" lay-verify="sxwd_kfysry">
							<option value="" selected="selected">请选择上线人员</option>
						</select>
					</div>
				 </div>
				 
				 <div class="layui-inline" style="left:50px;width: 520px;top: -10px;">
				      <label class="layui-form-label" style="width:85px;">计划上线时间</label>
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
    <button class="layui-btn layui-btn-sm" lay-event="getCheckData" type="button" id="add">+发起上线文档</button>
 	<button class="layui-btn layui-btn-sm" lay-event="gjss" type="button">高级搜索</button>
  </div>
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
    ,url:url+'sxwd/sxwdList.do'
    ,toolbar: '#toolbarDemo'
    ,title: '上线文档'
    ,cols: [[
       {field:'index', width:"8%", title: '序号', sort: true,type:'numbers'}
      ,{field:'sxwd_bh', width:"10%",align:'center', title: '编号'}
      ,{field:'wtlxmc', width:"10%", align:'center', title: '问题类型'}
      ,{field:'sxwd_bcgxnr', width:"14%", align:'center', title: '上线内容'}
      ,{field:'sxwd_xt', width:"10%", align:'center', title: '系统'}
      ,{field:'sxwd_fz', width:"10%", align:'center', title: '分支'}
      ,{field:'sxwd_git', width:"10%", align:'center', title: 'GIT版本'}
      ,{field:'sxwd_jhsxsj', width:"10%", align:'center', title: '计划上线时间',templet:'<div>{{ layui.util.toDateString(d.beginTime, "yyyy-MM-dd") }}</div>'}
      ,{field:'kfrymc', width:"9%", align:'center', title: '开发负责人'}
      ,{field:'kfysrymc' , width:"9%", align:'center', title: '上线人员'}
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
         	  	title:'新增上线文档',
         	  	area: ['100%','100%'],
         		shadeClose: false,
         		resize:false,
         	    anim: 1,
         	  	content:[url+"sxwd/initSaveSxwd.do",'yes']
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
  
  //监听行工具事件 查看
  table.on('row(test)', function(obj){
    var data = obj.data;
    var url=$('#url').val();
  	var sxwd_dm=data.sxwd_dm;
     parent.layer.open({
     	  	type:2,
     	  	title:'查看',
     	  	area: ['100%','100%'],
     		shadeClose: false,
     		resize:false,
     	    anim: 1,
     	  	content:[url+"sxwd/shangXianWDShow.do?sxwd_dm="+sxwd_dm,'yes']
   	  });
  });
  
  
  //执行搜索，表格重载
  $('#do_search').on('click', function () {
      // 搜索条件
      var sxwd_bh=$('#sxwd_bh').val();//编号
   	  var sxwd_wtlx=$('#sxwd_wtlx').val();//问题类型
      var sxwd_bcgxnr=$('#sxwd_bcgxnr').val();//上线内容
      var sxwd_xt=$('#sxwd_xt').val();//系统
      var sxwd_fz=$('#sxwd_fz').val();//分支
      var sxwd_git=$('#sxwd_git').val();//git版本
      var sxwd_kfry=$('#sxwd_kfry').val();//开发负责人
      var sxwd_kfysry=$('#sxwd_kfysry').val();//上线人员
      var time1=$('#time1').val();//计划上线时间
      var time2=$('#time2').val();//计划上线时间
      table.reload('testReload', {
          method: 'post'
          , where: {
              'sxwd_bh': sxwd_bh,
              'sxwd_wtlx':sxwd_wtlx,
              'sxwd_bcgxnr':sxwd_bcgxnr,
              'sxwd_xt':sxwd_xt,
              'sxwd_fz':sxwd_fz,
              'sxwd_git':sxwd_git,
              'sxwd_kfry':sxwd_kfry,
              'sxwd_kfysry':sxwd_kfysry,
              'time1':time1,
              'time2':time2
          }
          , page: {
              curr: 1
          }
      });
  });
  
  initWTLX(form);
  allKFFZR(form);
  allSXRY(form);
});

	//ajax初始化问题类型
	function initWTLX(form) {
		$.ajax({
			type : "post",
			url : "<c:url value='/sxwd/queryAllWTLX.do'/>",
			async : false,
			dataType : 'json',
			error : function() {
				alert("出错");
			},
			success : function(msg) {
				for (var i = 0; i < msg.length; i++) {
						$("#sxwd_wtlx").append(
						    "<option value='"+msg[i].wtlx_dm+"'>"+ msg[i].wtlx_mc +"</option>"); 
				}
				form.render('select');
			}
		});
	}
	
	//ajax实现查询所有的开发负责人
	function  allKFFZR(form){
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
					$("#sxwd_kfry").append(
							"<option value='"+msg[i].user_id+"'>"+ msg[i].user_name +"</option>");
				}
				form.render('select');
			}
		});
	}
	
	//ajax实现查询所有的上线人员
	function  allSXRY(form){
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
					$("#sxwd_kfysry").append(
							"<option value='"+msg[i].user_id+"'>"+ msg[i].user_name +"</option>");
				}
				form.render('select');
			}
		});
	}
</script>
</body>
</html>