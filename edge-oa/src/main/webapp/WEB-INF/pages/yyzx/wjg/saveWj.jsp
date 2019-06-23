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
<title>上传文件</title>
<link rel="stylesheet" href="../layui-v2.4.5/layui/css/layui.css">
<script src="../jquery/jquery-3.3.1.js"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@page isELIgnored="false" %>
</head>
<body onload="refreshAndClose()" style="width:100%;padding:0px; margin:0px;text-align: center;">
	<div style="width:1280px;height:auto;padding:0px; margin:0 auto;margin-top: 30px;" id="main">
		<form class="layui-form" action="<c:url value='/wjg/saveWJ.do'/>" method="post" enctype="multipart/form-data">
		<input type="hidden" id="flag" value="${flag}"> 
		<input type="hidden" id="fjsx" name="fjsx"> 
	
		<div class="layui-form-item">
			<label class="layui-form-label">文件夹</label>
				<div class="layui-input-inline" style="width: 90%;text-align: left;">
					<select name="wenJianJDM" id="wenJianJDM" lay-filter="wenJianJDM" lay-verify="wenJianJDM" lay-search="">
						<option value="" selected="selected">请选择所属文件夹</option>
					</select>
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
  initOrgTree(form);
  //创建一个编辑器
  var editIndex = layedit.build('LAY_demo_editor');
 

	form.verify({
		wenJianJDM: function(value, item){//value：表单的值、item：表单的DOM对象
			 if(value==""){
				 return '请选择文件夹';
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
 var fjsx=$('#fjsx').val();
  var demoListView = $('#demoList')
  ,uploadListIns = upload.render({
    elem: '#testList'
    ,url: '<c:url value="/wjg/upload.do"/>'
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
        //将附件属性拼接字符串提交至后端
        var fj=res.data;
		 //将json串转换为字符串
		 var str = JSON.stringify(fj);
	       if(undefined!=fjsx){
				 fjsx=fjsx+","+str;
				 $('#fjsx').val(fjsx);
			 }else{
				 fjsx=str;
				 $('#fjsx').val(fjsx);
			 }
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
 
});


function refreshAndClose(){
	var flag=$('#flag').val();
	if(flag){
		window.parent.location.reload();
		window.close();
	} 
}

	//ajax加载所有的文件夹
	function initOrgTree(form) {
		$.ajax({
			type : "post",
			url : "<c:url value='/wjg/orgWJJTree.do'/>",
			async : false,
			dataType : 'json',
			error : function() {
				alert("出错");
			},
			success : function(msg) {
				for (var i = 0; i < msg.length; i++) {
					for(var j=0;j<msg[i].length;j++){
						$("#wenJianJDM").append(
						    "<option value='"+msg[i][j].id+"'>"+ msg[i][j].title +"</option>"); 
					}
				}
				form.render('select');
			}
		});
	}
</script>
</body>
</html>