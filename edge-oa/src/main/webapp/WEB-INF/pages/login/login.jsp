<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>登录界面</title>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@page isELIgnored="false"%>
<link href="../login/css/style.css" rel="stylesheet" type="text/css" media="all" />
<link rel="stylesheet" href="../layui-v2.4.5/layui/css/layui.css">
<script src="../jquery/jquery-3.3.1.js"></script>
<script src="../layui-v2.4.5/layui/layui.js"></script>
<script type="text/javascript">
		layui.use([ 'form', 'layer', 'jquery' ], function() {
			// 操作对象
			var form = layui.form;
			var $ = layui.jquery;
			$(document).on('click', '#login', function() {
				// console.log(data.field);
				var userName = $('#loginName').val();
				var password = $('#password').val();
				if(userName==""){
					layer.msg('登录名不能为空');
					return;
				}if(password==""){
					layer.msg('密码不能为空');
					return;
				}
				$.ajax({
					url : '<c:url value="/login/doLogin.do"/>',
					data : {
						"loginName" : userName,
						"password" : password
					},
					dataType : 'json',
					type : 'post',
					async : false,
					success : function(data) {
						if (data.flag=='success') {
							location.href='<c:url value="/index/index.do"/>';
							return;
						}
						if(data.flag=='inforMation'){
							layer.alert('当前用户已被管理员禁用', {
								icon : 7
							});
							return;
						} 
						if(data.flag=='fail'){
							layer.alert('用户名或密码错误，请重新输入', {
								icon : 2
							});
							return;
						} 
					}
				});
			});
		});
		
		document.onkeydown=function(e){
          var a=e||window.event;//加这个火狐下不会报 event is  undefind
			var form=document.getElementById('form');
			var url=$('#url').val();
            if (a.keyCode == 13){
			  form.action=url+"login/doLogin.do";
			  form.submit();
            }
		}

	</script>
</head>
<body>
<div class="padding-all">
		<div class="header">
			
		</div>
		<div class="design-w3l" style="margin-top: 5%">
			<div class="mail-form-agile">
				<form action="#" method="post" id="form">
					<input type="text" id="loginName" placeholder="登录名" required="" name="loginName"/>
					<input type="password"  id="password" class="padding" placeholder="密码" required="" name="password"/>
					<input type="button" value="登录" id="login">
					<a href="" id="index"></a>
					<input type="hidden" id="url" value="<c:url value="/"/>">
				</form>
			</div>
		  <div class="clear"> </div>
		</div>
		
		<div class="footer">
		</div>
	</div>
</body>
</html>