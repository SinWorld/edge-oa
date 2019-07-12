<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>销售发票开具新增页</title>
<link href="../login/css/xshtfp.css" rel="stylesheet"/>
<link rel="stylesheet" href="../layui-v2.5.4/layui/css/layui.css">
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@page isELIgnored="false" %>
<style>
  .bj{background-color: #F0F0F0}
 </style>
</head>
<body onload="refreshAndClose()">
<div class="m-xm_message_box">
	<div>
		<strong id="_field_xiaoShouHTMC">${xsht.proj_Name}</strong>
		<div class="oim-field u-header" style=" margin:10px 0 0 0px;">
             <label for="" class="oim-field_label u-f13">合同编号</label>
             <span class="oim-field_text-show u-f13" id="_field_xiangMuXXBH">
             	${xsht.proj_Code}
             </span>
         	 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             <label for="" class="oim-field_label u-f13">合同金额</label>
              <span class="u-num" id="_heTongJE" style="color:#666;">${xsht.cont_Amount}</span>
              <span class="u-rmb">元</span>
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             <label for="" class="oim-field_label u-f13">累计开票金额</label>
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
			<input type="hidden" id="XshtkpIds">
			<input type="hidden" id="objId" value="${xsht.proj_Info_Id}">
			<input type="hidden" id="xshtkp_dm">
			<input type="hidden" id="xmxxdm" value="${xmxx.proj_Id}">
			
			<div style="margin-left: 153px;">
				<div class="layui-btn-group">
				  <button type="button" class="layui-btn layui-btn-normal" onclick="add()">新增</button>
				  <button type="button" class="layui-btn layui-btn-normal" onclick="edit()">编辑</button>
				  <button type="button" class="layui-btn layui-btn-normal" onclick="deleteXshtkpById()">删除</button>
				  <button type="button" class="layui-btn layui-btn-normal" onclick="save()">保存</button>
				</div>
		 	</div>
		 	
			<div class="layui-form-item" style="margin-top: 20px;">
				
			</div>
			
			<div class="layui-form-item">
				<div class="layui-inline" style="left: 35px;top: 7px;">
				      <label class="layui-form-label" style="width: 90px;">客户名称</label>
				      <div class="layui-input-inline" style="width: 184px;">
				        <input type="text"  lay-verify="" autocomplete="off" class="layui-input bj" value="${xsht.cust_Unit}" disabled="">
				      </div>
			    </div>
			    
			    <div class="layui-inline" style="left: 66px;top: 15px;">
				      <label class="layui-form-label" style="width: 90px;">合同金额</label>
				      <div class="layui-input-inline" style="width: 180px;">
				        <input type="text"  lay-verify="" autocomplete="off" class="layui-input bj" value="${xsht.cont_Amount}" disabled="">
				        <span style="position: relative;top: -25px;right: -185px;">元</span>
				      </div>
			    </div>
				 
			    <div class="layui-inline" style="left:150px;top: 6px;">
				      <label class="layui-form-label" style="width: 90px;">签订日期</label>
				      <div class="layui-input-inline">
				        <input type="text"   lay-verify="" placeholder="yyyy-mm-dd" autocomplete="off" class="layui-input bj" value="${qdrq}" disabled="">
				      </div>
			    </div>
			 </div>
		 
			<div class="layui-form-item">
				<div class="layui-inline" style="left:49px;">
				      <label class="layui-form-label" style="width: 76px;">业务负责人</label>
				      <div class="layui-input-inline" style="width: 185px;">
				        <input type="text"  lay-verify="" autocomplete="off" class="layui-input bj" value="${xsht.user_Name}" disabled="">
				      </div>
			    </div>
			    
				<div class="layui-inline" style="left:73px;">
				  	<label class="layui-form-label" style="width: 96px;">进/销项</label>
					<div class="layui-input-inline" style="text-align: left;width: 180px;">
						<select name="xshtkp_dm_jxx" id="xshtkp_dm_jxx" lay-filter="xshtkp_dm_jxx" lay-verify="xshtkp_dm_jxx">
							<option value="" selected="selected">请选择进销项</option>
						</select>
					</div>
				 </div>
				 
				 <div class="layui-inline" style="left:190px;">
				  	<label class="layui-form-label" style="width:57px;">发票类别</label>
					<div class="layui-input-inline" style="text-align: left;width: 190px;">
						<select name="xshtkp_dm_fplb" id="xshtkp_dm_fplb" lay-filter="xshtkp_dm_fplb" lay-verify="xshtkp_dm_fplb">
							<option value="" selected="selected">请选择发票类别</option>
						</select>
					</div>
				 </div>
			 </div>
			 
		 	 <div class="layui-form-item">
		  		<div class="layui-inline" style="left:27px;">
				      <label class="layui-form-label" style="width:98px;">发票税率(%)</label>
				      <div class="layui-input-inline" style="width: 185px;">
				        <input type="text" id="xshtkp_fpsl" lay-verify="xshtkp_fpsl" autocomplete="off" class="layui-input bj" onchange="fpsl()" value="13.00">
				      </div>
			    </div>
			    
			    <div class="layui-inline" style="left:70px;">
				      <label class="layui-form-label" style="width: 76px;">发票编号</label>
				      <div class="layui-input-inline" style="width: 180px;">
				        <input type="text" id="xshtkp_fpbh" name="xshtkp_fpbh" lay-verify="xshtkp_fpbh" autocomplete="off" class="layui-input bj">
				      </div>
			    </div>
		     </div>
		     
		     <div class="layui-form-item">
				 <div class="layui-inline" style="left:36px;">
				      <label class="layui-form-label" style="width: 90px;">开票日期</label>
				      <div class="layui-input-inline">
				        <input type="text" name="xshtkp_kprq" id="xshtkp_kprq" lay-verify="xshtkp_kprq" placeholder="yyyy-mm-dd" autocomplete="off" class="layui-input bj" style="width: 185px;">
				      </div>
			    </div>
			    
			    <div class="layui-inline" style="left: 60px;top:9px;">
				      <label class="layui-form-label" style="width: 90px;">开票金额</label>
				      <div class="layui-input-inline" style="width: 180px;">
				        <input type="text" id="xshtkp_kpje" name="xshtkp_kpje" lay-verify="xshtkp_kpje" autocomplete="off" class="layui-input bj" onchange="kpje()">
				        <span style="position: relative;top: -25px;right: -185px;">元</span>
				      </div>
			    </div>
			    
			     <div class="layui-inline" style="left: 150px;top:8px;">
				      <label class="layui-form-label" style="width: 90px;">未税金额</label>
				      <div class="layui-input-inline" style="width: 180px;">
				        <input type="text" id="xshtkp_wsje" name="xshtkp_wsje" lay-verify="xshtkp_wsje" autocomplete="off" class="layui-input bj" disabled="">
				        <span style="position: relative;top: -25px;right: -185px;">元</span>
				      </div>
			    </div>
				 
			      <div class="layui-inline" style="left: 35px;top:10px;">
				      <label class="layui-form-label" style="width: 90px;">税金</label>
				      <div class="layui-input-inline" style="width: 180px;">
				        <input type="text" id="xshtkp_sj" name="xshtkp_sj" lay-verify="xshtkp_sj" autocomplete="off" class="layui-input bj" disabled="">
				        <span style="position: relative;top: -25px;right: -185px;">元</span>
				      </div>
			    </div>
			    
			     <div class="layui-inline" style="left: 70px;top:1px;">
				      <label class="layui-form-label" style="width: 90px;">登记人</label>
				      <div class="layui-input-inline" style="width: 180px;">
				        <input type="text" id="xshtkp_djr" name="xshtkp_djr" lay-verify="xshtkp_djr" autocomplete="off" class="layui-input bj" value="${userName}" disabled="">
				      </div>
			    </div>
			 </div>
		 
		     
			 <div class="layui-form-item layui-form-text">
			    <label class="layui-form-label" style="width: 120px;">备注</label>
			    <div class="layui-input-block">
			      <textarea placeholder="请输入内容" name="xshtkp_bz"  lay-verify="xshtkp_bz" id="xshtkp_bz" class="layui-textarea" style="width:952px;"></textarea>
			    </div>
			</div>
			
			<table class="layui-hide" id="test" lay-filter="test"></table>
		 	

			<div class="layui-form-item" style="text-align: center;">
			    <div class="layui-input-block">
			      <button class="layui-btn" type="button" id="tj" style="width:35%;margin-top:10px;margin-left: -200px;">立即提交</button>
			    </div>
			</div>
	</form>
 </div>
<script src="../layui-v2.5.4/layui/layui.js" charset="utf-8"></script>
<script type="text/javascript" src="../jquery/jquery-3.3.1.js"></script>
<script>
	layui.use(['form','layedit','laydate','element','table'], function(){
		  var layer = layui.layer;
		  var form = layui.form;
		  var layedit = layui.layedit;
		  var laydate = layui.laydate;
		  var element = layui.element;
		  var table = layui.table;
		  var url=$('#url').val();
		  laydate.render({
			elem: '#xshtkp_kprq'
		  });
		  allJXX(form);
		  allFPLB(form);
		  pageReady(form);
		  
		  table.render({
			    elem: '#test'
			    ,url:url+'xsfpkj/queryAllXshtkp.do'
			    ,cellMinWidth: 80 //全局定义常规单元格的最小宽度，layui 2.2.1 新增
			    ,totalRow: true
			    ,cols: [[
			       {type:'checkbox'}
			      ,{field:'index', width:60, title: '序号', sort: true,type:'numbers',totalRowText: '合计',unresize: true}
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
		  
		  //监听行工具事件 查看
		  table.on('row(test)', function(obj){
		    var data = obj.data;
		    var form = layui.form
		    //设置该数据主键
		    $('#xshtkp_dm').val(data.xshtkp_dm);
		    $('#xshtkp_dm_jxx').empty();
			$('#xshtkp_dm_fplb').empty();
			allJXX(form);
			allFPLB(form);
			//为表单赋值
			var jxxdm=data.xshtkp_dm_jxx;
			var fplb=data.xshtkp_dm_fplb;
			var fpbh=data.xshtkp_fpbh;
			var kprq=data.xshtkp_kprq;
			var kpje=data.xshtkp_kpje;
			var wsje=data.xshtkp_wsje;
			var sj=data.xshtkp_sj;
			var bz=data.xshtkp_bz;
			//遍历进销项下拉选
			var jxxs=$('#xshtkp_dm_jxx').find('option');
			for(var i=0;i<jxxs.length;i++){
				if(jxxs[i].value==jxxdm){
					jxxs[i].setAttribute("selected",'true');
					break;
				}
			}
			//遍历发票类别下拉选 //费用类型
			var fplbs=$('#xshtkp_dm_fplb').find('option');
			for(var i=0;i<fplbs.length;i++){
				if(fplbs[i].value==fplb){
					fplbs[i].setAttribute("selected",'true');
					break;
				}
			}
			//发票编号
			$('#xshtkp_fpbh').val(fpbh);
			//开票日期
			$('#xshtkp_kprq').val(kprq);
			//开票金额
			$('#xshtkp_kpje').val(kpje);
			//未税金额
			$('#xshtkp_wsje').val(wsje);
			//税金 
			$('#xshtkp_sj').val(sj);
			//备注
			$('#xshtkp_bz').val(bz);
			form.render('select');// 再次渲染select
		  });
		 
	});

	//ajax加载所有的进销项
	function allJXX(form){
		$.ajax({
			type : "post",
			url : "<c:url value='/xsfpkj/queryAllJXX.do'/>",
			async : false,
			dataType : 'json',
			error : function() {
				alert("出错");
			},
			success : function(msg) {
				$("#xshtkp_dm_jxx").append(
						"<option value=''>"+"请选择进销项"+"</option>");
				for (var i = 0; i < msg.length; i++) {
					$("#xshtkp_dm_jxx").append(
							"<option value='"+msg[i].jxx_dm+"'>"+ msg[i].jxx_mc +"</option>");
				}
				form.render('select');
			}
		});
	}

	//ajax加载所有的发票类别
	function allFPLB(form){
		$.ajax({
			type : "post",
			url : "<c:url value='/xsfpkj/queryAllFPLB.do'/>",
			async : false,
			dataType : 'json',
			error : function() {
				alert("出错");
			},
			success : function(msg) {
				$("#xshtkp_dm_fplb").append(
						"<option value=''>"+"请选择发票类别"+"</option>");
				for (var i = 0; i < msg.length; i++) {
					$("#xshtkp_dm_fplb").append(
							"<option value='"+msg[i].fplb_dm+"'>"+ msg[i].fplb_mc +"</option>");
				}
				form.render('select');
			}
		});
	}

	//发票税率带两位小数点
	function fpsl(){
		//获得合同金额输入的值
		var fpsl=$('#xshtkp_fpsl').val()*1;
		if(fpsl!=""){
			var sl=fpsl.toFixed(2); 
			$('#xshtkp_fpsl').val(sl);
		}else{
			$('#xshtkp_fpsl').val("0.00");
		}
	}

	//开票金额带两位小数点
	function kpje(){
		//获得合同金额输入的值
		var kpje=$('#xshtkp_kpje').val()*1;
		if(kpje!=""){
			var jsje=kpje/1.13;
			var je=kpje.toFixed(2); 
			var wsje=jsje.toFixed(2);
			var sj=je-wsje;
			var sje=sj.toFixed(2);
			$('#xshtkp_kpje').val(je);
			$('#xshtkp_wsje').val(wsje);
			$('#xshtkp_sj').val(sje);
		}else{
			$('#xshtkp_kpje').val("0.00");
			$('#xshtkp_wsje').val("0.00");
			$('#xshtkp_sj').val("0.00");
		}
	}

	//页面加载时 表单元素不可编辑
	function pageReady(form){
		$('#xshtkp_dm_jxx').attr("disabled","disabled");
		$('#xshtkp_dm_fplb').attr("disabled","disabled");
		$('#xshtkp_fpsl').attr("disabled",true);
		$('#xshtkp_fpbh').attr("disabled",true);
		$('#xshtkp_kprq').attr("disabled",true);
		$('#xshtkp_kpje').attr("disabled",true);
		$('#xshtkp_bz').attr("disabled",true);
		form.render('select');
	}

	//新增操作
	function add(){
		var form = layui.form;
		$('#xshtkp_dm').val("");
		$('#xshtkp_dm_jxx').attr("disabled",false);
		$('#xshtkp_dm_fplb').attr("disabled",false);
		$('#xshtkp_fpsl').attr("disabled",false);
		$('#xshtkp_fpbh').attr("disabled",false);
		$('#xshtkp_kprq').attr("disabled",false);
		$('#xshtkp_kpje').attr("disabled",false);
		$('#xshtkp_bz').attr("disabled",false);
		$('#xshtkp_fpsl').removeClass("bj");
		$('#xshtkp_fpbh').removeClass("bj");
		$('#xshtkp_kprq').removeClass("bj");
		$('#xshtkp_kpje').removeClass("bj");
		$('#xshtkp_bz').removeClass("bj");
		form.render('select');
		$('#xshtkp_dm_jxx').empty()
		$('#xshtkp_dm_fplb').empty();
		allJXX(form);
		allFPLB(form);
		$('#xshtkp_dm_jxx').val("");
		$('#xshtkp_dm_fplb').val("");
		$('#xshtkp_fpbh').val("");
		$('#xshtkp_kprq').val("");
		$('#xshtkp_kpje').val("");
		$('#xshtkp_bz').val("");
		//开票金额
		$('#xshtkp_kpje').val('');
		//备注
		$('#xshtkp_bz').val('');
	}

	//编辑操作
	function edit(){
		var form = layui.form;
		$('#xshtkp_dm_jxx').attr("disabled",false);
		$('#xshtkp_dm_fplb').attr("disabled",false);
		$('#xshtkp_fpsl').attr("disabled",false);
		$('#xshtkp_fpbh').attr("disabled",false);
		$('#xshtkp_kprq').attr("disabled",false);
		$('#xshtkp_kpje').attr("disabled",false);
		$('#xshtkp_bz').attr("disabled",false);
		$('#xshtkp_fpsl').removeClass("bj");
		$('#xshtkp_fpbh').removeClass("bj");
		$('#xshtkp_kprq').removeClass("bj");
		$('#xshtkp_kpje').removeClass("bj");
		$('#xshtkp_bz').removeClass("bj");
		form.render('select');
	}


	//ajax  保存操作 (若有报销记录则执行编辑操作，若无则执行新增操作)
	function save(){
		var form = layui.form;
		var url=$('#url').val();
		//获得主键
		var xshtkp_dm=$('#xshtkp_dm').val();
		//销售合同代码
		var xshtdm=$('#objId').val();
		//进销项
		var jxxdm=$('#xshtkp_dm_jxx').val();
		//发票类别
		var fplb=$('#xshtkp_dm_fplb').val();
		//发票税率
		var fpsl=$('#xshtkp_fpsl').val();
		//发票编号
		var fpbh=$('#xshtkp_fpbh').val();
		//开票日期
		var kprq=$('#xshtkp_kprq').val();
		//开票金额
		var kpje=$('#xshtkp_kpje').val();
		//未税金额 
		var wsje=$('#xshtkp_wsje').val();
		//税金
		var sj=$('#xshtkp_sj').val();
		//登记人
		var djr=$('#xshtkp_djr').val();
		//备注
		var bz=$('#xshtkp_bz').val();
		if(xshtkp_dm==""){
			//新增操作
			$.ajax({
				type : "post",
				url : "<c:url value='/xsfpkj/saveXshtkp.do'/>",
				async : false,
				dataType : 'json',
				error : function() {
					alert("出错");
				},
				data:{"xshtdm":xshtdm,"jxxdm":jxxdm,"fplb":fplb,
					  "fpsl":fpsl,"fpbh":fpbh,"kprq":kprq,
					  "kpje":kpje,"wsje":wsje,
					  "sj":sj,"djr":djr,"bz":bz},
				success : function(msg) {
					if(msg.flag){
						window.location.reload();
					}
				}
			});
		}else{
			//编辑操作
			$.ajax({
				type : "post",
				url : "<c:url value='/xsfpkj/editXshtkp.do'/>",
				async : false,
				dataType : 'json',
				error : function() {
					alert("出错");
				},
				data:{"xshtkp_dm":xshtkp_dm,"xshtkp_xshtdm":xshtdm,
					  "jxxdm":jxxdm,"fplb":fplb,"fpsl":fpsl,
					  "fpbh":fpbh,"kprq":kprq,"kpje":kpje,
					  "wsje":wsje,"sj":sj,"djr":djr,"bz":bz},
				success : function(msg) {
					if(msg.flag){
						window.location.reload();
					}
				}
			});
		}
	}

	//删除操作
	function deleteXshtkpById(){
		$('#XshtkpIds').val('');
		//获取所有复选框选中的数据
		var checkeds=layui.table.checkStatus('idTest').data;
		var xshtkpIds=$('#XshtkpIds');
		if(checkeds.length==0){
			layer.alert("请勾选需要删除的开票数据",{icon:7})
		}else{
			//取出其中的主键值
			for(var i=0;i<checkeds.length;i++){
				var xshtkpdm=checkeds[i].xshtkp_dm
				if(undefined!=xshtkpIds.value){
					xshtkpIds.value=xshtkpIds.value+","+xshtkpdm;
				}else{
					xshtkpIds.value=xshtkpdm;
				}
			}
			 $('#XshtkpIds').val(xshtkpIds.value);
			 layer.confirm('您确定要删除已勾选的开票记录吗？', {
				  btn: ['确定','取消'], //按钮
				  title:'提示',icon:7},function(index){
					  var ids= $('#XshtkpIds').val();
					  $.ajax({
							type : "post",
							url : "<c:url value='/xsfpkj/deleteXshtkpById.do'/>",
							async : false,
							dataType : 'json',
							error : function() {
								alert("出错");
							},
							data:{"ids":ids},
							success : function(msg) {
								if(msg.flag){
									window.location.reload();
								}
							}
						});
				  }
			);
		}
	}


	//提交表单
	$('#tj').click(function(){
		$('#XshtkpIds').val('');
		var xshtkpIds=$('#XshtkpIds');
		//获得表格数组
		var tables=layui.table.cache.idTest;
		var url=$('#url').val();
		//获取表单
		var form=document.getElementById("myForm");
		//获取合计行中的开票金额值
		var hjje=$('.layui-table-total .layui-table tr .laytable-cell-1-0-8').text();
		//获取剩余开票金额值
		var sykpje=$('#_shengYuKPJE').text();
		//合计开票金额不允许大于剩余开票金额
		if(hjje*1>sykpje*1){
			return layer.alert("本次开票金额不允许大于剩余开票金额",{icon:7});
		}
		if(tables.length==0){
			return layer.alert("请保存开票数据方可提交！！！",{icon:7})
		}else{
			//遍历该数组拼接主键字符串
			for(var i=0;i<tables.length;i++){
				var xshtkpdm=tables[i].xshtkp_dm;
				if(undefined!=xshtkpIds.value){
					xshtkpIds.value=xshtkpIds.value+","+xshtkpdm;
				}else{
					xshtkpIds.value=xshtkpdm;
				}
				//进销项
				var jxx=tables[i].xshtkp_dm_jxx;
				if(jxx==undefined){
					return layer.alert("第"+[i+1]+"行进销项为空，请填写！",{icon:7});
				}
				//发票类别
				var fplb=tables[i].xshtkp_dm_fplb;
				if(fplb==undefined){
					return layer.alert("第"+[i+1]+"行发票类别为空，请填写！",{icon:7});
				}
				//发票编号
				var fpbh=tables[i].xshtkp_fpbh;
				if(fpbh==undefined){
					return layer.alert("第"+[i+1]+"行发票编号为空，请填写！",{icon:7});
				}
				//开票日期
				var kprq=tables[i].xshtkp_kprq;
				if(kprq==undefined){
					return layer.alert("第"+[i+1]+"行开票日期为空，请填写！",{icon:7});
				}
				//开票金额
				var kpje=tables[i].xshtkp_kpje;
				if(kpje==undefined){
					return layer.alert("第"+[i+1]+"行开票金额为空，请填写！",{icon:7});
				}
			}
			 $('#XshtkpIds').val(xshtkpIds.value);
			 var xshtkpdms= $('#XshtkpIds').val();
			 form.action=url+"/xsfpkj/submitXshtkp.do?xshtkpdms="+xshtkpdms;
			 form.submit();
		}
	});

	function refreshAndClose(){
		var flag=$('#flag').val();
		if(flag){
			window.parent.location.reload();
			window.close();
		} 
	}
	
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
	
</script>
</body>
</html>