<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../layui-v2.4.5/layui/css/layui.css">
<script src="../jquery/jquery-3.3.1.js"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@page isELIgnored="false" %>
</head>
<body style="width:100%;padding:0px; margin:0px;text-align: center;">
<div style="width:1280px;padding:0px; margin:0 auto;" id="main">
<form class="layui-form" action="">
  <div class="layui-form-item" style="margin-top: 5%">
	    <label class="layui-form-label">项目名称</label>
	    <div class="layui-input-block">
	      <input type="text" name="budget_Name" lay-verify="budget_Name" autocomplete="off" placeholder="请输入项目名称" class="layui-input" style="width: 51.4%" id="budget_Name">
	    </div>
  </div>
  
  <div class="layui-form-item">
	  <div class="layui-inline" style="left: -293px;">
	      <label class="layui-form-label">预算金额</label>
	      <div class="layui-input-inline">
	        <input type="tel" name="phone" lay-verify="phone" autocomplete="off" class="layui-input">
	        <span style="position: relative;top: -25px;right: -105px;">元</span>
	      </div>
     </div>
    <div class="layui-inline" style="top: -10px;left: -200px;">
	      <label class="layui-form-label" style="width: 130px;">计划合同部签订日期</label>
	      <div class="layui-input-inline">
	        <input type="text" name="date" id="date" lay-verify="date" placeholder="yyyy-mm-dd" autocomplete="off" class="layui-input" onclick="layui.laydate({elem: this})">
	      </div>
    </div>
  </div>
  
  <div class="layui-form-item">
		<div class="layui-inline" style="width: 352px;left: -305px;">
		  	<label class="layui-form-label" style="width: 88px;">招标采购方式</label>
			<div class="layui-input-inline" style="text-align: left;">
				<select name="bp_Method" id="bp_Method" lay-filter="bp_Method" lay-verify="bp_Method">
					<option value="" selected="selected">请选择招标方式</option>
				</select>
			</div>
		 </div>
		  <div class="layui-inline" style="top: -2px;left: -196px;">
		      <label class="layui-form-label">客户负责人</label>
		      <div class="layui-input-inline">
		        <input type="text" name="cont_Amount" lay-verify="cont_Amount" autocomplete="off" class="layui-input" id="cont_Amount" onchange="htje()">
		      </div>
	    </div>
  </div>
  
  <div class="layui-form-item">
	    <label class="layui-form-label" style="width: 88px;">客户单位名称</label>
	    <div class="layui-input-block" style="left: -8px;">
	      <input type="text" name="budget_Name" lay-verify="budget_Name" autocomplete="off" placeholder="请输入项目名称" class="layui-input" style="width: 51.5%" id="budget_Name">
	    </div>
  </div>
  
  <div class="layui-form-item">
		  <div class="layui-inline" style="top: -2px;left: -317px;">
		      <label class="layui-form-label">客户手机号</label>
		      <div class="layui-input-inline">
		        <input type="text" name="cont_Amount" lay-verify="cont_Amount" autocomplete="off" class="layui-input" id="cont_Amount" onchange="htje()">
		      </div>
	    </div>
		  <div class="layui-inline" style="top: -2px;left: -176px;">
		      <label class="layui-form-label" style="width: 88px;">客户固定电话</label>
		      <div class="layui-input-inline">
		        <input type="text" name="cont_Amount" lay-verify="cont_Amount" autocomplete="off" class="layui-input" id="cont_Amount" onchange="htje()">
		      </div>
	    </div>
  </div>
  
    <div class="layui-form-item">
		  <div class="layui-inline" style="top: -2px;left: -300px;">
		      <label class="layui-form-label">项目成功率</label>
		      <div class="layui-input-inline">
		        <input type="text" name="cont_Amount" lay-verify="cont_Amount" autocomplete="off" class="layui-input" id="cont_Amount" onchange="htje()">
		        <span style="position: relative;top: -25px;right: -105px;">%</span>
		      </div>
	    </div>
		  <div class="layui-inline" style="width: 352px;left: -150px;">
		  	<label class="layui-form-label">我方负责人</label>
			<div class="layui-input-inline" style="text-align: left;">
				<select name="bp_Method" id="bp_Method" lay-filter="bp_Method" lay-verify="bp_Method">
					<option value="" selected="selected">请选择我方负责人</option>
				</select>
			</div>
		 </div>
  </div>
  
   <div class="layui-form-item">
	    <label class="layui-form-label" style="width: 88px;">我方单位名称</label>
	    <div class="layui-input-block" style="left: -10px;">
	      <input type="text" name="budget_Name" lay-verify="budget_Name" autocomplete="off" placeholder="请输入我方单位名称" class="layui-input" style="width: 51.8%" id="budget_Name">
	    </div>
  </div>
  
  <div class="layui-form-item layui-form-text">
	    <label class="layui-form-label">备注</label>
	    <div class="layui-input-block">
	      <textarea placeholder="请输入内容" name="prod_Name"  lay-verify="prod_Name" id="prod_Name" class="layui-textarea" style="width:51.6%"></textarea>
	    </div>
 </div>
   
  <!--附件 -->
	
	 <div class="layui-upload">
		  <button type="button" class="layui-btn layui-btn-normal" id="testList" style="margin-left: -91.5%">选择多文件</button> 
		  <div class="layui-upload-list">
		    <table class="layui-table" style="width: 60.5%;">
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
	    <div class="layui-input-block" style="left: -200px;">
	      <button class="layui-btn" lay-submit="" lay-filter="demo1" style="width:35%;margin-top:10px;">立即提交</button>
	    </div>
	</div>
  
</form>
</div>
<script src="../layui-v2.4.5/layui/layui.js" charset="utf-8"></script>
<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
<script>
layui.use(['form', 'layedit', 'laydate'], function(){
  var form = layui.form
  ,layer = layui.layer
  ,layedit = layui.layedit
  ,laydate = layui.laydate;
  
  //创建一个编辑器
  var editIndex = layedit.build('LAY_demo_editor');
 
  //自定义验证规则
  form.verify({
    title: function(value){
      if(value.length < 5){
        return '标题至少得5个字符啊';
      }
    }
    ,pass: [/(.+){6,12}$/, '密码必须6到12位']
    ,content: function(value){
      layedit.sync(editIndex);
    }
  });
  
  //监听指定开关
  form.on('switch(switchTest)', function(data){
    layer.msg('开关checked：'+ (this.checked ? 'true' : 'false'), {
      offset: '6px'
    });
    layer.tips('温馨提示：请注意开关状态的文字可以随意定义，而不仅仅是ON|OFF', data.othis)
  });
  
  //监听提交
  form.on('submit(demo1)', function(data){
    layer.alert(JSON.stringify(data.field), {
      title: '最终的提交信息'
    })
    return false;
  });
  
 
  
});


</script>
</body>
</html>