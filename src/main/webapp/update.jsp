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
<script type="text/javascript">
    var flag1 = 0;
    var flag2 = 0;
    var flag3 = 0;
    var flag4 = 0;
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
    $('#userPwd').bind('focus input propertychange', function () {
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
    });
    //3.
    $('#userPwd2').bind('focus input propertychange', function () {
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
    });

    $('#userEmail').bind('focus input propertychange', function () {
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
    });
    $('#update').click(function () {
        if (flag1 & flag2 & flag3 & flag4) {
            $('#updateForm').submit();
        } else {
            Alert(msgbox);
        }

    });

    function isEmpty(str) {
        if (str == null || str.trim() == "")
            return true;
        return false;
    }
    //自动关闭提示框
    function Alert(str) {
        var msgw,msgh,bordercolor;
        msgw=350;//提示窗口的宽度
        msgh=80;//提示窗口的高度
        titleheight=25 //提示窗口标题高度
        bordercolor="#336699";//提示窗口的边框颜色
        titlecolor="#99CCFF";//提示窗口的标题颜色
        var sWidth,sHeight;
        //获取当前窗口尺寸
        sWidth = document.body.offsetWidth;
        sHeight = document.body.offsetHeight;
//    //背景div
        var bgObj=document.createElement("div");
        bgObj.setAttribute('id','alertbgDiv');
        bgObj.style.position="absolute";
        bgObj.style.top="0";
        bgObj.style.background="#E8E8E8";
        bgObj.style.filter="progid:DXImageTransform.Microsoft.Alpha(style=3,opacity=25,finishOpacity=75";
        bgObj.style.opacity="0.6";
        bgObj.style.left="0";
        bgObj.style.width = sWidth + "px";
        bgObj.style.height = sHeight + "px";
        bgObj.style.zIndex = "10000";
        document.body.appendChild(bgObj);
        //创建提示窗口的div
        var msgObj = document.createElement("div")
        msgObj.setAttribute("id","alertmsgDiv");
        msgObj.setAttribute("align","center");
        msgObj.style.background="white";
        msgObj.style.border="1px solid " + bordercolor;
        msgObj.style.position = "absolute";
        msgObj.style.left = "50%";
        msgObj.style.font="12px/1.6em Verdana, Geneva, Arial, Helvetica, sans-serif";
        //窗口距离左侧和顶端的距离
        msgObj.style.marginLeft = "-225px";
        //窗口被卷去的高+（屏幕可用工作区高/2）-150
        msgObj.style.top = document.body.scrollTop+(window.screen.availHeight/2)-150 +"px";
        msgObj.style.width = msgw + "px";
        msgObj.style.height = msgh + "px";
        msgObj.style.textAlign = "center";
        msgObj.style.lineHeight ="25px";
        msgObj.style.zIndex = "10001";
        document.body.appendChild(msgObj);
        //提示信息标题
        var title=document.createElement("h4");
        title.setAttribute("id","alertmsgTitle");
        title.setAttribute("align","left");
        title.style.margin="0";
        title.style.padding="3px";
        title.style.background = bordercolor;
        title.style.filter="progid:DXImageTransform.Microsoft.Alpha(startX=20, startY=20, finishX=100, finishY=100,style=1,opacity=75,finishOpacity=100);";
        title.style.opacity="0.75";
        title.style.border="1px solid " + bordercolor;
        title.style.height="18px";
        title.style.font="12px Verdana, Geneva, Arial, Helvetica, sans-serif";
        title.style.color="white";
        title.innerHTML="提示信息";
        document.getElementById("alertmsgDiv").appendChild(title);
        //提示信息
        var txt = document.createElement("p");
        txt.setAttribute("id","msgTxt");
        txt.style.margin="16px 0";
        txt.innerHTML = str;
        document.getElementById("alertmsgDiv").appendChild(txt);
        //设置关闭时间
        window.setTimeout("closewin()",1000);
    }
    function closewin() {
        document.body.removeChild(document.getElementById("alertbgDiv"));
        document.getElementById("alertmsgDiv").removeChild(document.getElementById("alertmsgTitle"));
        document.body.removeChild(document.getElementById("alertmsgDiv"));
    }
</script>
</body>
</html>
