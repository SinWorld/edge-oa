<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<title>编辑销售合同登记</title>
<link rel="stylesheet" href="../layui-v2.4.5/layui/css/layui.css">
<script src="../jquery/jquery-3.3.1.js"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@page isELIgnored="false" %>
</head>
<body onload="refreshAndClose()" style="width:100%;padding:0px; margin:0px; text-align: center;">
	<div style="width:1280px;height:auto;padding:0px; margin:0 auto;" id="main">
		<form class="layui-form" action="<c:url value='/xshtdj/editXSHT.do'/>" method="post" enctype="multipart/form-data">
		<input type="hidden" id="url" value='<c:url value="/"/>'>
		<input type="hidden" id="flag" value="${flag}"> 
		<input type="hidden" value="${xsht.is_LX}" id="sflx">
		<input type="hidden" value="${xsht.proj_Info_Id}" name="proj_Info_Id">
		<input type="hidden" id="taskId" name="taskId" value="${taskId}">  
			
			 <div class="layui-form-item" style="margin-top: 5%">
			    <label class="layui-form-label">销售合同<br/>名称</label>
			    <div class="layui-input-block">
			      <input type="text" name="proj_Name" lay-verify="proj_Name" autocomplete="off" value="${xsht.proj_Name}"  class="layui-input" style="width: 90%" id="proj_Name">
			    </div>
			  </div>
			
			 <div class="layui-form-item">
			    <label class="layui-form-label">项目是否<br/>立项</label>
			    <div class="layui-input-block" style="width: 315px;">
			      <input type="radio" name="is_LX" value="1" title="已立项"  lay-filter="is_LX" id="ylx">
			      <input type="radio" name="is_LX" value="0" title="未立项"  lay-filter="is_LX" id="wlx">
			    </div>
			 </div>
			
			<div class="layui-form-item">
				<label class="layui-form-label">项目名称</label>
				<div class="layui-input-inline" style="width: 90%;text-align: left;">
					<select name="proj_Id" id="proj_Id" lay-filter="proj_Id" lay-verify="proj_Id" lay-search="">
						<option value="${xmxx.proj_Id}" selected="selected">${xmxx.budget_Name}</option>
					</select>
				</div>
			</div>
			
			<div class="layui-form-item">
				<div class="layui-inline" style="width: 352px;">
				  	<label class="layui-form-label">招标采购<br/>方式</label>
					<div class="layui-input-inline" style="text-align: left;">
						<select name="bp_Method" id="bp_Method" lay-filter="bp_Method" lay-verify="bp_Method">
							<option value="${zbfs.bp_Method_Id}" selected="selected">${zbfs.bp_Method_Name}</option>
						</select>
					</div>
				 </div>
				  <div class="layui-inline" style="top: -2px;">
				      <label class="layui-form-label">合同金额</label>
				      <div class="layui-input-inline">
				        <input type="text" name="cont_Amount" lay-verify="cont_Amount" autocomplete="off" class="layui-input" id="cont_Amount" value="${xsht.cont_Amount}" onchange="htje()">
				        <span style="position: relative;top: -25px;right: -105px;">元</span>
				      </div>
			    </div>
			    <div class="layui-inline" style="top: -10px;">
				      <label class="layui-form-label">签订日期</label>
				      <div class="layui-input-inline">
				        <input type="text" name="cont_Date" id="cont_Date" lay-verify="cont_Date" placeholder="yyyy-mm-dd" autocomplete="off" class="layui-input" value="${xsht.qdrq}">
				      </div>
			    </div>
			    <div class="layui-inline" style="width: 20%;top: -2px;">
				      <label class="layui-form-label" style="width: 84px;">合同计划完成日期</label>
				      <div class="layui-input-inline" style="width: 51%">
				        <input type="text" name="finish_Time" id="finish_Time" lay-verify="finish_Time" placeholder="yyyy-mm-dd" autocomplete="off" class="layui-input" value="${xsht.htjhwcrq}">
				      </div>
			    </div>
			 </div>
			
			
			<div class="layui-form-item" style="margin-top: -30px;">
			    <div class="layui-inline" style="left: -156px;">
			      <label class="layui-form-label">质保金比例</label>
			      <div class="layui-input-inline">
			        <input type="text" name="qual_Ratio" lay-verify="qual_Ratio" id="qual_Ratio" autocomplete="off" class="layui-input" onchange="zbjbl()" value="${xsht.qual_Ratio}">
			        <span style="position: relative;top: -25px;right: -105px;">%</span>
			      </div>
			    </div>
			    <div class="layui-inline"style="left: -114px;">
			      <label class="layui-form-label">质保金金额</label>
			      <div class="layui-input-inline">
			        <input type="text" name="qual_Bonds" lay-verify="qual_Bonds" id="qual_Bonds" autocomplete="off" class="layui-input" readonly="readonly" value="${xsht.qual_Bonds}">
			        <span style="position: relative;top: -25px;right: -105px;">元</span>
			      </div>
			    </div>
			    <div class="layui-inline" style="top: 10px;left: -114px;">
			      <label class="layui-form-label">质保金到期日期</label>
			      <div class="layui-input-inline">
			        <input type="text" name="qual_Expiredate" id="qual_Expiredate" lay-verify="qual_Expiredate" placeholder="yyyy-mm-dd" autocomplete="off" class="layui-input" value="${xsht.zbjdqrq}">
			      </div>
			    </div>
		  </div>
			
		<div>
			<span style="position: relative;left: -563px;font-size: 20px;top: -10px;color: #BC8F8F">客户信息</span>
		</div>
			
			 <div class="layui-form-item">
			    <div class="layui-inline" style="width: 60%;left: -52px;">
				    <label class="layui-form-label">单位名称</label>
				    <div class="layui-input-block">
				      <input type="text" name="cust_Unit" id="cust_Unit" lay-verify="cust_Unit" autocomplete="off"  class="layui-input" style="width: 72.5%" value="${xsht.cust_Unit}">
				    </div>
			    </div>
			    
		      <div class="layui-inline" style="width: 30%;left: -144px;">
			    <label class="layui-form-label">负责人</label>
			    <div class="layui-input-block">
			      <input type="text" name="cust_Contact" lay-verify="cust_Contact" id="cust_Contact" autocomplete="off"  class="layui-input" style="width: 50%" value="${xsht.cust_Contact}">
			    </div>
		    </div> 
		  </div>
			
		<div class="layui-form-item">
		    <div class="layui-inline" style="width: 38.5%;left: -150px;">
			    <label class="layui-form-label">手机号码</label>
			    <div class="layui-input-block">
			      <input type="text" name="cust_Phone" lay-verify="cust_Phone" id="cust_Phone" autocomplete="off"  class="layui-input" style="width: 50%"  value="${xsht.cust_Phone}">
			    </div>
		    </div>
		    <div class="layui-inline" style="width: 36%;left: 32px;">
			    <label class="layui-form-label">办公电话</label>
			    <div class="layui-input-block">
			      <input type="text" name="offi_Tel" id="offi_Tel" lay-verify="offi_Tel" autocomplete="off"  class="layui-input" style="width: 42%" value="${xsht.offi_Tel}">
			    </div>
		    </div>
 		</div>
			
		<div>
			<span style="position: relative;left: -563px;font-size: 20px;top: -10px;color: #BC8F8F">我方信息</span>
		</div>
			
		<div class="layui-form-item">
		    <div class="layui-inline" style="width: 53%;left: -2px;">
			    <label class="layui-form-label">单位名称</label>
			    <div class="layui-input-block">
			      <input type="text" name="our_Unit" lay-verify="our_Unit" id="our_Unit" autocomplete="off" value="${xsht.our_Unit}" class="layui-input" style="width: 82%">
			    </div>
		    </div>
		   <div class="layui-inline" style="width: 24.5%;left: -6px;">
		  	<label class="layui-form-label">负责人</label>
			<div class="layui-input-inline" style="text-align: left;">
				<select name="user_Id" id="user_Id" lay-filter="user_Id" id="user_Id" lay-verify="user_Id">
					<option value="${user.user_id}" selected="selected">${user.user_name}</option>
				</select>
			</div>
		 	</div>
			 <div class="layui-inline" style="width: 19%">
				    <label class="layui-form-label">提交人</label>
				    <div class="layui-input-block">
				      <input type="text" name="subm_Name" lay-verify="subm_Name" id="subm_Name" autocomplete="off"  class="layui-input" style="width:52%" value="${userName}" readonly="readonly">
				    </div>
			 </div>
  		</div>	
			
		<div class="layui-form-item layui-form-text">
		    <label class="layui-form-label">货物(产品)<br/>内容</label>
		    <div class="layui-input-block">
		      <textarea placeholder="请输入内容" name="prod_Name"  lay-verify="prod_Name" id="prod_Name" class="layui-textarea" style="width:89.8%">${xsht.prod_Name}</textarea>
		    </div>
	   </div>
			
	<!--附件 -->
	
	 <div class="layui-upload">
		  <button type="button" class="layui-btn layui-btn-normal" id="testList" style="margin-left: -91.5%">选择多文件</button> 
		  <div class="layui-upload-list">
		    <table class="layui-table" style="width: 100%;">
		      <thead>
		        <tr><th>文件名</th>
		        <th>大小</th>
		        <th>状态</th>
		        <th>操作</th>
		      </tr></thead>
		      <tbody id="demoList"></tbody>
		    </table>
		  </div>
		  <button type="button" class="layui-btn" id="testListAction" style="margin-left: -91.5%">开始上传</button>
	</div> 

	<div class="layui-form-item" style="text-align: center;">
	    <div class="layui-input-block">
	      <button class="layui-btn" lay-submit="" lay-filter="demo1" style="width:35%;margin-top:10px;">立即提交</button>
	    </div>
	</div>
	</form>
 </div>
