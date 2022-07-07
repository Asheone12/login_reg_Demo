<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>首页</title>
</head>
<body>
<div class="line"></div><font size="5">登录成功！</font><div class="line"></div>
<h2>欢迎${user.userName}！以下为您的注册信息</h2>
<h2>密码：${user.userPwd}</h2>
<h2>邮箱：${user.userEmail}</h2>
<h2>单位：${user.userAddress}</h2>
<a href="logout">退出登录</a>
</body>
</html>