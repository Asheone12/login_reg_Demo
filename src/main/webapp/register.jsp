<%--
  Created by IntelliJ IDEA.
  User: Dell
  Date: 2022/7/6
  Time: 8:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
    <title>用户注册</title>
</head>
<body>
<div class="content" style="width:100%;text-align:center">
    <form action="register" id="signForm" method="post">
        <table style="margin: auto">
            <div class="line"></div>
            <font size="5">注册</font>
            <div class="line"></div>
            <br><br>
            <tr>
                <td align="right">用户名</td>
                <td align="left"><input type="text" id="userName" name="userName" placeholder="请输入6-10位字母或数字"/></td>
                <td id="namespan" style="color: red;font-size:12px;text-align:left;width:110px"></td>
            </tr>
            <tr>
                <td align="right">密 码</td>
                <td align="left"><input type="password" id="userPwd" name="userPwd" placeholder="密码长度为6-12位"/></td>
                <td id="passspan" style="color: red;font-size:12px;text-align:left;width:110px"></td>
            </tr>
            <tr>
                <td align="right">确认密码</td>
                <td align="left"><input type="password" id="userPwd2" name="userPwd2" placeholder="请再次确认密码"/></td>
                <td id="againspan" style="color: red;font-size:12px;text-align:left;width:110px"></td>
            </tr>
            <tr>
                <td align="right">邮 箱</td>
                <td align="left"><input type="text" id="userEmail" name="userEmail" placeholder="请输入邮箱"/></td>
                <td id="emailspan" style="color: red;font-size:12px;text-align:left;width:110px"></td>
            </tr>
            <tr>
                <td align="right">单 位</td>
                <td align="left"><input type="text" id="userAddress" name="userAddress" placeholder="请输入工作地址"/></td>
                <td id="addressspan" style="color: red;font-size:12px;text-align:left;width:110px"></td>
            </tr>
            <tr>
                <span id="msg" style="font-size: 12px;color: red">${messageModel.msg}</span>
            </tr>
            <tr>
                <td colspan="3" align="center">
                    <button type="button" id="sign">注册</button>
                </td>
            </tr>
            <tr>
                <td colspan="2" align="right">已有账号？<a href="login.jsp" style="color:#458fce">立即登录</a></td>
            </tr>
        </table>
    </form>
</div>

<script type="text/javascript" src="js/jquery-3.4.1.js"></script>
<script type="text/javascript">
    var flag1 = 0;
    var flag2 = 0;
    var flag3 = 0;
    var flag4 = 0;
    var flag5 = 1;
    var msgbox = "用户名不能为空！";
    //1.
    $('#userName').change(function () {
        var name = $('#userName').val();
        //var reg=/^\w{6,10}$/; //验证格式，6-9位字母、数字或下划线
        var reg = /^[a-zA-Z0-9]{0,}$/;
        if (isEmpty(name)) {
            $('#namespan').html("用户名不能为空！");
            msgbox = '用户名不能为空！';
            return;
        } else if (name.length < 6 || name.length > 9) {
            $('#namespan').html("用户名长度必须大于等于6，小于10！");
            msgbox = '用户名格式错误，长度必须大于等于6，小于10！！';
            return;
        } else if (!(reg.test(name))) {
            $('#namespan').html("只能是字母或数字！");
            msgbox = '用户名格式错误，只能是字母或数字！';
            return;
        } else {
            flag1 = 1;
            //格式正确，红色提示信息变为空
            $('#namespan').html("");
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
    $('#userPwd2').change(function () {
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
    //4.
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
    //5.
    $('#userAddress').change(function () {
        if (flag4) {
            var address = $('#userAddress').val();
            if (address.length > 50) {
                $('#addressspan').html("最多输入50个字符！");
                msgbox = '单位格式错误，最多输入50个字符！';
                flag5 = 0
                return;
            } else {
                //格式正确，红色提示信息变为空
                flag5 = 1;
                $('#addressspan').html("");
            }
        }
    });

    $('#sign').click(function () {
        if (flag4 & flag5) {
            $('#signForm').submit();
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
<!--分割线-->
</html>
