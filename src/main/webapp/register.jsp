<%--
  Created by IntelliJ IDEA.
  User: Dell
  Date: 2022/7/6
  Time: 8:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<html>
<head>
    <title>用户注册</title>
</head>
<body>
<form action="register" method="post" >
  <input type="hidden" name="action" value="regist">
  <div class="input-wrapper">
    <div class="border-wrapper">
      用户名：<input type="text" name="userName" placeholder="userName" class="border-item">
    </div>
    <div class="border-wrapper">
      密码：<input type="text" name="userPwd" placeholder="userPwd" class="border-item">
    </div>
    <div class="border-wrapper">
      确认密码：<input type="text" name="userPwd2" placeholder="userPwd2" class="border-item">
    </div>
    <div class="border-wrapper">
      邮箱：<input type="text" name="userEmail" placeholder="userEmail" class="border-item">
    </div>
    <div class="border-wrapper">
      单位：<input type="text" name="userAddress" placeholder="userAddress" class="border-item">
    </div>
    <div class="border-wrapper">
      <span id="msg" style="font-size: 12px;color: red">${messageModel.msg}</span><br>
    </div>
    <div class="action">
      <input type="submit" class="btn" value="Regist">
    </div>
  </div>
</form>
</body>
</html>
