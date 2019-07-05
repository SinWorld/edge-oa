<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  <title>内网OA</title>
  <link rel="stylesheet" href="../layui-v2.4.5/layui/css/layui.css">
  <%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
  <%@page isELIgnored="false" %>
</head>
<body class="layui-layout-body" onload="loadTopWindow()">
<div class="layui-layout layui-layout-admin">
  <div class="layui-header">
    <div class="layui-logo"  style="font-size: 30px;">内网OA</div>
    <!-- 头部区域（可配合layui已有的水平导航） -->
    <ul class="layui-nav layui-layout-right">
      <li class="layui-nav-item">
        <a href="javascript:;">
           <img src="../login/images/photo-pic.png"  class="layui-nav-img">
      			${userName}
        </a>
        <input type="hidden" value="${userId}" id="userId">
   		<input type="hidden" value='<c:url value="/"/>' id="url">
        <dl class="layui-nav-child">
          <dd><a onclick="userShow()">基本资料</a></dd>
          <dd><a onclick="initSecuritySetting()">修改密码</a></dd>
        </dl>
      </li>
      <li class="layui-nav-item"><a  onclick="exit()" style="cursor:pointer;">退出</a></li>
    </ul>
  </div>
  
  <div class="layui-side layui-bg-black">
    <div class="layui-side-scroll">
      <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
      <ul class="layui-nav layui-nav-tree"  lay-filter="test">
      <li class="layui-nav-item"><a href=""><i class="layui-icon">&#xe68e;</i>&nbsp;&nbsp;首页</a></li>
      <c:forEach items="${privilegeTopList}" var="p">
        <li class="layui-nav-item">
        <c:if test="${empty p.privilege_url}">
        	<a class="" href="javascript:;"><i class="layui-icon">${p.icon}</i>&nbsp;&nbsp;${p.privilege_name}</a>
        </c:if>
        <c:if test="${not empty p.privilege_url}">
        	<a class="" href='<c:url value="${p.privilege_url}"/>' target="iframe_a"><i class="layui-icon">${p.icon}</i>&nbsp;&nbsp;${p.privilege_name}</a>
        </c:if>
          <c:forEach items="${p.children}" var="c">
	           <dl class="layui-nav-child">
	            <dd><a  href='<c:url value="${c.privilege_url}"/>' mytitle="${c.privilege_name}"  target="iframe_a">${c.privilege_name}</a></dd>
	          </dl>
          </c:forEach> 
        </li>
    </c:forEach> 
      </ul>
    </div>
  </div>
  
  <div class="layui-body">
    <!-- 内容主体区域 -->
   
    <iframe  src='<c:url value="/index/headPage.do"/>' name="iframe_a" id="iframe-page-content"  width="100%" height="100%" frameborder="no" border="0" marginwidth="0" marginheight=" 0" scrolling="no" allowtransparency="yes"></iframe>
    
  </div>
  
  <div class="layui-footer">
    <!-- 底部固定区域 -->
    <a href="http://www.ahajtk.com">安徽爱吉泰克科技有限公司</a>
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
}); 

function reinitIframe(){
	var iframe = document.getElementById("iframe-page-content");
	try{
	var bHeight = iframe.contentWindow.document.body.scrollHeight;
	var dHeight = iframe.contentWindow.document.documentElement.scrollHeight;
	var height = Math.max(bHeight, dHeight);
	iframe.height = height;
	console.log(height);
	}catch (ex){}
}

function loadTopWindow(){ 
	if (window.top!=null && window.top.document.URL!=document.URL){ 
		window.top.location= document.URL; //这样就可以让登陆窗口显示在整个窗口了 
	} 
} 

//跳转至修改密码页面
function initSecuritySetting (){
	var url=$('#url').val();
	layer.open({
  	  	type:2,
  	  	title:'修改密码',
  	  	area: ['38%','40%'],
  		shadeClose: false,
  		resize:false,
  	    anim: 1,
  	  	content:[url+"user/initSecuritySetting.do",'yes']
	 });
}

//退出系统
function exit(){
	 layer.confirm('您确定要退出系统么？', {
		  btn: ['确定','取消'], //按钮
		  title:'提示',icon:7},function(){
			  location.href='<c:url value="/login/exit.do"/>';
		  }
	  );
	
}
</script>
</body>
</html>