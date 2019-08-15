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
	<form class="layui-form" action="" style="margin-top: 10px;">
	 <div class="demoTable" style="background-color: #CAE1FF;height: 150px;" id="gjssq">
		 <div class="layui-form-item" style="width:1280px;height:auto;padding:0px; margin:0 auto;" id="main"">
			 <div class="layui-form-item">
				 <div class="layui-inline">
				      <label class="layui-form-label" style="width: 100px;">审批编号</label>
				      <div class="layui-input-inline">
				        <input type="text" name="wage_Code" lay-verify="wage_Code"
						autocomplete="off" class="layui-input" style="width: 200px;" id="wage_Code">
				      </div>
			     </div>
			     
			    <div class="layui-inline" style="left:-2px;">
			      <label class="layui-form-label">月份</label>
			      <div class="layui-input-inline">
			        <input type="text" class="layui-input bj" id="month" placeholder="yyyy-MM" name="month" style="width:200px;">
			      </div>
			    </div>
			    
				<div class="layui-inline" style="width: 24.5%;left: -6px;">
				  	<label class="layui-form-label">姓名</label>
					<div class="layui-input-inline" style="text-align: left;">
						<select name="wage_Name" id="wage_Name" lay-filter="wage_Name" lay-verify="wage_Name">
							<option value="" selected="selected">请选择员工</option>
						</select>
					</div>
			 	</div>
			 	
			 	<button class="layui-btn" data-type="reload" type="button" id="do_search" style="margin-top: -2px;">搜索</button>
		 	</div>
			
			<div class="layui-form-item">
				 <div class="layui-inline" style="left: 29px;">
				      <label class="layui-form-label" style="width: 71px;">应发工资</label>
				      <div class="layui-input-inline">
					     <input type="text" name="jinE1" lay-verify="jinE1"autocomplete="off" class="layui-input" placeholder="￥" style="width: 85px;"id="jinE1" onchange="formatJE1()">
					  </div>
			       	  <i class="u-date_line" style="margin-left: -115px;line-height: 35px;">—</i>
					      <div class="layui-input-inline" style="left: -85px;">
					     <input type="text" name="jinE2" lay-verify="jinE2"autocomplete="off" class="layui-input" placeholder="￥" style="width: 85px;"id="jinE2" onchange="formatJE2()">
				      </div>
				 </div>
				 
				 <div class="layui-inline" style="left:-165px;">
				      <label class="layui-form-label" style="width: 71px;">实发工资</label>
				      <div class="layui-input-inline">
					     <input type="text" name="jinE3" lay-verify="jinE3"autocomplete="off" class="layui-input"  placeholder="￥" style="width: 85px;"id="jinE3" onchange="formatJE3()">
					  </div>
			       	  <i class="u-date_line" style="margin-left: -115px;line-height: 35px;">—</i>
					      <div class="layui-input-inline" style="left: -85px;">
					     <input type="text" name="jinE4" lay-verify="jinE4"autocomplete="off" class="layui-input"  placeholder="￥" style="width: 85px;"id="jinE4" onchange="formatJE4()">
				      </div>
				 </div>
				 
			 	<div class="layui-inline" style="width:323px;left: -172px;top:-43px;left:662px;">
				  	<label class="layui-form-label">员工类型</label>
					<div class="layui-input-inline" style="text-align: left;width: 190px;">
						<select name="wage_Yglx" id="wage_Yglx" lay-filter="wage_Yglx" lay-verify="wage_Yglx">
							<option value="" selected="selected">请选择员工类型</option>
						</select>
					</div>
			 	</div>
		 	</div>
		 	
		 	<div class="layui-form-item">
		 		<div class="layui-inline" style="left: 29px;top: -50px;">
				      <label class="layui-form-label" style="width: 71px;">填报人</label>
				      <div class="layui-input-inline">
					     <input type="text" name="wage_Tbr" lay-verify="wage_Tbr" autocomplete="off" class="layui-input" style="width: 200px;" id="wage_Tbr">
					  </div>
				 </div>
				 
				<div class="layui-inline" style="width:329px;top:-52px;left:26px;">
				  	<label class="layui-form-label">部门</label>
					<div class="layui-input-inline" style="text-align: left;width: 200px;">
						<select name="bms" id="bms" lay-filter="bms" lay-verify="bms">
							<option value="" selected="selected">请选择所属部门</option>
						</select>
					</div>
			 	</div> 
			 	
		 		<div class="layui-inline" style="width:329px;top:-52px;left:4px;">
				  	<label class="layui-form-label">职位</label>
					<div class="layui-input-inline" style="text-align: left;width:190px;">
						<select name="user_posittion" id="user_posittion" lay-filter="user_posittion" lay-verify="user_posittion">
							<option value="" selected="selected">请选择所属职位</option>
						</select>
					</div>
			 	</div> 
			 	
			 	<button type="reset" class="layui-btn layui-btn-primary" style="margin-left:-6px;margin-top: -109px;">重置</button>
			</div>
		</div> 
	</div>
</form>
	<input type="hidden" value='<c:url value="/"/>' id="url">
	<input type="hidden" id="flag" value="false">
 	<div class="layui-tab-item layui-show">
		<div style="position:relative;top: -10px;">
			<table class="layui-hide" id="test" lay-filter="test" style="width: 100%"></table>
		</div>
	</div>	
	
	<script type="text/html" id="toolbarDemo">
       <div class="layui-btn-container" style="width:25%;">
 	    <button class="layui-btn layui-btn-sm" lay-event="gjss" type="button">高级搜索</button>
       </div>
    </script>

