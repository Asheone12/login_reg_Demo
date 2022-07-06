<%--
  Created by IntelliJ IDEA.
  User: Dell
  Date: 2022/7/4
  Time: 22:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>用户登录</title>
</head>
<body>
<div style="text-align: center">
    <form action="login" method="post" id="loginForm">
        用户名：<input type="text" name="userName" id="userName" value="${messageModel.object.userName}"><br>
        密码：<input type="password" name="userPwd" id="userPwd" value="${messageModel.object.userPwd}"><br>
        <span id="msg" style="font-size: 12px;color: red">${messageModel.msg}</span><br>
        <button type="button" id="loginBtn">登录</button>
        <button type="button" id="registerBtn" onclick="window.location.href='register.jsp'">注册</button>
    </form>
</div>
</body>
<%--引入jquery--%>
<script type="text/javascript" src="js/jquery-3.4.1.js"></script>
<script type="text/javascript">
    //获取用户姓名和密码
    $('#loginBtn').click(function (){
        var uname=$('#userName').val();
        var upwd=$('#userPwd').val();
        if(isEmpty(uname)){
            $('#msg').html("用户姓名不能为空！");
            return;
        } else if(isEmpty(upwd)) {
            $('#msg').html("用户密码不能为空！");
        }
        $('#loginForm').submit();
    });
    //判断字符串是否为空，如果为空返回true
    function isEmpty(str){
        if (str==null||str.trim()=="")
            return true;
        return false;

    }
</script>
</html>