<script src="../layui-v2.4.5/layui/layui.js" charset="utf-8"></script>
<script>
layui.use(['form', 'layedit', 'laydate','upload'], function(){
  var form = layui.form
  ,layer = layui.layer
  ,layedit = layui.layedit
  ,laydate = layui.laydate
  ,upload = layui.upload;
  var url=$('#url').val();
  form.render();
  //日期
  laydate.render({
    elem: '#cont_Date'
  });
  
  laydate.render({
	elem: '#finish_Time'
  });
  
  laydate.render({
		elem: '#qual_Expiredate'
  });
  
  //创建一个编辑器
  var editIndex = layedit.build('LAY_demo_editor');
 

  
  
  //监听提交
  form.on('submit(demo1)', function(data){
    layer.alert(JSON.stringify(data.field), {
      title: '最终的提交信息'
    })
    return true;
  });
  
//ajax实现下拉项目带出项目的相关属性
	form.on('select(proj_Id)', function(data){
		//获得项目信息主键
		var xmxxdm=data.value;
		var nowTime=formatDate(new Date());
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
				//设置招标采购方式
				var select = 'dd[lay-value=' + msg.xmxx.bp_method + ']';
				$('#bp_Method').siblings("div.layui-form-select").find('dl').find(select).click();
				//设置签订日期
				$('#cont_Date').val(nowTime);
				//设置合同计划完成日期
				$('#finish_Time').val(nowTime);
				//设置合同计划完成日期
				$('#qual_Expiredate').val(nowTime);
				//设置客户单位名称
				$('#cust_Unit').val(msg.xmxx.cust_Unit);
				//设置客户负责人
				$('#cust_Contact').val(msg.xmxx.cust_Contact);
				//设置客户手机号
				$('#cust_Phone').val(msg.xmxx.cust_Phone);
				//设置客户办公电话
				$('#offi_Tel').val(msg.xmxx.offi_Tel);
				//设置我方单位
				$('#our_Unit').val(msg.xmxx.our_Unit);
				//设置我方负责人
				var wffzr = 'dd[lay-value=' + msg.xmxx.user_Id + ']';
				$('#user_Id').siblings("div.layui-form-select").find('dl').find(wffzr).click();
			}
		});
});
	//是否立项数据改变监听
	form.on('radio(is_LX)', function (data) {
		if(data.value==1){//已立项
			$("#proj_Id").empty();
			$("#proj_Id").append("<option value=''>请选择所属项目</option>");
			$('#bp_Method').val('');
			$('#cont_Date').val('');
			$('#finish_Time').val('');
			$('#qual_Expiredate').val('');
			$('#cust_Unit').val('');
			$('#cust_Contact').val('');
			$('#cust_Phone').val('');
			$('#offi_Tel').val('');
			$('#our_Unit').val('');
			$('#user_Id').val('');
			ylxXmXX(form);
		}else{
			//未立项
			$("#proj_Id").empty();
			$("#proj_Id").append("<option value=''>请选择所属项目</option>");
			$('#bp_Method').val('');
			$('#cont_Date').val('');
			$('#finish_Time').val('');
			$('#qual_Expiredate').val('');
			$('#cust_Unit').val('');
			$('#cust_Contact').val('');
			$('#cust_Phone').val('');
			$('#offi_Tel').val('');
			$('#our_Unit').val('');
			$('#user_Id').val('');
			wlxXmXX(form);
		}
    });

  
