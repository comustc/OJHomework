<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<% 
	String path = request.getContextPath(); 
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/"; 
	pageContext.setAttribute("basePath",basePath); 
%> 
<html>
<head>
<base href="<%=basePath%>">
<title>用户登录</title>
<meta charset="utf-8">
<style type="text/css">
	.middle_login {
	width: 400px;
}

html, body {
	height: 100%;
}
body {
	background: url(images/login/top1.jpg) no-repeat center center fixed;
	background-size: 100%;
}
</style>
<link rel="stylesheet" type="text/css" href="css/login.css">
<link rel="SHORTCUT ICON" href="images/icon.ico">
<link rel="BOOKMARK" href="images/icon.ico">
<script src="script/jquery-1.11.1.min.js"></script>
<script src="script/login.js"></script>
</head>
<body>
	<h1 style="display: block; text-align: center">在线作业管理系统</h1>
	<!--顶部-->
	<div class="top" style="margin-left: 600px; margin-top: 200px;">
		<img src="images/login/top.png">
	</div>
		<!--中间登录-->
		<div class="middle_login" style="margin-left: 600px;">
			<form action="login/do" method="post" onsubmit="return check(this);">
				<table class="main_font login_table">
					<tr>
						<td>用户名:</td>
						<td><input type="text" name="username"></td>
					</tr>
					<tr>
						<td>密码:</td>
						<td><input type="password" name="password"></td>
					</tr>
					<tr>
						<td>验证码:</td>
						<td>
							<input type="text" name="verify" class="verify_input"><img src="image.jsp" onclick="image(this);" class="verify_image">
						</td>
					</tr>
					<tr>
						<td colspan="2"><span class="error" id="login_error">&nbsp;${error}</span>
						</td>
					</tr>
					<tr>
						<td colspan="2" style="text-align: center;"><input
							type="submit" value="登录"> <input type="reset" value="重置">
						</td>
					</tr>
				</table>
			</form>
		</div>
	</div>
</body>
</html>