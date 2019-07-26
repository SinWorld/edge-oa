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
	
	<fieldset class="layui-elem-field site-demo-button" style="margin-top: 30px; border-width: 0px;">
		<legend>需求管理</legend>
		<div class="layui-form-item" style="margin-top: 10px;">
			<div class="layui-inline" style="width: 20%; left: 10px;">
				<button type="button"
					class="layui-btn layui-btn-primary layui-btn-lg" id="xqd" style="width: 115px;">需求单</button>
			</div>
			<div class="layui-inline" style="width: 20%">
				<button type="button"
					class="layui-btn layui-btn-primary layui-btn-lg" id="xmxx">项目信息</button>
			</div>
			<div class="layui-inline" style="width: 20%">
				<button type="button"
					class="layui-btn layui-btn-primary layui-btn-lg" id="khxt">客户系统</button>
			</div>
			<div class="layui-inline" style="width: 20%">
				<button type="button"
					class="layui-btn layui-btn-primary layui-btn-lg" id="kh" style="width: 115px;">客户</button>
			</div>
		</div>
	</fieldset>		
	<fieldset class="layui-elem-field site-demo-button" style="margin-top: 30px; border-width: 0px;">
		<legend>文件管理</legend>
		<div class="layui-form-item" style="margin-top: 10px;">
			<div class="layui-inline" style="width: 20%; left: 10px;">
				<button type="button"
					class="layui-btn layui-btn-primary layui-btn-lg" id="hyjy">会议纪要</button>
			</div>
			<div class="layui-inline" style="width: 20%">
				<button type="button"
					class="layui-btn layui-btn-primary layui-btn-lg" id="sxwd">上线文档</button>
			</div>
			<div class="layui-inline" style="width: 20%">
				<button type="button"
					class="layui-btn layui-btn-primary layui-btn-lg" id="wjg" style="width: 115px;">文件柜</button>
			</div>
			<div class="layui-inline" style="width: 20%">
				<button type="button"
					class="layui-btn layui-btn-primary layui-btn-lg" id="zdwd">制度文档</button>
			</div>
		</div>
	</fieldset>
	
	<fieldset class="layui-elem-field site-demo-button" style="margin-top: 30px; border-width: 0px;">
		<legend>字典维护</legend>
		<div class="layui-form-item" style="margin-top: 10px;">
			<div class="layui-inline" style="width: 20%; left: 10px;">
				<button type="button"
					class="layui-btn layui-btn-primary layui-btn-lg" id="qyzt">签约主体</button>
			</div>
			<div class="layui-inline" style="width: 20%">
				<button type="button"
					class="layui-btn layui-btn-primary layui-btn-lg" id="bqwh">标签维护</button>
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
			
			//客户
			$('#kh').click(function() {
				var layer = layui.layer;
   				layer.open({
   					type : 2,
   					title : '客户',
   					area : [ '100%', '100%' ],
   					shadeClose : false,
   					resize : false,
   					anim : 1,
   					content : [ url + "yyzx/khList.do", 'yes' ]
   				});
			});
			
			//上线文档
			$('#sxwd').click(function() {
				var layer = layui.layer;
   				layer.open({
   					type : 2,
   					title : '上线文档',
   					area : [ '100%', '100%' ],
   					shadeClose : false,
   					resize : false,
   					anim : 1,
   					content : [url + "yyzx/sxwdList.do", 'yes' ]
   				});
			});

			//会议纪要
			$('#hyjy').click(function() {
				var layer = layui.layer;
   				layer.open({
   					type : 2,
   					title : '会议纪要',
   					area : [ '100%', '100%' ],
   					shadeClose : false,
   					resize : false,
   					anim : 1,
   					content : [url + "yyzx/hyjyList.do", 'yes' ]
   				});
			});
			
			//文件柜
			$('#wjg').click(function() {
				var layer = layui.layer;
				var address="/yyzx/wjgList.do";
				$.ajax({
		    		type : "post",
		    		url : "<c:url value='/checkPower/checkPower.do'/>",
		    		async : false,
		    		dataType : 'json',
		    		data:{"url":address},
		    		error : function() {
		    			alert("出错");
		    		},
		    		success : function(data) {
		    			if(data.flag){
		    				layer.open({
		    					type : 2,
		    					title : '文件柜',
		    					area : [ '100%', '100%' ],
		    					shadeClose : false,
		    					resize : false,
		    					anim : 1,
		    					content : [ url + "yyzx/wjgList.do", 'yes' ]
		    				});
		    			}else{
		    				return layer.alert("无此功能权限，请联系管理员授权！",{icon:7});
		    			}
		    		}
		    	});
			});
			
			//签约主体
			$('#qyzt').click(function() {
				var layer = layui.layer;
   				layer.open({
   					type : 2,
   					title : '签约主体',
   					area : [ '100%', '100%' ],
   					shadeClose : false,
   					resize : false,
   					anim : 1,
   					content : [ url + "yyzx/qyztList.do", 'yes' ]
   				});
			});
			
			//标签维护
			$('#bqwh').click(function() {
				var layer = layui.layer;
   				layer.open({
   					type : 2,
   					title : '标签维护',
   					area : [ '100%', '100%' ],
   					shadeClose : false,
   					resize : false,
   					anim : 1,
   					content : [ url + "yyzx/bqwhList.do", 'yes' ]
   				});
			});
			
			//客户系统
			$('#khxt').click(function() {
				var layer = layui.layer;
   				layer.open({
   					type : 2,
   					title : '客户系统',
   					area : [ '100%', '100%' ],
   					shadeClose : false,
   					resize : false,
   					anim : 1,
   					content : [ url + "yyzx/khxtList.do", 'yes' ]
   				});
			});
		});
	</script>
</body>
</html>