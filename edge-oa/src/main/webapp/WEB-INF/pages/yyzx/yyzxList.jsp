<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>应用中心</title>
<link rel="stylesheet" href="../layui-v2.4.5/layui/css/layui.css">
<link rel="stylesheet" href="../login/css/static.css">
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@page isELIgnored="false"%>
</head>
<body>
	<input type="hidden" value='<c:url value="/"/>' id="url">
	<fieldset class="layui-elem-field site-demo-button"
		style="margin-top: 30px; border-width: 0px;">
		<legend>文件管理</legend>
		<div class="layui-form-item" style="margin-top: 10px;">
			<div class="layui-inline" style="width: 20%; left: 10px;">
				<button type="button"
					class="layui-btn layui-btn-primary layui-btn-lg" id="hyjy'">会议纪要</button>
			</div>
			<div class="layui-inline" style="width: 20%">
				<button type="button"
					class="layui-btn layui-btn-primary layui-btn-lg" id="sxwd">上线文档</button>
			</div>
			<div class="layui-inline" style="width: 20%">
				<button type="button"
					class="layui-btn layui-btn-primary layui-btn-lg" id="wjg">文件柜</button>
			</div>
			<div class="layui-inline" style="width: 20%">
				<button type="button"
					class="layui-btn layui-btn-primary layui-btn-lg" id="zdwd">制度文档</button>
			</div>
		</div>
	</fieldset>
	<script src="../layui-v2.4.5/layui/layui.js" charset="utf-8"></script>
	<script type="text/javascript" src="../jquery/jquery-3.3.1.js"></script>
	<script type="text/javascript">
		layui.use([ 'form', 'layedit' ], function() {
			var form = layui.form;
			var layer = layui.layer;
			var url = $('#url').val();
			$('#wjg').click(function() {
				var layer = layui.layer;
				layer.open({
					type : 2,
					title : '文件柜',
					area : [ '100%', '100%' ],
					shadeClose : false,
					resize : false,
					anim : 1,
					content : [ url + "yyzx/wjgList.do", 'yes' ]
				});
			});

		});
	</script>
</body>
</html>