<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  <title>异度空间</title>
  <link rel="stylesheet" href="../layui-v2.4.5/layui/css/layui.css">
  <%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
  <%@page isELIgnored="false" %>
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
  <div class="layui-header">
    <div class="layui-logo"  style="font-size: 30px;">异度空间</div>
    <!-- 头部区域（可配合layui已有的水平导航） -->
    <ul class="layui-nav layui-layout-left">
      <li class="layui-nav-item"><a href="">1111</a></li>
      <li class="layui-nav-item"><a href="">商品管理</a></li>
      <li class="layui-nav-item"><a href="">用户</a></li>
      <li class="layui-nav-item">
        <a href="javascript:;">其它系统</a>
        <dl class="layui-nav-child">
          <dd><a href="">邮件管理</a></dd>
          <dd><a href="">消息管理</a></dd>
          <dd><a href="">授权管理</a></dd>
        </dl>
      </li>
    </ul>
    <ul class="layui-nav layui-layout-right">
      <li class="layui-nav-item">
        <a href="javascript:;">
          <img  class="layui-nav-img" id="userName">
      			${userName}
        </a>
        <input type="hidden" value="${userId}" id="userId">
        <input type="hidden" value="${image}">
        <input type="hidden" id="ts">
   		<input type="hidden" value='<c:url value="/"/>' id="url">
        <dl class="layui-nav-child">
          <dd><a onclick="userShow()">基本资料</a></dd>
          <dd><a onclick="securitySetting()">安全设置</a></dd>
        </dl>
      </li>
      <li class="layui-nav-item"><a href='<c:url value="/user/exit"/>'>退出</a></li>
    </ul>
  </div>
  
  <div class="layui-side layui-bg-black">
    <div class="layui-side-scroll">
      <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
      <ul class="layui-nav layui-nav-tree"  lay-filter="test">
      <li class="layui-nav-item"><a href="">首页</a></li>
        <li class="layui-nav-item">
          <a class="" href="javascript:;">图书商城</a>
          <dl class="layui-nav-child">
            <dd><a onclick="bookInitPage()">首页</a></dd>
            <dd><a onclick="addBook()">添加图书</a></dd>
            <dd><a href="javascript:;">列表三</a></dd>
            <dd><a href="">超链接</a></dd>
          </dl>
        </li>
        <li class="layui-nav-item">
          <a href="javascript:;">内网OA</a>
          <dl class="layui-nav-child">
            <dd><a href="javascript:;">首页</a></dd>
          </dl>
        </li>
        <li class="layui-nav-item"><a href="">云市场</a></li>
        <li class="layui-nav-item"><a href="">发布商品</a></li>
      </ul>
    </div>
  </div>
  
  <div class="layui-body">
    <!-- 内容主体区域 -->
    <div style="padding: 15px;">
    	<iframe src='<c:url value="/user/banner"/>' style="width: 100%" id="banner" frameborder="0" scrolling="no" onload="this.height=100"></iframe>
    </div>
  </div>
  
  <div class="layui-footer">
    <!-- 底部固定区域 -->
    © layui.com - 底部固定区域
  </div>
</div>
<script src="../layui-v2.4.5/layui/layui.js"></script>
<script type="text/javascript" src="../jquery/jquery-3.3.1.js"></script>
<script>
//JavaScript代码区域
layui.use(['element','layer'], function(){
  var element = layui.element;
  var $ = layui.$;
  var layer = layui.layer;
  userInfor();
  pointOut(layer);
}); 

function reinitIframe(){
	var iframe = document.getElementById("banner");
	try{
	var bHeight = iframe.contentWindow.document.body.scrollHeight;
	var dHeight = iframe.contentWindow.document.documentElement.scrollHeight;
	var height = Math.max(bHeight, dHeight);
	iframe.height = height;
	console.log(height);
	}catch (ex){}
	}
	window.setInterval("reinitIframe()", 200);
	