<script type="text/javascript" src="../jquery/jquery-3.3.1.js"></script>
<script src="../layui-v2.4.5/layui/layui.js" charset="utf-8"></script>
<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 --> 
<script>
layui.use(['table','form','layedit', 'laydate'], function(){
  var table = layui.table;
  var url=$('#url').val();
  var form= layui.form;
  var layer = layui.layer;
  var layedit = layui.layedit;
  var laydate = layui.laydate;
  //日期
  laydate.render({
    elem: '#month'
    ,type: 'month'
  });
 
  $('#gjssq').hide();
  allYG(form);
  allYGLX(form);
  allBM(form);
  queryAllPosittion(form);
  //未发放登记
  table.render({
    elem: '#test'
    ,url:url+'gzff/queryAllGZTB.do'
    ,toolbar: '#toolbarDemo'
    ,title: '发放信息'
    ,totalRow: true
    ,cols: [[
          {field:'index', width:'8%', title: '序号', sort: true,type:'numbers', totalRowText: '合计',unresize: true}
	      ,{field:'wage_per_Code', width:'20%', title: '审批编号'}
	      ,{field:'wage_per_Month', width:'8%', title: '月份',templet:'<div>{{ layui.util.toDateString(d.reimbursement_begintime, "yyyy-MM") }}</div>'}
	      ,{field:'user_Name', width:'10%', title: '姓名'}
	      ,{field:'user_Department', width:'9%', title: '部门名称'}
	      ,{field:'user_Posittion', width:'9%', title: '职位'}
	      ,{field:'wage_per_Yfgz', width:'9%', title: '应发工资',totalRow: true}
	      ,{field:'wage_per_Sfgz', width:'9%', title: '实发工资',totalRow: true}
	      ,{field:'yglx_name', width:'9%', title: '员工类型'}
	      ,{field:'wage_per_Tbr', width:'9%', title: '填报人'}
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
  	var wage_per_Id=data.wage_per_Id;
   	 layer.open({
     	  	type:2,
     	  	title:'查看',
     	  	area: ['100%','100%'],
     		shadeClose: false,
     		resize:false,
     	    anim: 1,
     	  	content:[url+"wage/wagePerformanceShowById.do?wage_per_Id="+wage_per_Id,'yes']
   	  });
  });
  
  
//执行搜索，表格重载
  $('#do_search').on('click', function(){
      // 搜索条件
      var wage_Code = $('#wage_Code').val();//工资填报编号
      var month=$('#month').val();//所属月份
      var wage_Name=$('#wage_Name').val();//姓名
      var jinE1=$('#jinE1').val();//应发工资
      var jinE2=$('#jinE2').val();//应发工资
      var jinE3=$('#jinE3').val();//实发工资
      var jinE4=$('#jinE4').val();//实发工资
      var wage_Yglx=$('#wage_Yglx').val();//员工类型
      var wage_Tbr=$('#wage_Tbr').val();//填报人
      var bms=$('#bms').val();//所属部门
      var user_posittion=$('#user_posittion').val();//所属岗位
      table.reload('testReload', {
          method: 'post',
          where: {
              'wage_Code':wage_Code,
              'month':month,
              'wage_Name':wage_Name,
              'jinE1':jinE1,
              'jinE2':jinE2,
              'jinE3':jinE3,
              'jinE4':jinE4,
              'wage_Yglx':wage_Yglx,
              'wage_Tbr':wage_Tbr,
              'bms':bms,
              'user_posittion':user_posittion
          },
          page: {
              curr: 1
          }
      });
  });
 

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
					$("#wage_Name").append(
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
					$("#wage_Yglx").append(
							"<option value='"+msg[i].yglx_dm+"'>"+ msg[i].yglx_mc +"</option>");
				}
				form.render('select');
			}
		});
	}

	//ajax加载所有的部门
	function allBM(form){
		$.ajax({
			type : "post",
			url : "<c:url value='/gzff/queryAllBM.do'/>",
			async : false,
			dataType : 'json',
			error : function() {
				alert("出错");
			},
			success : function(msg) {
				for (var i = 0; i < msg.length; i++) {
					$("#bms").append(
							"<option value='"+msg[i].dep_id+"'>"+ msg[i].dep_name +"</option>");
				}
				form.render('select');
			}
		});
	}


	//ajax加载所有的岗位
	function queryAllPosittion(form) {
		$.ajax({
			type : "post",
			url : "<c:url value='/user/queryAllPosittion.do'/>",
			async : false,
			dataType : 'json',
			error : function() {
				alert("出错");
			},
			success : function(msg) {
					for(var j=0;j<msg.length;j++){
						$("#user_posittion").append(
						    "<option value='"+msg[j].posittion_dm+"'>"+ msg[j].posittion_mc +"</option>"); 
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
	
	//格式化金额
	function formatJE3(){
		var je1=$('#jinE3').val()*1;
		$('#jinE3').val(je1.toFixed(2));
	}
	//格式化金额
	function formatJE4(){
		var je1=$('#jinE4').val()*1;
		$('#jinE4').val(je1.toFixed(2));
	}

</script>
</body>
</html>