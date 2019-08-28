<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>销售发票开具查看页</title>
<link href="../login/css/xshtfp.css" rel="stylesheet"/>
<link rel="stylesheet" href="../layui-v2.5.4/layui/css/layui.css">
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@page isELIgnored="false" %>
<style>
  .bj{background-color: #F0F0F0}
 </style>
</head>
<body>
<div class="m-xm_message_box">
	<div>
		<strong id="_field_xiaoShouHTMC" class="u-header_link">${xsht.proj_Name}</strong>
		<div class="oim-field u-header" style=" margin:10px 0 0 0px;">
             <label for="" class="oim-field_label u-f13">合同编号</label>
             <span class="oim-field_text-show u-f13" id="_field_xiangMuXXBH">
             	${xsht.proj_Code}
             </span>
         	 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             <label for="" class="oim-field_label u-f13">合同金额</label>
              <span class="u-num" id="_heTongJE" style="color:#666;">${htje}</span>
              <span class="u-rmb">元</span>
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             <label for="" class="oim-field_label u-f13">累计开票</label>
             <span id="_leiJiKPJE">${ljkpje}</span>
                <span class="u-rmb">元</span>
				<div class="layui-progress layui-progress-big" lay-showpercent="true" style="left:580px;top:-18px;width: 120px;">
				  <div class="layui-progress-bar" lay-percent="${jebl}%"></div>
				</div>
			<label for="" class="oim-field_label u-f13">剩余开票金额</label>
             <span id="_shengYuKPJE">${sykpje}</span>
             <span class="u-rmb">元</span>
          </div>	
          <div>
              <div class="oim-field u-header">
             <label for="" class="oim-field_label u-f13">所属项目</label>
             <span class="u-register_title ">
               <a id="_field_xiangMuQC" class="u-header_link">${xmxx.budget_Name}</a>
             </span>
           </div>
          </div>			
	</div>
</div>
 		<div style="width:1280px;height:auto;padding:0px; margin:0 auto;" id="main">
			<form class="layui-form" action="" method="post" id="myForm" style="margin-top: 30px;">
				<input type="hidden" id="url" value='<c:url value="/"/>'>
				<input type="hidden" id="flag" value="${flag}"> 
				<input type="hidden" id="objId" value="${xsht.proj_Info_Id}">
				<input type="hidden" id="xmxxdm" value="${xmxx.proj_Id}">
				<input type="hidden" id="uuid" value="${uuid}">
				<button type="button" class="layui-btn layui-btn-normal" onclick="dybb()">发票打印</button>
				<table class="layui-hide" id="test" lay-filter="test"></table>
			</form>
 		</div>
	
<script src="../layui-v2.5.4/layui/layui.js" charset="utf-8"></script>
<script type="text/javascript" src="../jquery/jquery-3.3.1.js"></script>
<script>
	layui.use(['form','layedit','element','table'], function(){
		  var layer = layui.layer;
		  var form = layui.form;
		  var layedit = layui.layedit;
		  var element = layui.element;
		  var table = layui.table;
		  var url=$('#url').val();
		  var uuid=$('#uuid').val();
		  table.render({
			    elem: '#test'
			    ,url:url+'xsfpkj/xshtkpxq.do?uuid='+uuid
			    ,cellMinWidth: 80 //全局定义常规单元格的最小宽度，layui 2.2.1 新增
			    ,totalRow: true
			    ,cols: [[
			      {field:'index', width:60, title: '序号', sort: true,type:'numbers', totalRowText: '合计',unresize: true}
			      ,{field:'xshtkp_code', width:200, title: '审批编号'}
			      ,{field:'jxxmc', width:100, title: '进销项'}
			      ,{field:'fplbmc', width:150, title: '发票类别'}
			      ,{field:'xshtkp_fpsl', width:100, title: '发票税率'}
			      ,{field:'xshtkp_fpbh', width:150, title: '发票编号'}
			      ,{field:'xshtkp_kprq', width:120, title: '开票日期',templet:'<div>{{ layui.util.toDateString(d.reimbursement_begintime, "yyyy-MM-dd") }}</div>'}
			      ,{field:'xshtkp_kpje', width:100, title: '开票金额',totalRow: true}
			      ,{field:'xshtkp_wsje', width:100, title: '未税金额'}
			      ,{field:'xshtkp_sj', width:100, title: '税金'}
			      ,{field:'xshtkp_djr', width:100, title: '登记人'}
			      ,{field:'xshtkp_bz', width:500, title: '备注'}
			    ]]
		  		  ,page: false
		  		  ,id:'idTest'
			});
	});

	$('#_field_xiangMuQC').click(function(){
		var xmxxdm=$('#xmxxdm').val();
		var url=$('#url').val();
		parent.layer.open({
	     	  	type:2,
	     	  	title:'查看',
	     	  	area: ['100%','100%'],
	     		shadeClose: false,
	     		resize:false,
	     	    anim: 1,
	     	  	content:[url+"approveproj/xiangMuXXShowById.do?proj_Id="+xmxxdm,'yes']
	   	  });
	});
	
	$('#_field_xiaoShouHTMC').click(function(){
		var objId=$('#objId').val();
		var url=$('#url').val();
		parent.layer.open({
     	  	type:2,
     	  	title:'查看',
     	  	area: ['100%','100%'],
     		shadeClose: false,
     		resize:false,
     	    anim: 1,
     		content:[url+"xshtdj/xiaoShouHTShowById.do?proj_Id="+objId,'yes']
   	  });
	});
	
	
	function dybb(){
		var uuid=$('#uuid').val();
		window.open("http://192.168.0.105:8075/webroot/decision/view/report?viewlet=xshtkp.cpt&uuid="+uuid);
	}

</script>
</body>
</html>