//多文件列表示例
  var demoListView = $('#demoList')
  ,uploadListIns = upload.render({
    elem: '#testList'
    ,url: '<c:url value="/approveproj/upload.do"/>'
    ,accept: 'file'
    ,multiple: true
    ,auto: false
    ,bindAction: '#testListAction'
    ,choose: function(obj){   
      var files = this.files = obj.pushFile(); //将每次选择的文件追加到文件队列
      //读取本地文件
      obj.preview(function(index, file, result){
        var tr = $(['<tr id="upload-'+ index +'">'
          ,'<td>'+ file.name +'</td>'
          ,'<td>'+ (file.size/1014).toFixed(1) +'kb</td>'
          ,'<td>等待上传</td>'
          ,'<td>'
            ,'<button class="layui-btn layui-btn-xs demo-reload layui-hide">重传</button>'
            ,'<button class="layui-btn layui-btn-xs layui-btn-danger demo-delete">删除</button>'
          ,'</td>'
        ,'</tr>'].join(''));
        
        //单个重传
        tr.find('.demo-reload').on('click', function(){
          obj.upload(index, file);
        });
        
        //删除
        tr.find('.demo-delete').on('click', function(){
          delete files[index]; //删除对应的文件
          tr.remove();
          uploadListIns.config.elem.next()[0].value = ''; //清空 input file 值，以免删除后出现同名文件不可选
        });
        
        demoListView.append(tr);
      });
    }
    ,done: function(res, index, upload){
      if(res.code == 0){ //上传成功
        var tr = demoListView.find('tr#upload-'+ index)
        ,tds = tr.children();
        tds.eq(2).html('<span style="color: #5FB878;">上传成功</span>');
        tds.eq(3).html(''); //清空操作
        return delete this.files[index]; //删除文件队列已经上传成功的文件
      }
      this.error(index, upload);
    }
    ,error: function(index, upload){
      var tr = demoListView.find('tr#upload-'+ index)
      ,tds = tr.children();
      tds.eq(2).html('<span style="color: #FF5722;">上传失败</span>');
      tds.eq(3).find('.demo-reload').removeClass('layui-hide'); //显示重传
    }
  });
  allZBFS(form);
  allUser(form);
  xmsflx(form);
});