function userShow(){
		var userId=$('#userId').val();
		$.ajax({
	        url:"<c:url value='/user/userShow'/>",
	        type:"post",
	        data:{"userId":userId},
	        dataType:'json',
	        async:false,
	        error : function() {
				alert("出错");
			},
	        success:function (data) {
	        	if(data.length>0){
	        		var id=data[0].user_id;
	        		window.open ("<c:url value='/user/userInforShow'/>?rowId="+id, "newwindow", "height=629, width=825, toolbar =no, menubar=no, scrollbars=no, resizable=no, location=no, status=no,top=80px,left=350px");
	        	}
	        }
	    });
	}
	
	function securitySetting(){
		var userId=$('#userId').val();
		$.ajax({
	        url:"<c:url value='/user/securitySetting'/>",
	        type:"post",
	        data:{"userId":userId},
	        dataType:'json',
	        async:false,
	        error : function() {
				alert("出错");
			},
	        success:function (data) {
	        	if(data.length>0){
	        		var id=data[0].user_id;
	        		window.open ("<c:url value='/user/securitySet'/>?rowId="+id, "newwindow", "height=429, width=808, toolbar =no, menubar=no, scrollbars=no, resizable=no, location=no, status=no,top=100px,left=350px");
	        	}
	        }
	    });
	}
	
	
	function userInfor(){
		var userId=$('#userId').val();
		$.ajax({
	        url:"<c:url value='/user/securitySetting'/>",
	        type:"post",
	        data:{"userId":userId},
	        dataType:'json',
	        async:false,
	        error : function() {
				alert("出错");
			},
	        success:function (data) {
	        	for(var i=0;i<data.length;i++){
	        		var photoUrl=data[i].user_uImage;
	        	}
	        	$('#userName').attr("src", "/HMP_SPACE/"+photoUrl);
	        }
	    });
	}
	
	function addBook(){
		window.open ("<c:url value='/book/initAddBook'/>","newwindow", "height=640, width=825, toolbar =no, menubar=no, scrollbars=no, resizable=no, location=no, status=no,top=80px,left=350px");
	}
	
	function bookInitPage(){
		window.open("<c:url value='/book/initIndex'/>")
	}
	
	//系统检测是否快到时间有未还的书籍并给出提示
	function pointOut(layer){
		var ts=$('#ts').val();
		var url=$('#url').val();
		$.ajax({
	        url:"<c:url value='/borrow/pointOut'/>",
	        type:"post",
	        dataType:'json',
	        async:false,
	        error : function() {
				alert("出错");
			},
	        success:function (data) {
	        	//取出结果集中所有的借阅主键并拼接在字符串中
	        	for(var i=0;i<data.myBorrowItems.length;i++){
	        		//遍历回调函数中的主键数组
	        		for(var j=0;j<data.myBorrowItems[i].ids.length;j++){
	        			 if(undefined!=data.myBorrowItems[i].ids[j]){
		        			 ts=ts+","+data.myBorrowItems[i].ids[j];
		   				}else{
		   					ts=data.myBorrowItems[i].ids[j];
		   				}
	        		}
	        	}
	        	$('#ts').val(ts);
	        	var tss=$('#ts').val();
	        	var borrowId=tss.substr(1);
	        	if(data.myBorrowItems.length!=0){
	        		layer.open({
	                    type: 1
	                    ,offset: 'rb' //具体配置参考：offset参数项
	                    ,content: '<div style="padding: 20px 33px;">您当前有借阅的书籍即将到期请尽快归还！！！</div>'
	                    ,btn: '查看'
	                    ,btnAlign: 'c' //按钮居中
	                    ,shade: 0 //不显示遮罩
	                    ,yes: function(){
	                    	window.open("<c:url value='/borrow/borrowShow'/>?borrowIds="+borrowId)
	                    	/* layer.open({
	            	     	  	type:2,
	            	     	  	title:'我的借阅',
	            	     	  	area: ['100%','100%'],
	            	     	  	move:false,
	            	     	  	resize:false,
	            	     	  	content:[url+"borrow/borrowShow?borrowIds="+borrowId,'no']
	                 	  }); */
	                    }
        		});
             }
	    }
	});
}
	
</script>
</body>
</html>