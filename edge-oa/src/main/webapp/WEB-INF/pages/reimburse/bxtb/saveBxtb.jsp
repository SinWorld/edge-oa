<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>报销填报</title>
<link rel="stylesheet" href="../layui-v2.4.5/layui/css/layui.css">
<link rel="stylesheet" href="../bootstrap-3.3.7-dist/css/bootstrap.min.css"> 
<link rel="stylesheet" href="../bootstrap-3.3.7-dist/css/bootstrap-theme.min.css"> 
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@page isELIgnored="false" %>
<style>
  .bj{background-color: #F0F0F0}
 </style>
</head>
<body onload="refreshAndClose()" style="width:100%;padding:0px; margin:0px;">
	<div style="width:1280px;height:auto;padding:0px; margin:0 auto;" id="main">
		<form class="layui-form" action="" method="post" id="myForm" style="margin-top: 30px;">
			<input type="hidden" id="url" value='<c:url value="/"/>'>
			<input type="hidden" id="flag" value="${flag}"> 
			<input type="hidden" id="reimbursement_dm">
			<input type="hidden" id="remiIds">
			
			<div style="margin-left: 120px;">
				<div class="layui-btn-group">
				  <button type="button" class="layui-btn layui-btn-normal" onclick="add()">新增</button>
				  <button type="button" class="layui-btn layui-btn-normal" onclick="edit()">编辑</button>
				  <button type="button" class="layui-btn layui-btn-normal" onclick="deleteReimById()">删除</button>
				  <button type="button" class="layui-btn layui-btn-normal" onclick="save()">保存</button>
				</div>
		 	</div>
		 	
			<div class="layui-form-item" style="margin-top: 20px;">
				<label class="layui-form-label" style="width: 120px;">项目名称</label>
				<div class="layui-input-inline" style="width: 1070px;text-align: left;">
					<select name="proj_dm"   id="proj_dm" lay-filter="proj_dm" lay-verify="proj_dm" lay-search="">
						<option value="" selected="selected">请选择所属项目</option>
					</select>
				</div>
			</div>
			
			<div class="layui-form-item">
			 	<div class="layui-inline" style="left:30px;">
				      <label class="layui-form-label" style="width: 90px;">审批编号</label>
				      <div class="layui-input-inline">
				        <input type="text" name="reimbursement_code" lay-verify="reimbursement_code" autocomplete="off" class="layui-input bj" id="reimbursement_code">
				      </div>
			    </div>
				<div class="layui-inline" style="left:12px;">
				  	<label class="layui-form-label" style="width: 95px;">费用类型</label>
					<div class="layui-input-inline" style="text-align: left;">
						<select name="reimbursement_dm_fylx" id="reimbursement_dm_fylx" lay-filter="reimbursement_dm_fylx" lay-verify="reimbursement_dm_fylx">
							<option value="" selected="selected">请选择费用类型</option>
						</select>
					</div>
				 </div>
				 
			    <div class="layui-inline" style="left:30px;">
				      <label class="layui-form-label" style="width: 90px;">发生日期</label>
				      <div class="layui-input-inline">
				        <input type="text" name="reimbursement_begintime" id="reimbursement_begintime" lay-verify="reimbursement_begintime" placeholder="yyyy-mm-dd" autocomplete="off" class="layui-input bj">
				      </div>
			    </div>
			     <div class="layui-inline" style="left: 35px;top: 7px;">
				      <label class="layui-form-label" style="width: 90px;">报销金额</label>
				      <div class="layui-input-inline" style="width: 130px;">
				        <input type="text" id="reimbursement_bxje" lay-verify="reimbursement_bxje" autocomplete="off" class="layui-input bj" onchange="bxjeChange()">
				        <span style="position: relative;top: -25px;right: -133px;">元</span>
				      </div>
			    </div>
			 </div>
		 
			<div class="layui-form-item">
				<div class="layui-inline" style="left:25px;">
				  	<label class="layui-form-label" style="width: 95px;">费用所属</label>
					<div class="layui-input-inline" style="text-align: left;">
						<select name="reimbursement_user_dm" id="reimbursement_user_dm" lay-filter="reimbursement_user_dm" lay-verify="reimbursement_user_dm">
							<option value="" selected="selected">请选择所属费用</option>
						</select>
					</div>
				 </div>
				 
			    <div class="layui-inline" style="left:27px;">
				      <label class="layui-form-label" style="width: 76px;">报销人</label>
				      <div class="layui-input-inline">
				        <input type="text" id="reimbursement_bxr" lay-verify="reimbursement_bxr" autocomplete="off" class="layui-input bj" value="${userName}">
				      </div>
			    </div>
			     <div class="layui-inline" style="left: 44px;top: 7px;">
				      <label class="layui-form-label" style="width: 90px;">审核金额</label>
				      <div class="layui-input-inline" style="width: 130px;">
				        <input type="text" id="reimbursement_shje" lay-verify="reimbursement_shje" autocomplete="off" class="layui-input bj" name="reimbursement_shje">
				        <span style="position: relative;top: -25px;right: -140px;">元</span>
				      </div>
			    </div>
			     <div class="layui-inline" style="left: 110px;top: 7px;">
				      <label class="layui-form-label" style="width: 90px;">发票金额</label>
				      <div class="layui-input-inline" style="width: 130px;">
				        <input type="text" id="reimbursement_fpje" lay-verify="reimbursement_fpje" autocomplete="off" class="layui-input bj" name="reimbursement_fpje">
				        <span style="position: relative;top: -25px;right: -132px;">元</span>
				      </div>
			    </div>
			 </div>
		 
			 <div class="layui-form-item layui-form-text">
			    <label class="layui-form-label" style="width: 120px;">费用明细</label>
			    <div class="layui-input-block">
			      <textarea placeholder="请输入内容" name="reimbursement_details"  lay-verify="reimbursement_details" id="reimbursement_details" class="layui-textarea bj" style="width:1070px;"></textarea>
			    </div>
			</div>
			
		 	<table class="layui-hide" id="test" lay-filter="test"></table>

			<div class="layui-form-item" style="text-align: center;">
			    <div class="layui-input-block">
			      <button class="layui-btn" type="button" id="tj" style="width:35%;margin-top:10px;">立即提交</button>
			    </div>
			</div>
	</form>
 </div>
<script src="../layui-v2.4.5/layui/layui.js" charset="utf-8"></script>
<script src="../jquery/jquery-3.3.1.js"></script>
<script>
layui.use(['form', 'layedit', 'laydate','table'], function(){
  var form = layui.form
  ,layer = layui.layer
  ,layedit = layui.layedit
  ,laydate = layui.laydate;
  var table = layui.table;
  var url=$('#url').val();
  form.render();
  //日期
  laydate.render({
    elem: '#reimbursement_begintime'
  });
  
  //创建一个编辑器
  var editIndex = layedit.build('LAY_demo_editor');
  
  table.render({
	    elem: '#test'
	    ,url:url+'bxtb/queryAllReimbursement.do'
	    ,cellMinWidth: 80 //全局定义常规单元格的最小宽度，layui 2.2.1 新增
	    ,totalRow: true
	    ,cols: [[
	       {type:'checkbox'}
	      ,{field:'index', width:60, title: '序号', sort: true,type:'numbers', totalRowText: '合计',unresize: true}
	      ,{field:'proj_name', width:180, title: '项目名称'}
	      ,{field:'reimbursement_code', width:200, title: '审批编号'}
	      ,{field:'fylx_name', width:100, title: '费用类型'}
	      ,{field:'reimbursement_begintime', width:120, title: '发生日期',templet:'<div>{{ layui.util.toDateString(d.reimbursement_begintime, "yyyy-MM-dd") }}</div>'}
	      ,{field:'reimbursement_bxje', width:100, title: '报销金额',totalRow: true}
	      ,{field:'reimbursement_user_name', width:100, title: '费用所属'}
	      ,{field:'reimbursement_bxr', width:100, title: '报销人'}
	      ,{field:'reimbursement_shje', width:100, title: '审核金额',totalRow: true}
	      ,{field:'reimbursement_fpje', width:100, title: '发票金额',totalRow: true}
	      ,{field:'reimbursement_submittime', width:120, title: '提交时间',templet:'<div>{{ layui.util.toDateString(d.reimbursement_submittime, "yyyy-MM-dd") }}</div>'}
	      ,{field:'reimbursement_details', width:320, title: '费用明细'}
	    ]]
  		  ,page: true
  		  ,id:'idTest'
	});
  
  //监听行工具事件 查看
  table.on('row(test)', function(obj){
    var data = obj.data;
    var form = layui.form
    //设置该数据主键
    $('#reimbursement_dm').val(data.reimbursement_dm);
    $('#proj_dm').empty();
	$('#reimbursement_dm_fylx').empty();
	$('#reimbursement_user_dm').empty();
    ylxXmXX(form);
    allfylx(form);
	//为表单赋值
	var xmxxdm=data.proj_dm;
	var spbh=data.reimbursement_code;
	var fylx=data.reimbursement_dm_fylx;
	var fsrq=data.reimbursement_begintime;
	var bxje=data.reimbursement_bxje;
	var fyss=data.reimbursement_user_dm;
	var bxr=data.reimbursement_bxr;
	var shje=data.reimbursement_shje;
	var fpje=data.reimbursement_fpje;
	var fymx=data.reimbursement_details;
	
	//遍历项目信息下拉选
	var xmxxs=$('#proj_dm').find('option');
	for(var i=0;i<xmxxs.length;i++){
		if(xmxxs[i].value==xmxxdm){
			xmxxs[i].setAttribute("selected",'true');
			break;
		}
	}
	//遍历费用类型下拉选 //费用类型
	var fyxls=$('#reimbursement_dm_fylx').find('option');
	for(var i=0;i<fyxls.length;i++){
		if(fyxls[i].value==fylx){
			fyxls[i].setAttribute("selected",'true');
			break;
		}
	}
	//审批编号
	$('#reimbursement_code').val(spbh);
	//发生日期
	$('#reimbursement_begintime').val(fsrq);
	//报销金额
	$('#reimbursement_bxje').val(bxje);
	//费用所属
	var fyssmc=data.reimbursement_user_name;
	var option = new Option(fyssmc,fyss);
	option.setAttribute("selected",'true');
	$('#reimbursement_user_dm').append(option);
	//报销人  
	$('#reimbursement_bxr').val(bxr);
	//审核金额
	$('#reimbursement_shje').val(shje);
	//发票金额
	$('#reimbursement_fpje').val(fpje);
	//费用明细
	$('#reimbursement_details').val(fymx);
	$('#proj_dm').attr("disabled","disabled");
	$('#reimbursement_code').attr("disabled",true);
	$('#reimbursement_dm_fylx').attr("disabled","disabled");
	$('#reimbursement_begintime').attr("disabled",true);
	$('#reimbursement_bxje').attr("disabled",true);
	$('#reimbursement_user_dm').attr("disabled","disabled");
	$('#reimbursement_bxr').attr("disabled",true);
	$('#reimbursement_shje').attr("disabled",true);
	$('#reimbursement_fpje').attr("disabled",true);
	$('#reimbursement_details').attr("disabled",true);
	form.render('select');// 再次渲染select
  });
  
  pageReady(form);
  
	//ajax实现下拉项目带出项目的负责人
		form.on('select(proj_dm)', function(data){
			//获得项目信息主键
			var xmxxdm=data.value;
			if(xmxxdm==""||xmxxdm==undefined){
				return;
			}
			//ajax根据Id查询项目信息并设置其它属性值
			$.ajax({
				type : "post",
				url : "<c:url value='/xshtdj/queryXMXXById.do'/>",
				async : false,
				dataType : 'json',
				data :{"proj_Id":xmxxdm},
				error : function() {
					alert("出错");
				},
				success : function(msg) {
					//设置我方负责人
					$("#reimbursement_user_dm").html('');
					$("#reimbursement_user_dm").append(
							"<option value='"+msg.xmxx.user_Id+"' selected='selected'>"+ msg.xmxx.user_Name +"</option>");
				}
			});
			 form.render('select');
		}); 
	});
  
	function refreshAndClose(){
		var flag=$('#flag').val();
		if(flag){
			window.parent.location.reload();
			window.close();
		} 
	}
	//页面加载时 表单元素不可编辑
	function pageReady(form){
		$('#proj_dm').attr("disabled","disabled");
		$('#reimbursement_code').attr("disabled",true);
		$('#reimbursement_dm_fylx').attr("disabled","disabled");
		$('#reimbursement_begintime').attr("disabled",true);
		$('#reimbursement_bxje').attr("disabled",true);
		$('#reimbursement_user_dm').attr("disabled","disabled");
		$('#reimbursement_bxr').attr("disabled",true);
		$('#reimbursement_shje').attr("disabled",true);
		$('#reimbursement_fpje').attr("disabled",true);
		$('#reimbursement_details').attr("disabled",true);
		form.render('select');
	}

	function add(){
		var form = layui.form;
		$('#reimbursement_dm').val("");
		$('#proj_dm').attr("disabled",false);
		$('#reimbursement_dm_fylx').attr("disabled",false);
		$('#reimbursement_begintime').attr("disabled",false);
		$('#reimbursement_bxje').attr("disabled",false);
		$('#reimbursement_fpje').attr("disabled",false);
		$('#reimbursement_details').attr("disabled",false);
		$('#reimbursement_begintime').removeClass("bj");
		$('#reimbursement_bxje').removeClass("bj");
		$('#reimbursement_fpje').removeClass("bj");
		$('#reimbursement_details').removeClass("bj");
		form.render('select');
		//ajax甚至编号和发生日期
		$.ajax({
			type : "post",
			url : "<c:url value='/bxtb/scbh.do'/>",
			async : false,
			dataType : 'json',
			error : function() {
				alert("出错");
			},
			success : function(msg) {
				$('#reimbursement_code').val(msg.bh);
				$('#reimbursement_begintime').val(msg.fsrq);
			}
		});
		
		$('#proj_dm').empty()
		$('#reimbursement_dm_fylx').empty();
		$('#reimbursement_user_dm').empty();
		ylxXmXX(form);
		allfylx(form);
		//报销金额
		$('#reimbursement_bxje').val('');
		//审核金额
		$('#reimbursement_shje').val('');
		//发票金额
		$('#reimbursement_fpje').val('');
		//费用明细
		$('#reimbursement_details').val('');
	}

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
				$("#proj_dm").append(
						"<option value=''>"+"请选择所属项目"+"</option>");
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
				$("#reimbursement_dm_fylx").append(
						"<option value=''>"+"请选择费用类型"+"</option>");
				for (var i = 0; i < msg.length; i++) {
					$("#reimbursement_dm_fylx").append(
							"<option value='"+msg[i].fylx_dm+"'>"+ msg[i].fylx_mc +"</option>");
				}
				form.render('select');
			}
		});
	}

	//报销金额带两位小数点
	function bxjeChange(){
		//获得报销金额输入的值
		var bxje=$('#reimbursement_bxje').val()*1;
		if(bxje!=""){
			var je=bxje.toFixed(2); 
			$('#reimbursement_bxje').val(je);
			//审核金额
			$('#reimbursement_shje').val(je);
			//发票金额
			$('#reimbursement_fpje').val(je);
		}else{
			$('#reimbursement_bxje').val("0.00");
			//审核金额
			$('#reimbursement_shje').val("0.00");
			//发票金额
			$('#reimbursement_fpje').val("0.00");
		}
	}

	//ajax  保存操作 (若有报销记录则执行编辑操作，若无则执行新增操作)
	function save(){
		var form = layui.form;
		var table = layui.table;
		var url=$('#url').val();
		//获得主键
		var rei_dm=$('#reimbursement_dm').val();
		//所属项目
		var xmxxdm=$('#proj_dm').val();
		//审批编号
		var spbh=$('#reimbursement_code').val();
		//费用类型
		var fylx=$('#reimbursement_dm_fylx').val();
		//发生日期
		var fsrq=$('#reimbursement_begintime').val();
		//报销金额
		var bxje=$('#reimbursement_bxje').val();
		//费用所属
		var fyss=$('#reimbursement_user_dm').val();
		//报销人  
		var bxr=$('#reimbursement_bxr').val();
		//审核金额
		var shje=$('#reimbursement_shje').val();
		//发票金额
		var fpje=$('#reimbursement_fpje').val();
		//费用明细
		var fymx=$('#reimbursement_details').val();
		if(rei_dm==""){
			//新增操作
			$.ajax({
				type : "post",
				url : "<c:url value='/bxtb/saveReimbursement.do'/>",
				async : false,
				dataType : 'json',
				error : function() {
					alert("出错");
				},
				data:{"xmxxdm":xmxxdm,"spbh":spbh,
					  "fylx":fylx,"fsrq":fsrq,"bxje":bxje,
					  "fyss":fyss,"bxr":bxr,"shje":shje,
					  "fpje":fpje,"fymx":fymx},
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
				url : "<c:url value='/bxtb/editReimbursement.do'/>",
				async : false,
				dataType : 'json',
				error : function() {
					alert("出错");
				},
				data:{"rei_dm":rei_dm,"xmxxdm":xmxxdm,
					  "fylx":fylx,"fsrq":fsrq,"bxje":bxje,
					  "fyss":fyss,"shje":shje,"fpje":fpje,"fymx":fymx},
				success : function(msg) {
					if(msg.flag){
						window.location.reload();
					}
				}
			});
		}
	}

	//编辑操作
	function edit(){
		var form = layui.form;
		$('#proj_dm').attr("disabled",false);
		$('#reimbursement_dm_fylx').attr("disabled",false);
		$('#reimbursement_begintime').attr("disabled",false);
		$('#reimbursement_bxje').attr("disabled",false);
		$('#reimbursement_fpje').attr("disabled",false);
		$('#reimbursement_details').attr("disabled",false);
		$('#reimbursement_begintime').removeClass("bj");
		$('#reimbursement_bxje').removeClass("bj");
		$('#reimbursement_fpje').removeClass("bj");
		$('#reimbursement_details').removeClass("bj");
		form.render('select');
	}

	//删除操作
	function deleteReimById(){
		$('#remiIds').val('');
		//获取所有复选框选中的数据
		var checkeds=layui.table.checkStatus('idTest').data;
		var remIds=$('#remiIds');
		if(checkeds.length==0){
			layer.alert("请勾选需要删除的填报信息",{icon:7})
		}else{
			//取出其中的主键值
			for(var i=0;i<checkeds.length;i++){
				var reImdm=checkeds[i].reimbursement_dm
				if(undefined!=remIds.value){
					remIds.value=remIds.value+","+reImdm;
				}else{
					remIds.value=reImdm;
				}
			}
			 $('#remiIds').val(remIds.value);
			 layer.confirm('您确定要删除已勾选的填报记录吗？', {
				  btn: ['确定','取消'], //按钮
				  title:'提示',icon:7},function(index){
					  var ReimbursementIds= $('#remiIds').val();
					  $.ajax({
							type : "post",
							url : "<c:url value='/bxtb/deleteReimById.do'/>",
							async : false,
							dataType : 'json',
							error : function() {
								alert("出错");
							},
							data:{"ReimbursementIds":ReimbursementIds},
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
	
	//表单验证
	function formChecked(){
		//获取所属项目
		var xmxx=$('#proj_dm').val();
		if(xmxx==""){
			return layer.alert("所属项目不能为空!",{icon:7});
		}
		//获取费用类型
		var fylx=$('#reimbursement_dm_fylx').val();
		if(fylx==""){
			return layer.alert("费用类型不能为空!",{icon:7});
		}
		//获取发生日期
		var fsrq=$('#reimbursement_begintime').val();
		if(fsrq==""){
			return layer.alert("发生日期不能为空!",{icon:7});
		}
		//获取报销金额
		var bxje=$('#reimbursement_bxje').val();
		if(bxje==""){
			return layer.alert("报销金额不能为空!",{icon:7});
		}
		//获取费用所属
		var fyss=$('#reimbursement_user_dm').val();
		if(fyss==""){
			return layer.alert("费用所属不能为空!",{icon:7});
		}
		//获取审核金额
		var shje=$('#reimbursement_shje').val();
		if(shje==""){
			return layer.alert("审核金额不能为空!",{icon:7});
		}
		//获取发票金额
		var fpje=$('#reimbursement_fpje').val();
		if(fpje==""){
			return layer.alert("发票金额不能为空!",{icon:7});
		}
	}

		//提交表单
		$('#tj').click(function(){
			$('#remiIds').val('');
			var remIds=$('#remiIds');
			//获得表格数组
			var tables=layui.table.cache.idTest;
			var url=$('#url').val();
			//获取表单
			var form=document.getElementById("myForm");
			if(tables.length==0){
				return layer.alert("请保存报销填报数据方可提交！！！",{icon:7})
			}else{
				//遍历该数组拼接主键字符串
				for(var i=0;i<tables.length;i++){
					var reImdm=tables[i].reimbursement_dm;
					if(undefined!=remIds.value){
						remIds.value=remIds.value+","+reImdm;
					}else{
						remIds.value=reImdm;
					}
					//费用所属
					var fyss=tables[i].reimbursement_dm_fylx;
					if(fyss==undefined){
						return layer.alert("第"+[i+1]+"行费用类型为空，请填写！",{icon:7});
					}
					//发生日期
					var fsrq=tables[i].reimbursement_begintime;
					if(fsrq==undefined){
						return layer.alert("第"+[i+1]+"行发生日期为空，请填写！",{icon:7});
					}
					//报销金额
					var bxje=tables[i].reimbursement_bxje;
					if(bxje==undefined){
						return layer.alert("第"+[i+1]+"行报销金额为空，请填写！",{icon:7});
					}
					//发票金额
					var fpje=tables[i].reimbursement_fpje;
					if(fpje==undefined){
						return layer.alert("第"+[i+1]+"行发票金额为空，请填写！",{icon:7});
					}
				}
				 $('#remiIds').val(remIds.value);
				 var remId= $('#remiIds').val();
				 form.action=url+"/bxtb/startBxtb.do?remId="+remId;
				 form.submit();
			}
		});
</script>
</body>
</html>