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
				        <input type="text" name="proj_Code" lay-verify="proj_Code"
						autocomplete="off" class="layui-input" style="width: 200px;" id="proj_Code">
				      </div>
			     </div>
			    <div class="layui-inline" style="width:490px;">
					  	<label class="layui-form-label">项目名称</label>
						<div class="layui-input-inline" style="text-align: left;width: 75%">
							<select name="proj_Info_Id" id="proj_Info_Id" lay-filter="proj_Info_Id" lay-verify="proj_Info_Id" lay-search="">
								<option value="" selected="selected">请选择所属项目</option>
							</select>
						</div>
				</div>
				<div class="layui-inline" style="width: 24.5%;left: -6px;">
				  	<label class="layui-form-label">费用类型</label>
					<div class="layui-input-inline" style="text-align: left;">
						<select name="user_Id" id="user_Id" lay-filter="user_Id" lay-verify="user_Id">
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
						<select name="appr_Status" id="appr_Status" lay-filter="appr_Status" lay-verify="appr_Status">
							<option value="" selected="selected">请选择费用所属</option>
						</select>
					</div>
			 	</div>
			 	 <div class="layui-inline" style="left: -221px;">
				      <label class="layui-form-label" style="width: 71px;">报销人</label>
				      <div class="layui-input-inline" style="width: 100px;">
					     <input type="text" name="jinE1" lay-verify="jinE1"autocomplete="off" class="layui-input" style="width: 85px;"id="jinE1">
					  </div>
				 </div>
				 
				<div class="layui-inline" style="width:323px;left: -172px;top:-43px;left:843px;">
				  	<label class="layui-form-label">审批状态</label>
					<div class="layui-input-inline" style="text-align: left;width: 190px;">
						<select name="appr_Status" id="appr_Status" lay-filter="appr_Status" lay-verify="appr_Status">
							<option value="" selected="selected">请选择审批状态</option>
						</select>
					</div>
			 	</div>
		 	</div>
		 	
		 	<div class="layui-form-item">
		 		<div class="layui-inline" style="left: 29px;top: -50px;">
				      <label class="layui-form-label" style="width: 71px;">当前操作</label>
				      <div class="layui-input-inline">
					     <input type="text" name="jinE1" lay-verify="jinE1"autocomplete="off" class="layui-input" style="width: 200px;"id="jinE1">
					  </div>
				 </div>
				 
				 <div class="layui-inline" style="left: 35px;width: 512px;top:-50px;">
				      <label class="layui-form-label" style="width: 71px;">发生日期</label>
				      <div class="layui-input-inline">
				        <input type="text" name="time1" id="date" lay-verify="date" placeholder="yyyy-MM-dd" autocomplete="off" class="layui-input">
				      </div>
				       <i class="u-date_line" style="margin-left: -14px;line-height: 35px;">—</i>
				      <div class="layui-input-inline">
				        <input type="text" name="time2" id="date2" lay-verify="date" placeholder="yyyy-MM-dd" autocomplete="off" class="layui-input" style="width: 162px;">
				      </div>
				 </div>
				 
				 <div class="layui-inline" style="left:30px;width: 512px;top:-50px;">
				      <label class="layui-form-label" style="width: 71px;">提交日期</label>
				      <div class="layui-input-inline">
				        <input type="text" name="time1" id="date" lay-verify="date" placeholder="yyyy-MM-dd" autocomplete="off" class="layui-input">
				      </div>
				       <i class="u-date_line" style="margin-left: -14px;line-height: 35px;">—</i>
				      <div class="layui-input-inline">
				        <input type="text" name="time2" id="date2" lay-verify="date" placeholder="yyyy-MM-dd" autocomplete="off" class="layui-input" style="width: 162px;">
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
});
</script>
</body>
</html>