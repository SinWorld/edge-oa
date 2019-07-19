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
<body  style="width:100%;padding:0px; margin:0px;">
	<div style="width:1280px;height:auto;padding:0px; margin:0 auto;" id="main">
		<form class="layui-form" action='<c:url value="/wage/editGztb.do"/>' method="post" id="myForm" style="margin-top: 30px;">
			<input type="hidden" id="url" value='<c:url value="/"/>'>
			<input type="hidden" id="wage_per_Id" name="wage_per_Id" value="${wagePerformance.wage_per_Id}">
			<input type="hidden" id="yg" value="${wagePerformance.wage_per_Name}"> 
			<input type="hidden" id="yglx" value="${wagePerformance.wage_per_Yglx}">
			<input type="hidden" name="taskId" id="taskId" value="${taskId}"> 
			
			<div class="layui-form-item" style="margin-top: 20px;">
			 	<div class="layui-inline" style="left:30px;">
				      <label class="layui-form-label" style="width: 90px;">审批编号</label>
				      <div class="layui-input-inline">
				        <input type="text" name="wage_per_Code"  lay-verify="wage_per_Code" autocomplete="off" class="layui-input bj" id="wage_per_Code" value="${wagePerformance.wage_per_Code}" disabled="">
				      </div>
			    </div>
			    
			     <div class="layui-inline" style="left: 16px;">
			      <label class="layui-form-label">月份</label>
			      <div class="layui-input-inline">
			        <input type="text" class="layui-input" id="wage_per_Month" placeholder="yyyy-MM" name="wage_per_Month" style="width: 175px;" value="${wagePerformance.month}">
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
						<select name="wage_per_Department" id="wage_per_Department" lay-filter="wage_per_Department" lay-verify="wage_per_Department" disabled="">
							<option value="${wagePerformance.wage_per_Department}" selected="selected">${wagePerformance.user_Department}</option>
						</select>
					</div>
				 </div>
				 
			     <div class="layui-inline" style="left:25px;">
				  	<label class="layui-form-label" style="width: 95px;">岗位</label>
					<div class="layui-input-inline" style="text-align: left;">
						<select name="wage_per_Position" id="wage_per_Position" lay-filter="wage_per_Position" lay-verify="wage_per_Position" disabled="">
							<option value="${wagePerformance.wage_per_Position}" selected="selected">${wagePerformance.user_Posittion}</option>
						</select>
					</div>
				 </div>
			 </div>
		 
			<div class="layui-form-item">
				 <div class="layui-inline" style="left:30px;">
				      <label class="layui-form-label" style="width: 90px;">基本工资</label>
				      <div class="layui-input-inline" style="width: 195px;">
				        <input type="text" id="wage_per_BaseWage" lay-verify="wage_per_BaseWage" autocomplete="off" class="layui-input" name="wage_per_BaseWage" style="width: 175px;" onchange="yfgzOrsfgzChange()" value="${wagePerformance.wage_per_BaseWage}">
				        <span style="position: relative;top: -25px;right: -175px;">元</span>
				      </div>
			    </div>
				 
			   <div class="layui-inline">
				      <label class="layui-form-label" style="width: 90px;">岗位工资</label>
				      <div class="layui-input-inline" style="width: 195px;">
				        <input type="text" id="wage_per_PositionWage" lay-verify="wage_per_PositionWage" autocomplete="off" class="layui-input" name="wage_per_PositionWage" style="width: 175px;"  onchange="yfgzOrsfgzChange()" value="${wagePerformance.wage_per_PositionWage}">
				        <span style="position: relative;top: -25px;right: -175px;">元</span>
				      </div>
			    </div>
			     <div class="layui-inline">
				      <label class="layui-form-label" style="width: 90px;">绩效奖金</label>
				      <div class="layui-input-inline" style="width: 195px;">
				        <input type="text" id="wage_per_AchievementBonus" lay-verify="wage_per_AchievementBonus" autocomplete="off" class="layui-input" name="wage_per_AchievementBonus" style="width: 175px;"  onchange="yfgzOrsfgzChange()" value="${wagePerformance.wage_per_AchievementBonus}">
				        <span style="position: relative;top: -25px;right: -175px;">元</span>
				      </div>
			    </div>
			     <div class="layui-inline">
				      <label class="layui-form-label" style="width: 90px;">加班工资</label>
				      <div class="layui-input-inline" style="width: 195px;">
				        <input type="text" id="wage_per_OverTimePay" lay-verify="wage_per_OverTimePay" autocomplete="off" class="layui-input" name="wage_per_OverTimePay" style="width: 175px;"  onchange="yfgzOrsfgzChange()" value="${wagePerformance.wage_per_OverTimePay}">
				        <span style="position: relative;top: -25px;right: -175px;">元</span>
				      </div>
			    </div>
			    <br/>
			    <div class="layui-inline" style="left:-3px;">
				      <label class="layui-form-label" style="width:122px;">社保缴费<br/>基数</label>
				      <div class="layui-input-inline" style="width: 195px;">
				        <input type="text" id="wage_per_Sbjfjs" lay-verify="wage_per_Sbjfjs" autocomplete="off" class="layui-input" name="wage_per_Sbjfjs" style="width: 175px;" value="${wagePerformance.wage_per_Sbjfjs}">
				        <span style="position: relative;top: -25px;right: -175px;">元</span>
				      </div>
			    </div>
			     <div class="layui-inline" style="left:-18px;">
				      <label class="layui-form-label" style="width:77px;">电话费</label>
				      <div class="layui-input-inline" style="width: 195px;">
				        <input type="text" id="wage_per_dhf" lay-verify="wage_per_dhf" autocomplete="off" class="layui-input" name="wage_per_dhf" style="width: 175px;"  onchange="yfgzOrsfgzChange()"  value="${wagePerformance.wage_per_dhf}">
				        <span style="position: relative;top: -25px;right: -175px;">元</span>
				      </div>
			    </div>
			 </div>
			 
			 
			 <div class="layui-form-item">
				 <div class="layui-inline" style="left:30px;">
				      <label class="layui-form-label" style="width:90px;">社保个人部分</label>
				      <div class="layui-input-inline" style="width: 195px;">
				        <input type="text" id="wage_per_Sbgrbf" lay-verify="wage_per_Sbgrbf" autocomplete="off" class="layui-input" name="wage_per_Sbgrbf" style="width: 175px;" value="${wagePerformance.wage_per_Sbgrbf}">
				        <span style="position: relative;top: -25px;right: -175px;">元</span>
				      </div>
			    </div>
				 
			   <div class="layui-inline">
				      <label class="layui-form-label" style="width:90px;">社保单位部分</label>
				      <div class="layui-input-inline" style="width: 195px;">
				        <input type="text" id="wage_per_Sbdwbf" lay-verify="wage_per_Sbdwbf" autocomplete="off" class="layui-input" name="wage_per_Sbdwbf" style="width: 175px;" value="${wagePerformance.wage_per_Sbdwbf}">
				        <span style="position: relative;top: -25px;right: -175px;">元</span>
				      </div>
			    </div>
			     <div class="layui-inline">
				      <label class="layui-form-label" style="width: 90px;">社保补贴</label>
				      <div class="layui-input-inline" style="width: 195px;">
				        <input type="text" id="wage_per_Sbbt" lay-verify="wage_per_Sbbt" autocomplete="off" class="layui-input" name="wage_per_Sbbt" style="width: 175px;"  onchange="yfgzOrsfgzChange()" value="${wagePerformance.wage_per_Sbbt}">
				        <span style="position: relative;top: -25px;right: -175px;">元</span>
				      </div>
			    </div>
			     <div class="layui-inline">
				      <label class="layui-form-label" style="width: 90px;">其它</label>
				      <div class="layui-input-inline" style="width: 195px;">
				        <input type="text" id="wage_per_Qt" lay-verify="wage_per_Qt" autocomplete="off" class="layui-input" name="wage_per_Qt" style="width: 175px;"  onchange="yfgzOrsfgzChange()" value="${wagePerformance.wage_per_Qt}">
				        <span style="position: relative;top: -25px;right: -175px;">元</span>
				      </div>
			    </div>
			    <br/>
			    <div class="layui-inline" style="left:-3px;">
				      <label class="layui-form-label" style="width:122px;">应发工资</label>
				      <div class="layui-input-inline" style="width: 195px;">
				        <input type="text" id="wage_per_Yfgz" lay-verify="wage_per_Yfgz" autocomplete="off" class="layui-input bj" name="wage_per_Yfgz" style="width: 175px;" value="${wagePerformance.wage_per_Yfgz}" disabled="">
				        <span style="position: relative;top: -25px;right: -175px;">元</span>
				      </div>
			    </div>
			 </div>
			 
			 
			 <div class="layui-form-item">
				 <div class="layui-inline" style="left:30px;">
				      <label class="layui-form-label" style="width:90px;">未出勤扣款</label>
				      <div class="layui-input-inline" style="width: 195px;">
				        <input type="text" id="wage_per_Wcqkk" lay-verify="wage_per_Wcqkk" autocomplete="off" class="layui-input" name="wage_per_Wcqkk" style="width: 175px;" onchange="yfgzOrsfgzChange()" value="${wagePerformance.wage_per_Wcqkk}">
				        <span style="position: relative;top: -25px;right: -175px;">元</span>
				      </div>
			    </div>
				 
			   <div class="layui-inline">
				      <label class="layui-form-label" style="width:90px;">其它扣款</label>
				      <div class="layui-input-inline" style="width: 195px;">
				        <input type="text" id="wage_per_Qtkk" lay-verify="wage_per_Qtkk" autocomplete="off" class="layui-input" name="wage_per_Qtkk" style="width: 175px;" onchange="yfgzOrsfgzChange()"  value="${wagePerformance.wage_per_Qtkk}">
				        <span style="position: relative;top: -25px;right: -175px;">元</span>
				      </div>
			    </div>
			     <div class="layui-inline">
				      <label class="layui-form-label" style="width: 90px;">社保代扣</label>
				      <div class="layui-input-inline" style="width: 195px;">
				        <input type="text" id="wage_per_Sbdk" lay-verify="wage_per_Sbdk" autocomplete="off" class="layui-input" name="wage_per_Sbdk" style="width: 175px;" onchange="yfgzOrsfgzChange()"  value="${wagePerformance.wage_per_Sbdk}">
				        <span style="position: relative;top: -25px;right: -175px;">元</span>
				      </div>
			    </div>
			     <div class="layui-inline">
				      <label class="layui-form-label" style="width: 90px;">个税代扣</label>
				      <div class="layui-input-inline" style="width: 195px;">
				        <input type="text" id="wage_per_Gsdk" lay-verify="wage_per_Gsdk" autocomplete="off" class="layui-input" name="wage_per_Gsdk" style="width: 175px;" onchange="yfgzOrsfgzChange()" value="${wagePerformance.wage_per_Gsdk}">
				        <span style="position: relative;top: -25px;right: -175px;">元</span>
				      </div>
			    </div>
			    <br/>
			    <div class="layui-inline" style="left:-3px;">
				      <label class="layui-form-label" style="width:122px;">实发工资</label>
				      <div class="layui-input-inline" style="width: 195px;">
				        <input type="text" id="wage_per_Sfgz" lay-verify="wage_per_Sfgz" autocomplete="off" class="layui-input bj" name="wage_per_Sfgz" style="width: 175px;" value="${wagePerformance.wage_per_Sfgz}" disabled="">
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
				        <input type="text" name="wage_per_Tbr" lay-verify="wage_per_Tbr" autocomplete="off" class="layui-input bj" id="wage_per_Tbr" style="width: 173px;" value="${wagePerformance.wage_per_Tbr}" disabled="">
				      </div>
			    </div>
			 </div>
		 
			 <div class="layui-form-item layui-form-text">
			    <label class="layui-form-label" style="width: 120px;">备注</label>
			    <div class="layui-input-block">
			      <textarea placeholder="请输入内容" name="wage_per_Bz"  lay-verify="wage_per_Bz" id="wage_per_Bz" class="layui-textarea" style="width:1070px;">${wagePerformance.wage_per_Bz}</textarea>
			    </div>
			</div>
			
		 	<table class="layui-hide" id="test" lay-filter="test"></table>

			<div class="layui-form-item" style="text-align: center;">
			    <div class="layui-input-block">
 					<button class="layui-btn" lay-submit="" lay-filter="demo1" style="width:35%;margin-top:10px;" id="tj" type="button">立即提交</button>			    
 				</div>
			</div>
	</form>
 </div>
