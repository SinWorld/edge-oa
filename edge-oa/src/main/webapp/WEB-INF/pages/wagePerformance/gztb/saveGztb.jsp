<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>工资填报</title>
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
			<input type="hidden" id="wage_per_Id">
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
			 	<div class="layui-inline" style="left:30px;">
				      <label class="layui-form-label" style="width: 90px;">审批编号</label>
				      <div class="layui-input-inline">
				        <input type="text" name="wage_per_Code" lay-verify="wage_per_Code" autocomplete="off" class="layui-input bj" id="wage_per_Code">
				      </div>
			    </div>
			    
			     <div class="layui-inline" style="left: 16px;">
			      <label class="layui-form-label">月份</label>
			      <div class="layui-input-inline">
			        <input type="text" class="layui-input bj" id="wage_per_Month" placeholder="yyyy-MM" name="wage_per_Month" style="width: 175px;">
			      </div>
			    </div>
			    
				<div class="layui-inline" style="left:12px;">
				  	<label class="layui-form-label" style="width: 95px;">姓名</label>
					<div class="layui-input-inline" style="text-align: left;">
						<select name="wage_per_Name" id="wage_per_Name" lay-filter="wage_per_Name" lay-verify="wage_per_Name">
							<option value="" selected="selected">请选择员工</option>
						</select>
					</div>
				 </div>
				 
			   <div class="layui-inline" style="left:12px;">
				  	<label class="layui-form-label" style="width: 95px;">部门</label>
					<div class="layui-input-inline" style="text-align: left;">
						<select name="wage_per_Department" id="wage_per_Department" lay-filter="wage_per_Department" lay-verify="wage_per_Department">
							<option value="" selected="selected">请选择所属部门</option>
						</select>
					</div>
				 </div>
				 
			     <div class="layui-inline" style="left:25px;">
				  	<label class="layui-form-label" style="width: 95px;">岗位</label>
					<div class="layui-input-inline" style="text-align: left;">
						<select name="wage_per_Position" id="wage_per_Position" lay-filter="wage_per_Position" lay-verify="wage_per_Position">
							<option value="" selected="selected">请选择所属岗位</option>
						</select>
					</div>
				 </div>
			 </div>
		 
			<div class="layui-form-item">
				 <div class="layui-inline" style="left:30px;">
				      <label class="layui-form-label" style="width: 90px;">基本工资</label>
				      <div class="layui-input-inline" style="width: 195px;">
				        <input type="text" id="wage_per_BaseWage" lay-verify="wage_per_BaseWage" autocomplete="off" class="layui-input bj" name="wage_per_BaseWage" style="width: 175px;" onchange="yfgzOrsfgzChange()">
				        <span style="position: relative;top: -25px;right: -175px;">元</span>
				      </div>
			    </div>
				 
			   <div class="layui-inline">
				      <label class="layui-form-label" style="width: 90px;">岗位工资</label>
				      <div class="layui-input-inline" style="width: 195px;">
				        <input type="text" id="wage_per_PositionWage" lay-verify="wage_per_PositionWage" autocomplete="off" class="layui-input bj" name="wage_per_PositionWage" style="width: 175px;"  onchange="yfgzOrsfgzChange()">
				        <span style="position: relative;top: -25px;right: -175px;">元</span>
				      </div>
			    </div>
			     <div class="layui-inline">
				      <label class="layui-form-label" style="width: 90px;">绩效奖金</label>
				      <div class="layui-input-inline" style="width: 195px;">
				        <input type="text" id="wage_per_AchievementBonus" lay-verify="wage_per_AchievementBonus" autocomplete="off" class="layui-input bj" name="wage_per_AchievementBonus" style="width: 175px;"  onchange="yfgzOrsfgzChange()">
				        <span style="position: relative;top: -25px;right: -175px;">元</span>
				      </div>
			    </div>
			     <div class="layui-inline">
				      <label class="layui-form-label" style="width: 90px;">加班工资</label>
				      <div class="layui-input-inline" style="width: 195px;">
				        <input type="text" id="wage_per_OverTimePay" lay-verify="wage_per_OverTimePay" autocomplete="off" class="layui-input bj" name="wage_per_OverTimePay" style="width: 175px;"  onchange="yfgzOrsfgzChange()">
				        <span style="position: relative;top: -25px;right: -175px;">元</span>
				      </div>
			    </div>
			    <br/>
			    <div class="layui-inline" style="left:-3px;">
				      <label class="layui-form-label" style="width:122px;">社保缴费<br/>基数</label>
				      <div class="layui-input-inline" style="width: 195px;">
				        <input type="text" id="wage_per_Sbjfjs" lay-verify="wage_per_Sbjfjs" autocomplete="off" class="layui-input bj" name="wage_per_Sbjfjs" style="width: 175px;">
				        <span style="position: relative;top: -25px;right: -175px;">元</span>
				      </div>
			    </div>
			     <div class="layui-inline" style="left:-18px;">
				      <label class="layui-form-label" style="width:77px;">电话费</label>
				      <div class="layui-input-inline" style="width: 195px;">
				        <input type="text" id="wage_per_dhf" lay-verify="wage_per_dhf" autocomplete="off" class="layui-input bj" name="wage_per_dhf" style="width: 175px;"  onchange="yfgzOrsfgzChange()">
				        <span style="position: relative;top: -25px;right: -175px;">元</span>
				      </div>
			    </div>
			 </div>
			 
			 
			 <div class="layui-form-item">
				 <div class="layui-inline" style="left:30px;">
				      <label class="layui-form-label" style="width:90px;">社保个人部分</label>
				      <div class="layui-input-inline" style="width: 195px;">
				        <input type="text" id="wage_per_Sbgrbf" lay-verify="wage_per_Sbgrbf" autocomplete="off" class="layui-input bj" name="wage_per_Sbgrbf" style="width: 175px;">
				        <span style="position: relative;top: -25px;right: -175px;">元</span>
				      </div>
			    </div>
				 
			   <div class="layui-inline">
				      <label class="layui-form-label" style="width:90px;">社保单位部分</label>
				      <div class="layui-input-inline" style="width: 195px;">
				        <input type="text" id="wage_per_Sbdwbf" lay-verify="wage_per_Sbdwbf" autocomplete="off" class="layui-input bj" name="wage_per_Sbdwbf" style="width: 175px;">
				        <span style="position: relative;top: -25px;right: -175px;">元</span>
				      </div>
			    </div>
			     <div class="layui-inline">
				      <label class="layui-form-label" style="width: 90px;">社保补贴</label>
				      <div class="layui-input-inline" style="width: 195px;">
				        <input type="text" id="wage_per_Sbbt" lay-verify="wage_per_Sbbt" autocomplete="off" class="layui-input bj" name="wage_per_Sbbt" style="width: 175px;"  onchange="yfgzOrsfgzChange()">
				        <span style="position: relative;top: -25px;right: -175px;">元</span>
				      </div>
			    </div>
			     <div class="layui-inline">
				      <label class="layui-form-label" style="width: 90px;">其它</label>
				      <div class="layui-input-inline" style="width: 195px;">
				        <input type="text" id="wage_per_Qt" lay-verify="wage_per_Qt" autocomplete="off" class="layui-input bj" name="wage_per_Qt" style="width: 175px;"  onchange="yfgzOrsfgzChange()">
				        <span style="position: relative;top: -25px;right: -175px;">元</span>
				      </div>
			    </div>
			    <br/>
			    <div class="layui-inline" style="left:-3px;">
				      <label class="layui-form-label" style="width:122px;">应发工资</label>
				      <div class="layui-input-inline" style="width: 195px;">
				        <input type="text" id="wage_per_Yfgz" lay-verify="wage_per_Yfgz" autocomplete="off" class="layui-input bj" name="wage_per_Yfgz" style="width: 175px;">
				        <span style="position: relative;top: -25px;right: -175px;">元</span>
				      </div>
			    </div>
			 </div>
			 
			 
			 <div class="layui-form-item">
				 <div class="layui-inline" style="left:30px;">
				      <label class="layui-form-label" style="width:90px;">未出勤扣款</label>
				      <div class="layui-input-inline" style="width: 195px;">
				        <input type="text" id="wage_per_Wcqkk" lay-verify="wage_per_Wcqkk" autocomplete="off" class="layui-input bj" name="wage_per_Wcqkk" style="width: 175px;" onchange="yfgzOrsfgzChange()">
				        <span style="position: relative;top: -25px;right: -175px;">元</span>
				      </div>
			    </div>
				 
			   <div class="layui-inline">
				      <label class="layui-form-label" style="width:90px;">其它扣款</label>
				      <div class="layui-input-inline" style="width: 195px;">
				        <input type="text" id="wage_per_Qtkk" lay-verify="wage_per_Qtkk" autocomplete="off" class="layui-input bj" name="wage_per_Qtkk" style="width: 175px;" onchange="yfgzOrsfgzChange()">
				        <span style="position: relative;top: -25px;right: -175px;">元</span>
				      </div>
			    </div>
			     <div class="layui-inline">
				      <label class="layui-form-label" style="width: 90px;">社保代扣</label>
				      <div class="layui-input-inline" style="width: 195px;">
				        <input type="text" id="wage_per_Sbdk" lay-verify="wage_per_Sbdk" autocomplete="off" class="layui-input bj" name="wage_per_Sbdk" style="width: 175px;" onchange="yfgzOrsfgzChange()">
				        <span style="position: relative;top: -25px;right: -175px;">元</span>
				      </div>
			    </div>
			     <div class="layui-inline">
				      <label class="layui-form-label" style="width: 90px;">个税代扣</label>
				      <div class="layui-input-inline" style="width: 195px;">
				        <input type="text" id="wage_per_Gsdk" lay-verify="wage_per_Gsdk" autocomplete="off" class="layui-input bj" name="wage_per_Gsdk" style="width: 175px;" onchange="yfgzOrsfgzChange()">
				        <span style="position: relative;top: -25px;right: -175px;">元</span>
				      </div>
			    </div>
			    <br/>
			    <div class="layui-inline" style="left:-3px;">
				      <label class="layui-form-label" style="width:122px;">实发工资</label>
				      <div class="layui-input-inline" style="width: 195px;">
				        <input type="text" id="wage_per_Sfgz" lay-verify="wage_per_Sfgz" autocomplete="off" class="layui-input bj" name="wage_per_Sfgz" style="width: 175px;">
				        <span style="position: relative;top: -25px;right: -175px;">元</span>
				      </div>
			    </div>
			 </div>
			 
			 
			  <div class="layui-form-item">
				  <div class="layui-inline" style="left:25px;">
				  	<label class="layui-form-label" style="width: 95px;">员工类型</label>
					<div class="layui-input-inline" style="text-align: left;width: 174px;">
						<select name="wage_per_Yglx" id="wage_per_Yglx" lay-filter="wage_per_Yglx" lay-verify="wage_per_Yglx">
							<option value="" selected="selected">请选择员工类型</option>
						</select>
					</div>
				 </div>
				 <div class="layui-inline" style="left:17px;">
				      <label class="layui-form-label" style="width: 90px;">填报人</label>
				      <div class="layui-input-inline">
				        <input type="text" name="wage_per_Tbr" lay-verify="wage_per_Tbr" autocomplete="off" class="layui-input bj" id="wage_per_Tbr" style="width: 173px;" value="${userName}">
				      </div>
			    </div>
			 </div>
		 
			 <div class="layui-form-item layui-form-text">
			    <label class="layui-form-label" style="width: 120px;">备注</label>
			    <div class="layui-input-block">
			      <textarea placeholder="请输入内容" name="wage_per_Bz"  lay-verify="wage_per_Bz" id="wage_per_Bz" class="layui-textarea bj" style="width:1070px;"></textarea>
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
    elem: '#wage_per_Month'
    ,type: 'month'
  });
  
  //创建一个编辑器
  var editIndex = layedit.build('LAY_demo_editor');
  
  table.render({
	    elem: '#test'
	    ,url:url+'wage/queryMyGZJLS.do'
	    ,cellMinWidth: 80 //全局定义常规单元格的最小宽度，layui 2.2.1 新增
	    ,totalRow: true
	    ,cols: [[
	       {type:'checkbox'}
	      ,{field:'index', width:60, title: '序号', sort: true,type:'numbers',totalRowText: '合计',unresize: true}
	      ,{field:'wage_per_Code', width:200, title: '审批编号'}
	      ,{field:'wage_per_Month', width:100, title: '月份',templet:'<div>{{ layui.util.toDateString(d.reimbursement_begintime, "yyyy-MM") }}</div>'}
	      ,{field:'user_Name', width:100, title: '姓名'}
	      ,{field:'user_Department', width:150, title: '部门名称'}
	      ,{field:'user_Posittion', width:150, title: '职位'}
	      ,{field:'wage_per_BaseWage', width:150, title: '基本工资'}
	      ,{field:'wage_per_PositionWage', width:150, title: '岗位工资'}
	      ,{field:'wage_per_AchievementBonus', width:150, title: '绩效奖金'}
	      ,{field:'wage_per_OverTimePay', width:150, title: '加班工资'}
	      ,{field:'wage_per_Sbjfjs', width:150, title: '社保缴费基数'}
	      ,{field:'wage_per_dhf', width:150, title: '电话费'}
	      ,{field:'wage_per_Sbgrbf', width:150, title: '社保个人部分'}
	      ,{field:'wage_per_Sbdwbf', width:150, title: '社保单位部分'}
	      ,{field:'wage_per_Sbbt', width:120, title: '社保补贴'}
	      ,{field:'wage_per_Qt', width:120, title: '其它'}
	      ,{field:'wage_per_Yfgz', width:120, title: '应发工资',totalRow: true}
	      ,{field:'wage_per_Wcqkk', width:120, title: '未出勤扣款'}
	      ,{field:'wage_per_Qtkk', width:120, title: '其它扣款'}
	      ,{field:'wage_per_Sbdk', width:120, title: '社保代扣'}
	      ,{field:'wage_per_Gsdk', width:120, title: '个税代扣'}
	      ,{field:'wage_per_Sfgz', width:120, title: '实发工资',totalRow: true}
	      ,{field:'yglx_name', width:120, title: '员工类型'}
	      ,{field:'wage_per_Tbr', width:120, title: '填报人'}
	      ,{field:'wage_per_Bz', width:320, title: '备注'}
	    ]]
  		  ,page: false
  		  ,id:'idTest'
	});
  
  //监听行工具事件 查看
  table.on('row(test)', function(obj){
    var data = obj.data;
    var form = layui.form
    //设置该数据主键
    $('#wage_per_Id').val(data.wage_per_Id);
    $('#wage_per_Name').empty();
	$('#wage_per_Department').empty();
	$('#wage_per_Position').empty();
	$('#wage_per_Yglx').empty();
	allYG(form);
	allYGLX(form);
	//为表单赋值
	var spbh=data.wage_per_Code;
	var yf=data.wage_per_Month;
	var yg=data.wage_per_Name;
	var bm=data.wage_per_Department;
	var gw=data.wage_per_Position;
	var jbgz=data.wage_per_BaseWage;
	var gwgz=data.wage_per_PositionWage;
	var jxjj=data.wage_per_AchievementBonus;
	var jiabangz=data.wage_per_OverTimePay;
	var sbjfjs=data.wage_per_Sbjfjs;
	var sbgrbf=data.wage_per_Sbgrbf;
	var sbdwbf=data.wage_per_Sbdwbf;
	var sbbt=data.wage_per_Sbbt;
	var qt=data.wage_per_Qt;
	var yfgz=data.wage_per_Yfgz;
	var wcqkk=data.wage_per_Wcqkk;
	var qtkk=data.wage_per_Qtkk;
	var sbdk=data.wage_per_Sbdk;
	var gsdk=data.wage_per_Gsdk;
	var sfgz=data.wage_per_Sfgz;
	var yglx=data.wage_per_Yglx;
	var bz=data.wage_per_Bz;
	var dhf=data.wage_per_dhf;
	//遍历员工下拉选
	var ygs=$('#wage_per_Name').find('option');
	for(var i=0;i<ygs.length;i++){
		if(ygs[i].value==yg){
			ygs[i].setAttribute("selected",'true');
			break;
		}
	}
	//遍历员工类型下拉选
	var yglxs=$('#wage_per_Yglx').find('option');
	for(var i=0;i<yglxs.length;i++){
		if(yglxs[i].value==yglx){
			yglxs[i].setAttribute("selected",'true');
			break;
		}
	}
	$('#wage_per_Code').val(spbh);
	$('#wage_per_Month').val(yf);
	$('#wage_per_BaseWage').val(jbgz);
	$('#wage_per_PositionWage').val(gwgz);
	$('#wage_per_AchievementBonus').val(jxjj);
	$('#wage_per_OverTimePay').val(jiabangz);
	$('#wage_per_Sbjfjs').val(sbjfjs);
	$('#wage_per_Sbgrbf').val(sbgrbf);
	$('#wage_per_Sbdwbf').val(sbdwbf);
	$('#wage_per_Sbbt').val(sbbt);
	$('#wage_per_Qt').val(qt);
	$('#wage_per_Yfgz').val(yfgz);
	$('#wage_per_Wcqkk').val(wcqkk);
	$('#wage_per_Qtkk').val(qtkk);
	$('#wage_per_Sbdk').val(sbdk);
	$('#wage_per_Gsdk').val(gsdk);
	$('#wage_per_Sfgz').val(sfgz);
	$('#wage_per_Bz').val(bz);
	$('#wage_per_dhf').val(dhf);
	$("#wage_per_Department").append(
			"<option value='"+data.wage_per_Department+"' selected='selected'>"+ data.user_Department +"</option>");
	$("#wage_per_Position").append(
			"<option value='"+data.wage_per_Position+"' selected='selected'>"+ data.user_Posittion +"</option>");
	form.render('select');// 再次渲染select
  });
  
  pageReady(form);
  
	//ajax实现下拉姓名带出用户的部门和岗位
	form.on('select(wage_per_Name)', function(data){
			var yhDM=$('#wage_per_Name').val();
			$.ajax({
				type : "post",
				url : "<c:url value='/wage/queryUserBMandGW.do'/>",
				async : false,
				data:{"yhDM":yhDM},
				dataType : 'json',
				error : function() {
					alert("出错");
				},
				success : function(msg) {
						$("#wage_per_Department").append(
								"<option value='"+msg.department.dep_id+"' selected='selected'>"+ msg.department.dep_name +"</option>");
						$("#wage_per_Position").append(
								"<option value='"+msg.posittion.posittion_dm+"' selected='selected'>"+ msg.posittion.posittion_mc +"</option>");
						form.render('select');
				}
			});
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
		$('#wage_per_Code').attr("disabled",true);
		$('#wage_per_Month').attr("disabled",true);
		$('#wage_per_Name').attr("disabled","disabled");
		$('#wage_per_Department').attr("disabled","disabled");
		$('#wage_per_Position').attr("disabled","disabled");
		$('#wage_per_BaseWage').attr("disabled",true);
		$('#wage_per_PositionWage').attr("disabled",true);
		$('#wage_per_AchievementBonus').attr("disabled",true);
		$('#wage_per_OverTimePay').attr("disabled",true);
		$('#wage_per_Sbjfjs').attr("disabled",true);
		$('#wage_per_Sbgrbf').attr("disabled",true);
		$('#wage_per_Sbdwbf').attr("disabled",true);
		$('#wage_per_Sbbt').attr("disabled",true);
		$('#wage_per_Qt').attr("disabled",true);
		$('#wage_per_Yfgz').attr("disabled",true);
		$('#wage_per_Wcqkk').attr("disabled",true);
		$('#wage_per_Qtkk').attr("disabled",true);
		$('#wage_per_Sbdk').attr("disabled",true);
		$('#wage_per_Gsdk').attr("disabled",true);
		$('#wage_per_Sfgz').attr("disabled",true);
		$('#wage_per_Yglx').attr("disabled","disabled");
		$('#wage_per_Tbr').attr("disabled",true);
		$('#wage_per_Bz').attr("disabled",true);
		$('#wage_per_dhf').attr("disabled",true);
		form.render('select');
	}

	function add(){
		var form = layui.form;
		$('#wage_per_Id').val("");
		$('#wage_per_Month').attr("disabled",false);
		$('#wage_per_Name').attr("disabled",false);
		$('#wage_per_Department').attr("disabled","disabled");
		$('#wage_per_Position').attr("disabled","disabled");
		$('#wage_per_BaseWage').attr("disabled",false);
		$('#wage_per_PositionWage').attr("disabled",false);
		$('#wage_per_AchievementBonus').attr("disabled",false);
		$('#wage_per_OverTimePay').attr("disabled",false);
		$('#wage_per_Sbjfjs').attr("disabled",false);
		$('#wage_per_Sbgrbf').attr("disabled",false);
		$('#wage_per_Sbdwbf').attr("disabled",false);
		$('#wage_per_Sbbt').attr("disabled",false);
		$('#wage_per_Qt').attr("disabled",false);
		$('#wage_per_Wcqkk').attr("disabled",false);
		$('#wage_per_Qtkk').attr("disabled",false);
		$('#wage_per_Sbdk').attr("disabled",false);
		$('#wage_per_Gsdk').attr("disabled",false);
		$('#wage_per_Yglx').attr("disabled",false);
		$('#wage_per_Bz').attr("disabled",false);
		$('#wage_per_dhf').attr("disabled",false);
		$('#wage_per_Month').removeClass("bj");
		$('#wage_per_BaseWage').removeClass("bj");
		$('#wage_per_PositionWage').removeClass("bj");
		$('#wage_per_AchievementBonus').removeClass("bj");
		$('#wage_per_OverTimePay').removeClass("bj");
		$('#wage_per_AchievementBonus').removeClass("bj");
		$('#wage_per_Sbjfjs').removeClass("bj");
		$('#wage_per_Sbgrbf').removeClass("bj");
		$('#wage_per_Sbdwbf').removeClass("bj");
		$('#wage_per_Sbbt').removeClass("bj");
		$('#wage_per_Qt').removeClass("bj");
		$('#wage_per_Wcqkk').removeClass("bj");
		$('#wage_per_Qtkk').removeClass("bj");
		$('#wage_per_Sbdk').removeClass("bj");
		$('#wage_per_Gsdk').removeClass("bj");
		$('#wage_per_Bz').removeClass("bj");
		$('#wage_per_dhf').removeClass("bj");
		$('#wage_per_Month').val(new Date());
		$('#wage_per_BaseWage').val("1550.00");
		$('#wage_per_Sbjfjs').val("2711.24");
		$('#wage_per_Sbgrbf').val("284.68");
		$('#wage_per_Sbdwbf').val("681.97");
		$('#wage_per_PositionWage').val("0.00");
		$('#wage_per_AchievementBonus').val("0.00");
		$('#wage_per_OverTimePay').val("0.00");
		$('#wage_per_dhf').val("0.00");
		$('#wage_per_Sbbt').val("0.00");
		$('#wage_per_Qt').val("0.00");
		$('#wage_per_Yfgz').val("0.00");
		$('#wage_per_Wcqkk').val("0.00");
		$('#wage_per_Qtkk').val("0.00");
		$('#wage_per_Sbdk').val("284.68");
		$('#wage_per_Gsdk').val("0.00");
		$('#wage_per_Sfgz').val("0.00");
		form.render('select');
		//ajax甚至编号和发生日期
		$.ajax({
			type : "post",
			url : "<c:url value='/wage/setBh.do'/>",
			async : false,
			dataType : 'json',
			error : function() {
				alert("出错");
			},
			success : function(msg) {
				$('#wage_per_Code').val(msg.bh);
			}
		});
		allYG(form);
		allYGLX(form);
	}

	//ajax加载所有的员工
	function allYG(form){
		$.ajax({
			type : "post",
			url : "<c:url value='/wage/querAllUser.do'/>",
			async : false,
			dataType : 'json',
			error : function() {
				alert("出错");
			},
			success : function(msg) {
				for (var i = 0; i < msg.length; i++) {
					$("#wage_per_Name").append(
							"<option value='"+msg[i].user_id+"'>"+ msg[i].user_name +"</option>");
				}
				form.render('select');
			}
		});
	}
	
	//ajax加载所有的员工类型
	function allYGLX(form){
		$.ajax({
			type : "post",
			url : "<c:url value='/wage/queryAllYGLX.do'/>",
			async : false,
			dataType : 'json',
			error : function() {
				alert("出错");
			},
			success : function(msg) {
				for (var i = 0; i < msg.length; i++) {
					$("#wage_per_Yglx").append(
							"<option value='"+msg[i].yglx_dm+"'>"+ msg[i].yglx_mc +"</option>");
				}
				form.render('select');
			}
		});
	}

	

	//应发工资、实发工资计算
	function yfgzOrsfgzChange(){
		//获得基本工资
		var jbgz=$('#wage_per_BaseWage').val()*1;
		var jbgzs=$('#wage_per_BaseWage').val(jbgz.toFixed(2)).val();
		//获得岗位工资
		var gwgz=$('#wage_per_PositionWage').val()*1
		var gwgzs=$('#wage_per_PositionWage').val(gwgz.toFixed(2)).val();
		//获得绩效奖金
		var jxjj=$('#wage_per_AchievementBonus').val()*1;
		var jxjjs=$('#wage_per_AchievementBonus').val(jxjj.toFixed(2)).val();
		//获得加班工资
		var jiabangz=$('#wage_per_OverTimePay').val()*1;
		var jiabangzs=$('#wage_per_OverTimePay').val(jiabangz.toFixed(2)).val();
		//获得社保补贴
		var sbbt=$('#wage_per_Sbbt').val()*1
		var sbbts=$('#wage_per_Sbbt').val(sbbt.toFixed(2)).val();
		//获得其它
		var qt=$('#wage_per_Qt').val()*1
		var qts=$('#wage_per_Qt').val(qt.toFixed(2)).val();
		//获得电话费
		var dhf=$('#wage_per_dhf').val()*1
		var dhfs=$('#wage_per_dhf').val(dhf.toFixed(2)).val();
		
		//获得应发工资
		var yfgz=$('#wage_per_Yfgz').val()*1;
		//获得未出勤扣款
		var wcqkk=$('#wage_per_Wcqkk').val()*1
		var wcqkks=$('#wage_per_Wcqkk').val(wcqkk.toFixed(2)).val();
		//获得其它扣款
		var qtkk=$('#wage_per_Qtkk').val()*1;
		var qtkks=$('#wage_per_Qtkk').val(qtkk.toFixed(2)).val();
		//获得社保代扣
		var sbdk=$('#wage_per_Sbdk').val()*1;
		var sbdks=$('#wage_per_Sbdk').val(sbdk.toFixed(2)).val();
		//获得个税代扣
		var gsdk=$('#wage_per_Gsdk').val()*1
		var gsdks=$('#wage_per_Gsdk').val(gsdk.toFixed(2)).val();
		//ajax计算应发工资、实发工资
		$.ajax({
			type : "post",
			url : "<c:url value='/wage/yfgzOrsfgzjs.do'/>",
			async : false,
			dataType : 'json',
			error : function() {
				alert("出错");
			},
			data:{"jbgzs":jbgzs,"gwgzs":gwgzs,
				  "jxjjs":jxjjs,"jiabangzs":jiabangzs,
				  "sbbts":sbbts,"qts":qts,"dhfs":dhfs,
				  "yfgz":yfgz,"wcqkks":wcqkks,"qtkks":qtkks,
				  "sbdks":sbdks,"gsdks":gsdks},
			success : function(msg) {
				$('#wage_per_Yfgz').val(msg.yfgzs);
				$('#wage_per_Sfgz').val(msg.sfgz);
			}
		});
	}
	

	//ajax  保存操作 (若有报销记录则执行编辑操作，若无则执行新增操作)
	function save(){
		var form = layui.form;
		var table = layui.table;
		var url=$('#url').val();
		//获得主键
		var rei_dm=$('#wage_per_Id').val();
		//审批编号
		var spbh=$('#wage_per_Code').val();
		//月份
		var yf=$('#wage_per_Month').val();
		//员工
		var yg=$('#wage_per_Name').val();
		//所属部门
		var bm=$('#wage_per_Department').val();
		//所属岗位
		var gw=$('#wage_per_Position').val();
		//基本工资
		var jbgz=$('#wage_per_BaseWage').val();
		//岗位工资
		var gwgz=$('#wage_per_PositionWage').val();
		//绩效奖金
		var jxjj=$('#wage_per_AchievementBonus').val();
		//加班工资
		var jiabangz=$('#wage_per_OverTimePay').val();
		//社保缴费基数
		var sbjfjs=$('#wage_per_Sbjfjs').val();
		//电话费
		var dhf=$('#wage_per_dhf').val();
		//社保个人部分
		var sbgrbf=$('#wage_per_Sbgrbf').val();
		//社保单位部分
		var sbdwbf=$('#wage_per_Sbdwbf').val();
		//社保补贴
		var sbbt=$('#wage_per_Sbbt').val();
		//其它
		var qt=$('#wage_per_Qt').val();
		//应发工资
		var yfgz=$('#wage_per_Yfgz').val();
		//未出勤扣款
		var wcqkk=$('#wage_per_Wcqkk').val();
		//其他扣款
		var qtkk=$('#wage_per_Qtkk').val();
		//社保代扣
		var sbdk=$('#wage_per_Sbdk').val();
		//个税代扣
		var gsdk=$('#wage_per_Gsdk').val();
		//实发工资
		var sfgz=$('#wage_per_Sfgz').val();
		//员工类型
		var yglx=$('#wage_per_Yglx').val();
		//填报人
		var tbr=$('#wage_per_Tbr').val();
		//备注
		var bz=$('#wage_per_Bz').val();
		if(rei_dm==""){
			//新增操作
			$.ajax({
				type : "post",
				url : "<c:url value='/wage/saveWage.do'/>",
				async : false,
				dataType : 'json',
				error : function() {
					alert("出错");
				},
				data:{"spbh":spbh,"yf":yf,"yg":yg,"bm":bm,"gw":gw,
					  "jbgz":jbgz,"gwgz":gwgz,"jxjj":jxjj,"jiabangz":jiabangz,
					  "sbjfjs":sbjfjs,"dhf":dhf,"sbgrbf":sbgrbf,"sbdwbf":sbdwbf,
					  "sbbt":sbbt,"qt":qt,"yfgz":yfgz,"wcqkk":wcqkk,
					  "qtkk":qtkk,"sbdk":sbdk,"gsdk":gsdk, "sfgz":sfgz,
					  "yglx":yglx,"tbr":tbr,"bz":bz},
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
				url : "<c:url value='/wage/editWage.do'/>",
				async : false,
				dataType : 'json',
				error : function() {
					alert("出错");
				},
				data:{"rei_dm":rei_dm,"spbh":spbh,"yf":yf,"yg":yg,"bm":bm,"gw":gw,
					  "jbgz":jbgz,"gwgz":gwgz,"jxjj":jxjj,"jiabangz":jiabangz,
					  "sbjfjs":sbjfjs,"dhf":dhf,"sbgrbf":sbgrbf,"sbdwbf":sbdwbf,
					  "sbbt":sbbt,"qt":qt,"yfgz":yfgz,"wcqkk":wcqkk,
					  "qtkk":qtkk,"sbdk":sbdk,"gsdk":gsdk, "sfgz":sfgz,
					  "yglx":yglx,"tbr":tbr,"bz":bz},
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
		$('#wage_per_Month').attr("disabled",false);
		$('#wage_per_Name').attr("disabled",false);
		$('#wage_per_BaseWage').attr("disabled",false);
		$('#wage_per_PositionWage').attr("disabled",false);
		$('#wage_per_AchievementBonus').attr("disabled",false);
		$('#wage_per_OverTimePay').attr("disabled",false);
		$('#wage_per_Sbjfjs').attr("disabled",false);
		$('#wage_per_dhf').attr("disabled",false);
		$('#wage_per_Sbgrbf').attr("disabled",false);
		$('#wage_per_Sbdwbf').attr("disabled",false);
		$('#wage_per_Sbbt').attr("disabled",false);
		$('#wage_per_Qt').attr("disabled",false);
		$('#wage_per_Wcqkk').attr("disabled",false);
		$('#wage_per_Qtkk').attr("disabled",false);
		$('#wage_per_Sbdk').attr("disabled",false);
		$('#wage_per_Gsdk').attr("disabled",false);
		$('#wage_per_Yglx').attr("disabled",false);
		$('#wage_per_Bz').attr("disabled",false);
		$('#wage_per_Month').removeClass("bj");
		$('#wage_per_BaseWage').removeClass("bj");
		$('#wage_per_PositionWage').removeClass("bj");
		$('#wage_per_AchievementBonus').removeClass("bj");
		$('#wage_per_OverTimePay').removeClass("bj");
		$('#wage_per_AchievementBonus').removeClass("bj");
		$('#wage_per_Sbjfjs').removeClass("bj");
		$('#wage_per_Sbgrbf').removeClass("bj");
		$('#wage_per_Sbdwbf').removeClass("bj");
		$('#wage_per_Sbbt').removeClass("bj");
		$('#wage_per_Qt').removeClass("bj");
		$('#wage_per_Wcqkk').removeClass("bj");
		$('#wage_per_Qtkk').removeClass("bj");
		$('#wage_per_Sbdk').removeClass("bj");
		$('#wage_per_Gsdk').removeClass("bj");
		$('#wage_per_Bz').removeClass("bj");
		$('#wage_per_dhf').removeClass("bj");
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
				var reImdm=checkeds[i].wage_per_Id
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
							url : "<c:url value='/wage/deleteReimById.do'/>",
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
					var reImdm=tables[i].wage_per_Id;
					if(undefined!=remIds.value){
						remIds.value=remIds.value+","+reImdm;
					}else{
						remIds.value=reImdm;
					}
					//员工类型
					var yglx=tables[i].wage_per_Yglx;
					if(yglx==undefined){
						return layer.alert("第"+[i+1]+"行员工类型为空，请填写！",{icon:7});
					}
				}
				 $('#remiIds').val(remIds.value);
				 var remId= $('#remiIds').val();
				 form.action=url+"/wage/startGztb.do?remId="+remId;
				 form.submit();
			}
		});
</script>
</body>
</html>