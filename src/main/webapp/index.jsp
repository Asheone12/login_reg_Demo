<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>首页</title>
</head>
<body>
<div class="line"></div><font size="5">登录成功！</font><div class="line"></div>
<h1>欢迎${user.userName}！以下为您的注册信息</h1>
<h2>密码：${user.userPwd}</h2>
<h2>邮箱：${user.userEmail}</h2>
<h2>单位：${user.userAddress}</h2>
<h2>真实姓名：${user.trueName}</h2>
<h2>电话号码：${user.phoneNumber}</h2>
<h2>生日：${user.birthday}</h2>
<a href="addition.jsp">填写补充信息</a>
<a href="logout">退出登录</a>
</body>
</html>