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
<title>项目立项</title>
<link rel="stylesheet" href="../layui-v2.4.5/layui/css/layui.css">
<script src="../jquery/jquery-3.3.1.js"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@page isELIgnored="false" %>
</head>
<body onload="refreshAndClose()" style="width:100%;padding:0px; margin:0px;text-align: center;">
	<div style="width:1280px;height:auto;padding:0px; margin:0 auto;" id="main">
		<form class="layui-form" action="<c:url value='/approveproj/editXMXX.do'/>" method="post" enctype="multipart/form-data">
		<input type="hidden" id="url" value='<c:url value="/"/>'>
		<input type="hidden" id="flag" value="${flag}"> 
		<input type="hidden" name="proj_Id" value="${foll_up_Proj.proj_Id}">
		<input type="hidden" id="taskId" name="taskId" value="${taskId}"> 
			
			<div class="layui-form-item" style="margin-top: 2%;">
			    <label class="layui-form-label" style="width: 280px;">项目名称</label>
			    <div class="layui-input-block">
			      <input type="text" name="budget_Name" lay-verify="budget_Name" autocomplete="off" value="${foll_up_Proj.budget_Name }" class="layui-input" style="width: 51.4%" id="budget_Name">
			    </div>
			</div>
			
			 <div class="layui-form-item">
				  <div class="layui-inline" style="left: -98px;">
				      <label class="layui-form-label" style="width: 100px;">预算金额</label>
				      <div class="layui-input-inline">
				        <input type="text" name="budget_Amount" lay-verify="budget_Amount" autocomplete="off" class="layui-input" id="budget_Amount" value="${foll_up_Proj.budget_Amount}">
				        <span style="position: relative;top: -25px;right: -105px;">元</span>
				      </div>
			     </div>
			    <div class="layui-inline" style="top: -10px;left: -14px;">
				      <label class="layui-form-label" style="width: 139px;">计划合同部签订日期</label>
				      <div class="layui-input-inline">
				        <input type="text" name="plan_Cont_Date" id="date" lay-verify="date" placeholder="yyyy-mm-dd" autocomplete="off" class="layui-input" value="${foll_up_Proj.plan_cont_date}">
				      </div>
			    </div>
			  </div>
			  
			  <div class="layui-form-item">
				<div class="layui-inline" style="width: 608px;left: -158px;">
				  	<label class="layui-form-label" style="width: 342px;">招标招标方式</label>
					<div class="layui-input-inline" style="text-align: left;">
						<select name="bp_method" id="bp_method" lay-filter="bp_method" lay-verify="bp_method">
							<option value="${zbfs.bp_Method_Id}" selected="selected">${zbfs.bp_Method_Name}</option>
						</select>
					</div>
				 </div>
				  <div class="layui-inline" style="top: -2px;left: -196px;">
				      <label class="layui-form-label" style="width: 227px;">客户负责人</label>
				      <div class="layui-input-inline">
				        <input type="text" name="cust_Contact" lay-verify="cust_Contact" autocomplete="off" class="layui-input" id="cust_Contact" value="${foll_up_Proj.cust_Contact}">
				      </div>
			    </div>
		   </div>
		  <div class="layui-form-item">
			    <label class="layui-form-label" style="width: 286px;">客户单位名称</label>
			    <div class="layui-input-block" style="left: -8px;">
			      <input type="text" name="cust_Unit" lay-verify="cust_Unit" autocomplete="off"  value="${foll_up_Proj.cust_Unit}" class="layui-input" style="width: 51.5%" id="cust_Unit">
			    </div>
		  </div>
			
		  <div class="layui-form-item">
			  <div class="layui-inline" style="top: -2px;left: -122px;">
			      <label class="layui-form-label" style="width: 95px;">客户手机号</label>
			      <div class="layui-input-inline">
			        <input type="text" name="cust_Phone" lay-verify="cust_Phone" autocomplete="off" class="layui-input" id="cust_Phone"  value="${foll_up_Proj.cust_Phone }">
			      </div>
		    </div>
			  <div class="layui-inline" style="top: -2px;left: 9px;">
			      <label class="layui-form-label" style="width: 95px;">客户固定电话</label>
			      <div class="layui-input-inline">
			        <input type="text" name="offi_Tel" lay-verify="offi_Tel" autocomplete="off" class="layui-input" id="offi_Tel" value="${ foll_up_Proj.offi_Tel}">
			      </div>
		    </div>
		  </div>
			
			<div class="layui-form-item">
				  <div class="layui-inline" style="top: -2px;left: -166px;">
				      <label class="layui-form-label" style="width: 280px;">项目成功率</label>
				      <div class="layui-input-inline">
				        <input type="text" name="proj_Succ_Rate" lay-verify="proj_Succ_Rate" autocomplete="off" class="layui-input" id="proj_Succ_Rate" value="${foll_up_Proj.proj_Succ_Rate }">
				        <span style="position: relative;top: -25px;right: -105px;">%</span>
				      </div>
			    </div>
				  <div class="layui-inline" style="width: 417px;left: -116px;">
				  	<label class="layui-form-label" style="width: 177px;">我方负责人</label>
					<div class="layui-input-inline" style="text-align: left;">
						<select name="user_Id" id="user_Id" lay-filter="user_Id" lay-verify="user_Id">
							<option value="${user.user_id}" selected="selected">${user.user_name}</option>
						</select>
					</div>
				 </div>
			 </div>
			
			 <div class="layui-form-item">
				    <label class="layui-form-label" style="width: 288px;">我方单位名称</label>
				    <div class="layui-input-block" style="left: -10px;">
				      <input type="text" name="our_Unit" lay-verify="our_Unit" autocomplete="off" value="${foll_up_Proj.our_Unit }" class="layui-input" style="width: 51.8%" id="our_Unit">
				    </div>
			  </div>
  
			 <div class="layui-form-item layui-form-text">
			    <label class="layui-form-label" style="width: 280px;">备注</label>
			    <div class="layui-input-block">
			      <textarea placeholder="请输入内容" name="memo_1"  lay-verify="memo_1" id="memo_1" class="layui-textarea" style="width:51.6%">${foll_up_Proj.memo_1}</textarea>
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
		
			<div class="layui-form-item">
			    <div class="layui-input-block" style="left: -30px;">
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
    elem: '#date'
  });
  
  //创建一个编辑器
  var editIndex = layedit.build('LAY_demo_editor');
 
  //自定义验证规则
  form.verify({
	  budget_Name: function(value){
      if(value==""||value==null){
        return '项目名称不能为空';
      }
    }
    ,budget_Amount:function(value){
   	if(value==""||value==null){
           return '预算金额不能为空';
         }
    }
    ,date: function(value){
   	if(value==""||value==null){
           return '计划合同签订日期不能为空';
         }
    }
    ,required:function(value){
       	if(value==""||value==null){
            return '采购方式不能为空';
          }
     }
    ,cust_Contact:function(value){
       	if(value==""||value==null){
            return '客户负责人不能为空';
          }
     }
    ,cust_Unit:function(value){
       	if(value==""||value==null){
            return '客户单位名称不能为空';
          }
     }
    ,cust_Phone:function(value){
       	if(value==""||value==null){
            return '客户手机号不能为空';
          }
     }
    ,offi_Tel:function(value){
       	if(value==""||value==null){
            return '客户固定电话不能为空';
          }
     }
    ,user_Id:function(value){
       	if(value==""||value==null){
            return '我方负责人不能为空';
          }
     }
    ,our_Unit:function(value){
       	if(value==""||value==null){
            return '我方单位名称不能为空';
          }
     }
  });
  
  
  //监听提交
  form.on('submit(demo1)', function(data){
    layer.alert(JSON.stringify(data.field), {
      title: '最终的提交信息'
    })
    return true;
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
				$("#bp_method").append(
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
</script>
</body>
</html>