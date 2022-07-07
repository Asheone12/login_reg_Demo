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
<script type="text/javascript" src="js/jquery-3.4.1.js"></script>
<script type="text/javascript">
    function gettime(){
        var d = new Date().Format("yyyy-MM-dd HH:mm");
        var str = "软件测试综合实验-计算机1901-10-" + d;
        document.getElementById("t").innerHTML =str;
        window.setTimeout("gettime()",1000);
    }
    Date.prototype.Format = function (fmt) {
        var o = {
            "M+": this.getMonth() + 1, //月份
            "d+": this.getDate(), //日
            "H+": this.getHours(), //小时
            "m+": this.getMinutes(), //分
            "s+": this.getSeconds(), //秒
            "q+": Math.floor((this.getMonth() + 3) / 3), //季度
            "S": this.getMilliseconds() //毫秒
        };
        if (/(y+)/.test(fmt)) fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
        for (var k in o)
            if (new RegExp("(" + k + ")").test(fmt)) fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
        return fmt;
    }
    window.onload = gettime;
</script>
<body>
<div class="content" style="width:100%;text-align:center">
    <div id="t"></div>
    <form action="login" method="post" id="loginForm">
        <table style="margin: auto">
            <div class="line"></div><font size="5">登录</font><div class="line"></div>
            <br><br>
            <tr>
                <td align="right">用户名</td>
                <td align="left"><input type="text" id="userName" name="userName"  /></td>
                <td id="namespan" style="color: red;font-size:12px;text-align:left;width:110px"></td>
            </tr>
            <tr>
                <td align="right">密	码</td>
                <td align="left"><input type="password" id="userPwd" name="userPwd"  /></td>
                <td id="passspan" style="color: red;font-size:12px;text-align:left;width:110px"></td>
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
<script type="text/javascript">
    var flag1 = 0;
    var flag2 = 0;
    var msgbox = "用户名不能为空！";
    //1.
    //$('#userName').blur(function (){
    $('#userName').bind('focus input propertychange',function (){
        var name=$('#userName').val();
        if(isEmpty(name)){
            $('#namespan').html("用户名不能为空！");
            msgbox = '用户名不能为空！';
            return ;
        }else{
            flag1 = 1;
            //格式正确，红色提示信息变为空
            $('#namespan').html("");
        }
    });
    //2.
    $('#userPwd').bind('focus input propertychange',function (){
            var password=$('#userPwd').val();
            if(isEmpty(password)){
                $('#passspan').html("密码不能为空!");
                msgbox = '密码不能为空！';
                return ;
            }else{
                flag2 = 1;
                //格式正确，红色提示信息变为空
                $('#passspan').html("");
            }
    });
    //获取用户姓名和密码
    $('#loginBtn').click(function (){
        if(flag1&flag2){
            $('#loginForm').submit();
        }else{
            alert(msgbox);
        }
    });
    //判断字符串是否为空，如果为空返回true
    function isEmpty(str){
        if (str==null||str.trim()=="")
            return true;
        return false;
    }
</script>
</html>
