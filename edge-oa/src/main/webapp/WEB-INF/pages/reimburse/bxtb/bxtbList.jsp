<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>报销填报列表</title>
<link rel="stylesheet" href="../layui-v2.4.5/layui/css/layui.css">
<link rel="stylesheet" href="../login/css/static.css">
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@page isELIgnored="false"%>
</head>
<body>
	<form class="layui-form" action="" style="margin-top: 10px;">
	 <div class="demoTable" style="background-color: #CAE1FF;height: 193px;" id="gjssq">
		 <div class="layui-form-item" style="width:1280px;height:auto;padding:0px; margin:0 auto;" id="main"">
			 <div class="layui-form-item">
				 <div class="layui-inline">
				      <label class="layui-form-label" style="width: 100px;">审批编号</label>
				      <div class="layui-input-inline">
				        <input type="text" name="reimbursement_code" lay-verify="reimbursement_code"
						autocomplete="off" class="layui-input" style="width: 200px;" id="reimbursement_code">
				      </div>
			     </div>
			    <div class="layui-inline" style="width:490px;">
					  	<label class="layui-form-label">项目名称</label>
						<div class="layui-input-inline" style="text-align: left;width: 75%">
							<select name="proj_dm" id="proj_dm" lay-filter="proj_dm" lay-verify="proj_dm" lay-search="">
								<option value="" selected="selected">请选择所属项目</option>
							</select>
						</div>
				</div>
				<div class="layui-inline" style="width: 24.5%;left: -6px;">
				  	<label class="layui-form-label">费用类型</label>
					<div class="layui-input-inline" style="text-align: left;">
						<select name="reimbursement_dm_fylx" id="reimbursement_dm_fylx" lay-filter="reimbursement_dm_fylx" lay-verify="reimbursement_dm_fylx">
							<option value="" selected="selected">请选择费用类型</option>
						</select>
					</div>
			 	</div>
		 	</div>
			
			<div class="layui-form-item">
				 <div class="layui-inline" style="left: 29px;">
				      <label class="layui-form-label" style="width: 71px;">报销金额</label>
				      <div class="layui-input-inline">
					     <input type="text" name="jinE1" lay-verify="jinE1"autocomplete="off" class="layui-input" style="width: 85px;"id="jinE1" onchange="formatJE1()">
					  </div>
			       	  <i class="u-date_line" style="margin-left: -115px;line-height: 35px;">—</i>
					      <div class="layui-input-inline" style="left: -85px;">
					     <input type="text" name="jinE2" lay-verify="jinE2"autocomplete="off" class="layui-input" style="width: 85px;"id="jinE2" onchange="formatJE2()">
				      </div>
				 </div>
				 <div class="layui-inline" style="width: 25.7%;left: -172px;">
				  	<label class="layui-form-label">费用所属</label>
					<div class="layui-input-inline" style="text-align: left;width: 200px;">
						<select name="reimbursement_user_dm" id="reimbursement_user_dm" lay-filter="reimbursement_user_dm" lay-verify="reimbursement_user_dm">
							<option value="" selected="selected">请选择费用所属</option>
						</select>
					</div>
			 	</div>
			 	 <div class="layui-inline" style="left: -221px;">
				      <label class="layui-form-label" style="width: 71px;">报销人</label>
				      <div class="layui-input-inline" style="width: 100px;">
					     <input type="text" name="reimbursement_bxr" lay-verify="reimbursement_bxr"autocomplete="off" class="layui-input" style="width: 85px;" id="reimbursement_bxr">
					  </div>
				 </div>
				 
				<div class="layui-inline" style="width:323px;left: -172px;top:-43px;left:843px;">
				  	<label class="layui-form-label">审批状态</label>
					<div class="layui-input-inline" style="text-align: left;width: 190px;">
						<select name="appr_status" id="appr_status" lay-filter="appr_status" lay-verify="appr_status">
							<option value="" selected="selected">请选择审批状态</option>
						</select>
					</div>
			 	</div>
		 	</div>
		 	
		 	<div class="layui-form-item">
		 		<div class="layui-inline" style="left: 29px;top: -50px;">
				      <label class="layui-form-label" style="width: 71px;">当前操作</label>
				      <div class="layui-input-inline">
					     <input type="text" name="nextcz" lay-verify="nextcz"autocomplete="off" class="layui-input" style="width: 200px;"id="nextcz">
					  </div>
				 </div>
				 
				 <div class="layui-inline" style="left: 35px;width: 512px;top:-50px;">
				      <label class="layui-form-label" style="width: 71px;">发生日期</label>
				      <div class="layui-input-inline">
				        <input type="text" name="begintime1" id="date" lay-verify="date" placeholder="yyyy-MM-dd" autocomplete="off" class="layui-input">
				      </div>
				       <i class="u-date_line" style="margin-left: -14px;line-height: 35px;">—</i>
				      <div class="layui-input-inline">
				        <input type="text" name="begintime2" id="date2" lay-verify="date" placeholder="yyyy-MM-dd" autocomplete="off" class="layui-input" style="width: 162px;">
				      </div>
				 </div>
				 
				 <div class="layui-inline" style="left:30px;width: 512px;top:-50px;">
				      <label class="layui-form-label" style="width: 71px;">提交日期</label>
				      <div class="layui-input-inline">
				        <input type="text" name="subTime1" id="subTime1" lay-verify="subTime1" placeholder="yyyy-MM-dd" autocomplete="off" class="layui-input">
				      </div>
				       <i class="u-date_line" style="margin-left: -14px;line-height: 35px;">—</i>
				      <div class="layui-input-inline">
				        <input type="text" name="subTime2" id="subTime2" lay-verify="date" placeholder="yyyy-MM-dd" autocomplete="off" class="layui-input" style="width: 162px;">
				      </div>
				 </div>
					<button class="layui-btn" data-type="reload" type="button" id="do_search" style="margin-top: -105px;">搜索</button>
				 	<button type="reset" class="layui-btn layui-btn-primary" style="margin-left:5px;margin-top: -105px;">重置</button>
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
        <button class="layui-btn layui-btn-sm" lay-event="getCheckData" type="button">填报</button>
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
    ,url:url+'bxtb/reimbursementList.do'
    ,toolbar: '#toolbarDemo'
    ,title: '报销信息'
    ,totalRow: true
    ,cols: [[
       {field:'index', width:"5%", title: '序号', sort: true,type:'numbers', totalRowText: '合计',unresize: true}
      ,{field:'reimbursement_code', width:"15%",align:'center', title: '审批编号'}
      ,{field:'proj_name', width:"16%", align:'center', title: '项目名称'}
      ,{field:'fylx_name', width:"9%", align:'center', title: '费用类型'}
      ,{field:'reimbursement_bxje', width:"9%", align:'center', title: '报销金额',totalRow: true}
      ,{field:'reimbursement_user_name', width:"9%", align:'center', title: '费用所属'}
      ,{field:'reimbursement_bxr', width:"8%", align:'center', title: '报销人'}
      ,{field:'appr_status_name', width:"9%", align:'center', title: '审批状态'}
      ,{field:'nextcz', width:"9%", align:'center', title: '当前操作'}
      ,{field:'reimbursement_begintime', width:"10%", align:'center', title: '发生日期',templet:'<div>{{ layui.util.toDateString(d.reimbursement_begintime, "yyyy-MM-dd") }}</div>'}
      ,{field:'reimbursement_submittime', width:"15%", align:'center', title: '提交时间',templet:'<div>{{ layui.util.toDateString(d.reimbursement_submittime, "yyyy-MM-dd HH:mm:ss") }}</div>'}
    ]]
    ,id:'testReload'
    ,page: true
    ,done: function(res, curr, count){
    	var that = this.elem.next();
	    res.data.forEach(function (item, index) {
	    	if(res.data[index].appr_status_name=='作废'){
	    		 var tr = that.find(".layui-table-box tbody tr[data-index='" + index + "']").css({"color":"#EE3B3B","font-weight":"bold"});
	    	}else if(res.data[index].appr_status_name=='退回'){
	    		 var tr = that.find(".layui-table-box tbody tr[data-index='" + index + "']").css({"color": "#FFA500","font-weight":"bold"});
	    	}
        });

	  }
  });
  
  //头工具栏事件
  table.on('toolbar(test)', function(obj){
    var url=$('#url').val();
    var flag=$('#flag').val();
    if(obj.event=='getCheckData'){
    	 layer.open({
      	  	type:2,
      	  	title:'报销填报',
      	  	area: ['100%','100%'],
      	  	shadeClose: false,
      		resize:false,
      	    anim: 1,
      	  	content:[url+"bxtb/initsaveBxtb.do",'yes']
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
  	var reimbursement_dm=data.reimbursement_dm;
   	 layer.open({
     	  	type:2,
     	  	title:'查看',
     	  	area: ['100%','100%'],
     		shadeClose: false,
     		resize:false,
     	    anim: 1,
     	  	content:[url+"bxtb/reimburseShowById.do?reimbursement_dm="+reimbursement_dm,'yes']
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