//ajax实现查询所有的招标方式
function  allZBFS(form){
	$.ajax({
		type : "post",
		url : "<c:url value='/approveproj/allZBFS.do'/>",
		async : false,
		dataType : 'json',
		error : function() {
			alert("出错");
		},
		success : function(msg) {
			for (var i = 0; i < msg.length; i++) {
				$("#bp_Method").append(
						"<option value='"+msg[i].bp_Method_Id+"'>"+ msg[i].bp_Method_Name +"</option>");
			}
			form.render('select');
		}
	});
}

//ajax实现查询所有的我方负责人
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
				$("#user_Id").append(
						"<option value='"+msg[i].user_id+"'>"+ msg[i].user_name +"</option>");
			}
			form.render('select');
		}
	});
}

function refreshAndClose(){
	var flag=$('#flag').val();
	if(flag){
		window.parent.location.reload();
		window.close();
	} 
}

//预算金额带两位小数点
function htje(){
	//获得合同金额输入的值
	var htje=$('#cont_Amount').val()*1;
	if(htje!=""){
		var je=htje.toFixed(2); 
		$('#cont_Amount').val(je);
	}else{
		$('#cont_Amount').val("0.00");
	}
	//获得字段质保金比例值
	var zbjbl=$('#qual_Ratio').val();
	//设置质保金金额
	var zbjje=(htje*1)*(zbjbl/100);
	var je=zbjje.toFixed(2);
	$('#qual_Bonds').val(je);
}

//质保金比例数据改变事件
function zbjbl(){
	//获得字段合同金额元
	var htje=$('#cont_Amount').val();
	//获得字段质保金比例值
	var zbjbl=$('#qual_Ratio').val();
	//设置质保金金额
	var zbjje=(htje*1)*(zbjbl/100);
	var je=zbjje.toFixed(2);
	$('#qual_Bonds').val(je);
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
			for (var i = 0; i < msg.length; i++) {
				$("#proj_Id").append(
						"<option value='"+msg[i].proj_Id+"'>"+ msg[i].budget_Name +"</option>");
			}
			form.render('select');
		}
	});
}


//ajax加载所有的未立项的项目
function wlxXmXX(form){
	$.ajax({
		type : "post",
		url : "<c:url value='/xshtdj/queryAllWLXXMXX.do'/>",
		async : false,
		dataType : 'json',
		error : function() {
			alert("出错");
		},
		success : function(msg) {
			for (var i = 0; i < msg.length; i++) {
				$("#proj_Id").append(
						"<option value='"+msg[i].proj_Id+"'>"+ msg[i].budget_Name +"</option>");
			}
			form.render('select');
		}
	});
}

//格式化日期
function formatDate(date){
	var year=date.getFullYear();//年
	var month=date.getMonth()+1;//月份（月份是从0~11，所以显示时要加1）
	if(month*1<=9){
		month="0"+month;
	}
	var day=date.getDate();//日期
	if(day*1<=9){
		day="0"+day;
	}
	var str=year+'-'+month+'-'+day;
	return str;
}

function xmsflx(form){
	var xmlx=$('#sflx').val();
	var ylx=$('#ylx');
	var wlx=$('#wlx');
	if(xmlx=='false'){//未立项
		wlx[0].checked=true;
		form.render()
	}
	if(xmlx=='true'){//已立项
		ylx[0].checked=true;
		form.render()
	}
}



</script>
</body>
</html>