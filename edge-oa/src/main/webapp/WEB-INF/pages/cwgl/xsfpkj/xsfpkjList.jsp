<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>销售发票开具列表</title>
<link rel="stylesheet" href="../layui-v2.4.5/layui/css/layui.css">
<link rel="stylesheet" href="../login/css/static.css">
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@page isELIgnored="false"%>
</head>
<body>
	<form class="layui-form" action="" style="margin-top: 10px;">
	 <div class="demoTable" style="background-color: #CAE1FF;height: 110px;" id="gjssq">
		 <div class="layui-form-item" style="width:1280px;height:auto;padding:0px; margin:0 auto;" id="main"">
			 <div class="layui-form-item">
			    <div class="layui-inline" style="width:490px;">
					  	<label class="layui-form-label">销售合同</label>
						<div class="layui-input-inline" style="text-align: left;width: 75%">
							<select name="proj_dm" id="proj_dm" lay-filter="proj_dm" lay-verify="proj_dm" lay-search="">
								<option value="" selected="selected">请选择所属销售合同</option>
							</select>
						</div>
				</div>
				<div class="layui-inline" style="left: -25px;">
				      <label class="layui-form-label" style="width: 71px;">登记人</label>
				      <div class="layui-input-inline" style="width: 160px;">
					     <input type="text" name="reimbursement_bxr" lay-verify="reimbursement_bxr"autocomplete="off" class="layui-input" style="width: 145px;" id="reimbursement_bxr">
					  </div>
				 </div>
		 	</div>
			
			
		 	<div class="layui-form-item">
				 <div class="layui-inline" style="left: 8px;width: 512px;">
				      <label class="layui-form-label" style="width: 71px;">发生日期</label>
				      <div class="layui-input-inline">
				        <input type="text" name="begintime1" id="date" lay-verify="date" placeholder="yyyy-MM-dd" autocomplete="off" class="layui-input">
				      </div>
				       <i class="u-date_line" style="margin-left: -14px;line-height: 35px;">—</i>
				      <div class="layui-input-inline">
				        <input type="text" name="begintime2" id="date2" lay-verify="date" placeholder="yyyy-MM-dd" autocomplete="off" class="layui-input" style="width: 162px;">
				      </div>
				 </div>
					<button class="layui-btn" data-type="reload" type="button" id="do_search" style="margin-left: 56px;">搜索</button>
				 	<button type="reset" class="layui-btn layui-btn-primary">重置</button>
			</div>
		</div> 
	</div>
</form>
	<input type="hidden" value='<c:url value="/"/>' id="url">
	<input type="hidden" id="flag" value="false">
 	<div class="layui-tab-item layui-show">
		<div style="position:relative;top: -10px;">
			<table class="layui-hide" id="test" lay-filter="test"></table>
		</div>
	</div>	
	
	<script type="text/html" id="toolbarDemo">
       <div class="layui-btn-container" style="width:25%;">
 	    <button class="layui-btn layui-btn-sm" lay-event="gjss" type="button">高级搜索</button>
       </div>
    </script>
    
   
