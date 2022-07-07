<%--
  Created by IntelliJ IDEA.
  User: Dell
  Date: 2022/7/7
  Time: 22:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登录失败页面</title>
</head>
<script type="text/javascript" src="js/jquery-3.4.1.js"></script>
<script type="text/javascript">
    function gettime() {
        var d = new Date().Format("yyyy-MM-dd HH:mm");
        var str = "软件测试综合实验-计算机1901-10-" + d;
        document.getElementById("t").innerHTML = str;
        window.setTimeout("gettime()", 1000);
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
    <h2>${failedMsg}</h2>
    <h2><a href="login.jsp" style="color:#458fce">重新登录</a></h2>
</div>
</body>
</html>
