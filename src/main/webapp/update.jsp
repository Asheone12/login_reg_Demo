<%--
  Created by IntelliJ IDEA.
  User: Dell
  Date: 2022/7/7
  Time: 14:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>修改用户注册信息</title>
</head>
<body>
<div class="content" style="width:100%;text-align:center">
    <form action="updateMsg" id="updateForm" method="post">
        <table style="margin: auto">
            <div class="line"></div>
            <font size="5">修改注册信息</font>
            <div class="line"></div>
            <br><br>
            <tr>
                <td align="right">用户名</td>
                <td align="left"><input type="text" id="userName" name="userName" placeholder="请输入要修改的用户的用户名"/></td>
                <td id="namespan" style="color: red;font-size:12px;text-align:left;width:110px"></td>
            </tr>
            <tr>
                <td align="right">旧密码</td>
                <td align="left"><input type="password" id="userPwd0" name="userPwd0" placeholder="请输入原先的密码"/></td>
                <td id="oldpassspan" style="color: red;font-size:12px;text-align:left;width:110px"></td>
            </tr>
            <tr>
                <td align="right">新密码</td>
                <td align="left"><input type="password" id="userPwd" name="userPwd" placeholder="密码长度为6-12位"/></td>
                <td id="passspan" style="color: red;font-size:12px;text-align:left;width:110px"></td>
            </tr>
            <tr>
                <td align="right">确认新密码</td>
                <td align="left"><input type="password" id="userPwd2" name="userPwd2" placeholder="请再次确认密码"/></td>
                <td id="againspan" style="color: red;font-size:12px;text-align:left;width:110px"></td>
            </tr>
            <tr>
                <td align="right">邮 箱</td>
                <td align="left"><input type="text" id="userEmail" name="userEmail" placeholder="请输入邮箱"/></td>
                <td id="emailspan" style="color: red;font-size:12px;text-align:left;width:110px"></td>
            </tr>
            <tr>
                <span id="msg" style="font-size: 12px;color: red">${messageModel.msg}</span>
            </tr>
            <tr>
                <td colspan="3" align="center">
                    <button type="button" id="update">确认修改</button>
                </td>
            </tr>
            <tr>
                <td colspan="2" align="right"><a href="login.jsp" style="color:#458fce">返回登录页面</a></td>
            </tr>
        </table>
    </form>
</div>
<script type="text/javascript" src="js/jquery-3.4.1.js"></script>
<script type="text/javascript">
    var flag1 = 0;
    var flag2 = 0;
    var flag3 = 0;
    var flag4= 0 ;
    var msgbox = "旧密码不能为空！";
    //1.
    $('#userPwd0').change(function () {
        var pwd0 = $('#userPwd0').val();
        if (isEmpty(pwd0)) {
            $('#oldpassspan').html("原密码不能为空！");
            msgbox = '原密码不能为空！';
            return;
        } else {
            flag1 = 1;
            //格式正确，红色提示信息变为空
            $('#oldpassspan').html("");
        }
    });
    //2.
    $('#userPwd').change(function () {
        if (flag1) {
            var password = $('#userPwd').val();
            var reg = /^.*(?=.*[0-9])(?=.*[A-Z])(?=.*[a-z])(?=.*[!@#$%^&*?])/; //验证格式，至少各含有1个数字、1个大写字母、1个小写字母和其它字符
            if (isEmpty(password)) {
                $('#passspan').html("密码不能为空!");
                msgbox = '密码不能为空!';
                return;
            } else if (password.length < 7 || password.length > 11) {
                $('#passspan').html("密码长度必须大于等于6，小于12！");
                msgbox = '密码格式错误，密码长度必须大于等于6，小于12！';
                return;
            } else if (!(reg.test(password))) {
                $('#passspan').html("必须至少有1个数字、1个大写字母、1个小写字母和其它字符共同组成!");
                msgbox = '密码格式错误，必须至少有1个数字、1个大写字母、1个小写字母和其它字符共同组成!';
                return;
            } else {
                flag2 = 1;
                //格式正确，红色提示信息变为空
                $('#passspan').html("");
            }
        }
    });
    //3.
    $('#userPwd2').blur(function () {
        if (flag2) {
            var password = $('#userPwd').val();
            var againpw = $('#userPwd2').val();
            if (password != againpw) {//比较密码是否一致
                $('#againspan').html("两次输入的密码不一致！");
                msgbox = '两次输入的密码不一致！';
                return;
            } else {
                flag3 = 1;
                //格式正确，红色提示信息变为空
                $('#againspan').html("");
            }
        }
    });

    $('#userEmail').change(function () {
        if (flag3) {
            var email = $('#userEmail').val();
            var reg = /^([A-Za-z0-9_\-\.\u4e00-\u9fa5])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,8})$/;//邮箱的格式
            if (isEmpty(email)) {
                $('#emailspan').html("邮箱不能为空!");
                msgbox = '邮箱不能为空!';
                return;
            } else if (!(reg.test(email))) {//验证格式
                $('#emailspan').html("请输入正确的邮箱!");
                msgbox = '邮箱格式错误，请输入正确的邮箱!';
                return;
            } else {
                flag4 = 1;
                $('#emailspan').html("");
            }
        }
    });
    $('#update').click(function () {
        if (flag4) {
            $('#updateForm').submit();
        } else {
            alert(msgbox);
        }

    });
    function isEmpty(str) {
        if (str == null || str.trim() == "")
            return true;
        return false;
    }
</script>
</body>
</html>
