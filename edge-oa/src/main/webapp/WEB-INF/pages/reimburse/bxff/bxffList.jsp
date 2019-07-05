<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>报销发放列表</title>
<link rel="stylesheet" href="../layui-v2.4.5/layui/css/layui.css">
<link rel="stylesheet" href="../login/css/static.css">
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@page isELIgnored="false"%>
</head>
<body>
	<input type="hidden" value='<c:url value="/"/>' id="url">
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
 
  table.render({
    elem: '#test'
    ,url:url+'bxff/bxffList.do'
    ,toolbar: '#toolbarDemo'
    ,title: '报销信息'
    ,totalRow: true
    ,cols: [[
       {field:'index', width:"5%", title: '序号', sort: true,type:'numbers', totalRowText: '合计',unresize: true}
      ,{field:'reimbursement_code', width:"15%",align:'center', title: '审批编号'}
      ,{field:'proj_name', width:"20%", align:'center', title: '项目名称'}
      ,{field:'fylx_name', width:"9%", align:'center', title: '费用类型'}
      ,{field:'reimbursement_bxje', width:"9%", align:'center', title: '报销金额',totalRow: true}
      ,{field:'reimbursement_user_name', width:"9%", align:'center', title: '费用所属'}
      ,{field:'reimbursement_bxr', width:"8%", align:'center', title: '报销人'}
      ,{field:'reimbursement_begintime', width:"10%", align:'center', title: '发生日期',templet:'<div>{{ layui.util.toDateString(d.reimbursement_begintime, "yyyy-MM-dd") }}</div>'}
      ,{field:'reimbursement_submittime', width:"15%", align:'center', title: '提交时间',templet:'<div>{{ layui.util.toDateString(d.reimbursement_submittime, "yyyy-MM-dd HH:mm:ss") }}</div>'}
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