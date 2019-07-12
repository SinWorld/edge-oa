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
							<select name="xshtkp_xshtdm" id="xshtkp_xshtdm" lay-filter="xshtkp_xshtdm" lay-verify="xshtkp_xshtdm" lay-search="">
								<option value="" selected="selected">请选择所属销售合同</option>
							</select>
						</div>
				</div>
				<div class="layui-inline" style="left: -25px;">
				      <label class="layui-form-label" style="width: 71px;">登记人</label>
				      <div class="layui-input-inline" style="width: 160px;">
					     <input type="text" name="xshtkp_djr" lay-verify="xshtkp_djr"autocomplete="off" class="layui-input" style="width: 145px;" id="xshtkp_djr">
					  </div>
				 </div>
		 	</div>
			
			
		 	<div class="layui-form-item">
				 <div class="layui-inline" style="left: 8px;width: 512px;">
				      <label class="layui-form-label" style="width: 71px;">发生日期</label>
				      <div class="layui-input-inline">
				        <input type="text" name="date" id="date" lay-verify="date" placeholder="yyyy-MM-dd" autocomplete="off" class="layui-input">
				      </div>
				       <i class="u-date_line" style="margin-left: -14px;line-height: 35px;">—</i>
				      <div class="layui-input-inline">
				        <input type="text" name="date2" id="date2" lay-verify="date" placeholder="yyyy-MM-dd" autocomplete="off" class="layui-input" style="width: 162px;">
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
  
  allXSHT(form);
  
  // 执行搜索，表格重载
  $('#do_search').on('click', function () {
      // 搜索条件
      var xshtkp_xshtdm = $('#xshtkp_xshtdm').val();//所属销售合同
   	  var xshtkp_djr=$('#xshtkp_djr').val();//登记人
      var date=$('#date').val();//发生日期
      var date2=$('#date2').val();//发生日期
      table.reload('testReload', {
          method: 'post'
          , where: {
              'xshtkp_xshtdm': xshtkp_xshtdm,
              'xshtkp_djr':xshtkp_djr,
              'time1':date,
              'time2':date2
          }
          , page: {
              curr: 1
          }
      });
  });
  
});
//ajax实现查询所有的销售合同信息
function  allXSHT(form){
	$.ajax({
		type : "post",
		url : "<c:url value='/xshtdj/queryAllXSHT.do'/>",
		async : false,
		dataType : 'json',
		error : function() {
			alert("出错");
		},
		success : function(msg) {
			for (var i = 0; i < msg.length; i++) {
				$("#xshtkp_xshtdm").append(
						"<option value='"+msg[i].proj_Info_Id+"'>"+ msg[i].proj_Name +"</option>");
			}
			form.render('select');
		}
	});
}
</script>
</body>
</html>