<script src="../layui-v2.4.5/layui/layui.js" charset="utf-8"></script>
<script src="../jquery/jquery-3.3.1.js"></script>
<script>
layui.use(['form', 'layedit', 'laydate'], function(){
  var form = layui.form
  ,layer = layui.layer
  ,layedit = layui.layedit
  ,laydate = layui.laydate;
  var url=$('#url').val();
  form.render();
  //日期
  laydate.render({
    elem: '#wage_per_Month'
    ,type: 'month'
  });
  
  //创建一个编辑器
  var editIndex = layedit.build('LAY_demo_editor');
  
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
	allYG(form);
	allYGLX(form);
	loadYG(form);
	loadYGLX(form);
});
  
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
	
	
	//自动加载所属员工
	function loadYG(form){
		//获得所属员工代码
		var ygdm=$('#yg').val();
		//遍历员工下拉选
		var ygxxs=$('#wage_per_Name').find('option');
		for(var i=0;i<ygxxs.length;i++){
			if(ygxxs[i].value==ygdm){
				ygxxs[i].setAttribute("selected",'true');
				break;
			}
		}
		form.render('select');
	}
	
	//自动加载员工类型
	function loadYGLX(form){
		//获得所属员工类型代码
		var yglxdm=$('#yglx').val();
		//遍历员工类型下拉选
		var yglxs=$('#wage_per_Yglx').find('option');
		for(var i=0;i<yglxs.length;i++){
			if(yglxs[i].value==yglxdm){
				yglxs[i].setAttribute("selected",'true');
				break;
			}
		}
		form.render('select');
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
	
	$('#tj').click(function(){
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
		//任务主键
		var taskId=$('#taskId').val();
		//编辑操作
		$.ajax({
			type : "post",
			url : "<c:url value='/wage/editGztb.do'/>",
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
				  "yglx":yglx,"tbr":tbr,"bz":bz,"taskId":taskId},
			success : function(msg) {
				if(msg.flag){
					window.parent.location.reload();
					window.close();
				}
			}
		});
	});

</script>
</body>
</html>