<script src="../layui-v2.4.5/layui/layui.js" charset="utf-8"></script>
<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 --> 
<script type="text/javascript" src="../jquery/jquery-3.3.1.js"></script>
<script src="../layui-v2.4.5/layui/layui.js" charset="utf-8"></script>
<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 --> 
<script>
layui.use(['table','form','layedit', 'laydate','element'], function(){
  var table = layui.table;
  var url=$('#url').val();
  var form= layui.form;
  var layer = layui.layer;
  var layedit = layui.layedit;
  var laydate = layui.laydate;
  var element = layui.element;
  //日期
  laydate.render({
    elem: '#date'
  });
  laydate.render({
	elem: '#date2'
  });
  //日期
  laydate.render({
    elem: '#subTime1'
  });
  laydate.render({
	elem: '#subTime2'
  });
  $('#gjssq').hide();
  //未发放登记
  table.render({
    elem: '#test'
    ,url:url+'xsfpkj/xshtkpList.do'
    ,toolbar: '#toolbarDemo'
    ,title: '发票开具'
    ,cols: [[
       {field:'index', width:"10%", title: '序号', sort: true,type:'numbers'}
      ,{field:'xshtmc', width:"50%", align:'center', title: '销售合同'}
      ,{field:'xshtkp_djr', width:"20%", align:'center', title: '登记人'}
      ,{field:'xshtkp_kprq', width:"20%", align:'center', title: '开票日期',templet:'<div>{{ layui.util.toDateString(d.reimbursement_begintime, "yyyy-MM-dd HH:mm:ss") }}</div>'}
    ]]
    ,id:'testReload'
    ,page: true
  });
  
  //头工具栏事件
  table.on('toolbar(test)', function(obj){
    var url=$('#url').val();
    var flag=$('#flag').val();
    if(obj.event=='gjss'){
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
  	var uuid=data.xshtkp_uuid;
  	var xshtdm=data.xshtkp_xshtdm;
   	 layer.open({
     	  	type:2,
     	  	title:'查看',
     	  	area: ['100%','100%'],
     		shadeClose: false,
     		resize:false,
     	    anim: 1,
     	  	content:[url+'xsfpkj/xshtkpShowByuuid.do?uuid='+uuid+'&xshtdm='+xshtdm,'yes']
   	  });
  });
  
  // 执行搜索，表格重载
  $('#do_search').on('click', function () {
      // 搜索条件
      var reimbursement_code = $('#reimbursement_code').val();//报销填报编号
      var proj_dm=$('#proj_dm').val();//所属项目
      var reimbursement_dm_fylx=$('#reimbursement_dm_fylx').val();//费用类型
      var jinE1=$('#jinE1').val();//报销金额
      var jinE2=$('#jinE2').val();//报销金额
      var reimbursement_user_dm=$('#reimbursement_user_dm').val();//费用所属
      var reimbursement_bxr=$('#reimbursement_bxr').val();//报销人
      var appr_status=$('#appr_status').val();//审批状态
      var nextcz=$('#nextcz').val();//当前操作
      var date=$('#date').val();//发生日期
      var date2=$('#date2').val();//发生日期
      var subTime1=$('#subTime1').val();//提交日期
      var subTime2=$('#subTime2').val();//提交日期
      table.reload('testReload', {
          method: 'post'
          , where: {
              'reimbursement_code': reimbursement_code,
              'proj_dm':proj_dm,
              'reimbursement_dm_fylx':reimbursement_dm_fylx,
              'jinE1':jinE1,
              'jinE2':jinE2,
              'reimbursement_user_dm':reimbursement_user_dm,
              'reimbursement_bxr':reimbursement_bxr,
              'appr_status':appr_status,
              'nextcz':nextcz,
              'time1':date,
              'time2':date2,
              'subTime1':subTime1,
              'subTime2':subTime2
          }
          , page: {
              curr: 1
          }
      });
  });
  ylxXmXX(form);
  allfylx(form);
  allUser(form);
  allSPZT(form);
});
//ajax加载所有的已立项的项目
function ylxXmXX(form){
	$.ajax({
		type : "post",
		url : "<c:url value='/xshtdj/queryAllYLXXMXX.do'/>",
		async : false,
		dataType : 'json',
		error : function() {
			alert("出错");
		},
		success : function(msg) {
			for (var i = 0; i < msg.length; i++) {
				$("#proj_dm").append(
						"<option value='"+msg[i].proj_Id+"'>"+ msg[i].budget_Name +"</option>");
			}
			form.render('select');
		}
	});
}

//ajax加载所有的费用类型
function allfylx(form){
	$.ajax({
		type : "post",
		url : "<c:url value='/bxtb/queryAllFYLX.do'/>",
		async : false,
		dataType : 'json',
		error : function() {
			alert("出错");
		},
		success : function(msg) {
			for (var i = 0; i < msg.length; i++) {
				$("#reimbursement_dm_fylx").append(
						"<option value='"+msg[i].fylx_dm+"'>"+ msg[i].fylx_mc +"</option>");
			}
			form.render('select');
		}
	});
}

//ajax实现查询所有的费用所属
function  allUser(form){
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
				$("#reimbursement_user_dm").append(
						"<option value='"+msg[i].user_id+"'>"+ msg[i].user_name +"</option>");
			}
			form.render('select');
		}
	});
}

//ajax实现查询所有的审批状态
function  allSPZT(form){
	$.ajax({
		type : "post",
		url : "<c:url value='/approveproj/queryAllSPZT.do'/>",
		async : false,
		dataType : 'json',
		error : function() {
			alert("出错");
		},
		success : function(msg) {
			for (var i = 0; i < msg.length; i++) {
				$("#appr_status").append(
						"<option value='"+msg[i].appr_Status_Id+"'>"+ msg[i].appr_Status_Name +"</option>");
			}
			form.render('select');
		}
	});
}

//格式化金额
function formatJE1(){
	var je1=$('#jinE1').val()*1;
	$('#jinE1').val(je1.toFixed(2));
}
//格式化金额
function formatJE2(){
	var je1=$('#jinE2').val()*1;
	$('#jinE2').val(je1.toFixed(2));
}

</script>
</body>
</html>