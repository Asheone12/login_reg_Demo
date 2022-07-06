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
<div class="content" style="width:100%;text-align:center">
    <form action="login" method="post" id="loginForm">
        <table style="margin: auto">
            <div class="line"></div><font size="5">登录</font><div class="line"></div>
            <br><br>
            <tr>
                <td align="right">用户名</td>
                <td align="left"><input type="text" id="userName" name="userName" value="${messageModel.object.userName}" /></td>
                <td id="namespan" style="color: red;font-size:12px;text-align:left;width:110px"></td>
            </tr>
            <tr>
                <td align="right">密	码</td>
                <td align="left"><input type="password" id="userPwd" name="userPwd"  /></td>
                <td id="passspan" style="color: red;font-size:12px;text-align:left;width:110px"></td>
            </tr>
            <tr>
                <span id="msg" style="font-size: 12px;color: red">${messageModel.msg}</span>
            </tr>
            <tr>
                <td colspan="3" align="center"><button type="button" id="loginBtn">登录</button></td>
            </tr>
            <tr>
                <td colspan="2" align="right">未有账号？<a href="register.jsp" style="color:#458fce">立即注册</a></td>
            </tr>
        </table>
    </form>
</div>
</body>
<%--引入jquery--%>
<script type="text/javascript" src="js/jquery-3.4.1.js"></script>
<script type="text/javascript">
    var flag1 = 0;
    var flag2 = 0;
    //1.
    $('#userName').blur(function (){
        var name=$('#userName').val();
        if(isEmpty(name)){
            $('#namespan').html("用户名不能为空！");
            return ;
        }else{
            flag1 = 1;
            //格式正确，红色提示信息变为空
            $('#namespan').html("");
        }
    });
    //2.
    $('#userPwd').blur(function (){
        if(flag1){
            var password=$('#userPwd').val();
            if(isEmpty(password)){
                $('#passspan').html("密码不能为空!");
                return ;
            }else{
                flag2 = 1;
                //格式正确，红色提示信息变为空
                $('#passspan').html("");
            }
        }
    });
    //获取用户姓名和密码
    $('#loginBtn').click(function (){
        if(flag2)
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
