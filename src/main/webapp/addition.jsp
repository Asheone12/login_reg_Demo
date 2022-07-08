<%--
  Created by IntelliJ IDEA.
  User: Dell
  Date: 2022/7/7
  Time: 14:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>补充信息</title>
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
    <form action="addition" id="addForm" method="post">
        <table style="margin: auto">
            <div class="line"></div>
            <font size="5">填写补充信息</font>
            <div class="line"></div>
            <br><br>
            <tr>
                <td align="right">用户名</td>
                <td align="left"><input type="text" id="userName" name="userName" readonly="readonly"
                                        value="${user.userName}"/></td>
                <td id="namespan" style="color: red;font-size:12px;text-align:left;width:110px"></td>
            </tr>
            <tr>
                <td align="right">真实姓名</td>
                <td align="left"><input type="text" id="trueName" name="trueName" placeholder="必填，请输入真实姓名"/></td>
                <td id="truenamespan" style="color: red;font-size:12px;text-align:left;width:110px"></td>
            </tr>
            <tr>
                <td align="right">电话号码</td>
                <td align="left"><input type="text" id="phoneNumber" name="phoneNumber" placeholder="选填，请输入11位电话号码"/>
                </td>
                <td id="phonespan" style="color: red;font-size:12px;text-align:left;width:110px"></td>
            </tr>
            <tr>
                <td align="right">生 日</td>
                <td align="left"><input type="text" id="birthday" name="birthday" placeholder="必填，格式：1977-12-14"/></td>
                <td id="birthspan" style="color: red;font-size:12px;text-align:left;width:110px"></td>
            </tr>
            <tr>
                <span id="msg" style="font-size: 12px;color: red">${messageModel.msg}</span>
            </tr>
            <tr>
                <td colspan="3" align="center">
                    <button type="button" id="addMsg">提交补充信息</button>
                </td>
            </tr>
            <tr>
                <td colspan="2" align="right"><a href="index.jsp" style="color:#458fce">返回首页</a></td>
            </tr>
        </table>
    </form>
</div>

<script type="text/javascript">
    var flag1 = 0;
    var flag2 = 1;
    var flag3 = 0;
    var msgbox = "姓名不能为空！";
    //1.
    $('#trueName').bind('focus input propertychange', function () {
        var tname = $('#trueName').val();
        var reg = /^[\u4e00-\u9fa5]{2,4}|[a-zA-Z]{1,20}$/;
        if (isEmpty(tname)) {
            $('#truenamespan').html("姓名不能为空！");
            msgbox = '姓名不能为空！';
            return;
        } else if (!(reg.test(tname))) {
            $('#truenamespan').html("只能是2-4个中文或20个以内英文字符！");
            msgbox = '姓名格式错误，只能是2-4个中文或20个以内英文字符！';
            return;
        } else {
            flag1 = 1;
            //格式正确，红色提示信息变为空
            $('#truenamespan').html("");
        }
    });
    //2.
    $('#phoneNumber').bind('focus input propertychange', function () {
        var phone = $('#phoneNumber').val();
        var reg = /^\d{11}$/; //验证格式，
        if (!(reg.test(phone))) {
            $('#phonespan').html("号码必须由11位的数字组成!");
            msgbox = '号码格式错误，号码必须由11位的数字组成!';
            flag2 = 0;
            return;
        } else {
            flag2 = 1;
            //格式正确，红色提示信息变为空
            $('#phonespan').html("");
        }
    });
    //3.
    $('#birthday').bind('focus input propertychange', function () {
        var birth = $('#birthday').val();
        var myDate = new Date();
        var reg = /^(\d{4})-(\d{2})-(\d{2})$/; //验证格式，
        if (isEmpty(birth)) {
            $('#birthspan').html("生日不能为空！");
            msgbox = '生日不能为空！';
            return;
        } else if (!verifyDate(birth, reg)) {
            $('#birthspan').html("日期格式不正确!例:1977-11-11");
            msgbox = '日期格式不正确!!';
            return;
        }else if(!IsDate(birth)){
            $('#birthspan').html("日期不合法！");
            msgbox = '日期不合法!';
        }else {
            flag3 = 1;
            //格式正确，红色提示信息变为空
            $('#birthspan').html("");
        }
    });

    $('#addMsg').click(function () {
        if (flag1 & flag2 & flag3) {
            $('#addForm').submit();
        } else {
            Alert(msgbox);
        }

    });

    function isEmpty(str) {
        if (str == null || str.trim() == "")
            return true;
        return false;
    }

    function verifyDate(dateStr, dateReg) {//判断日期格式并修正日期
        //日期格式不匹配
        if (!dateReg.test(dateStr)) {
            return false;
        }

        //使用捕获组获取日期
        var date = {
            year: RegExp.$1,
            month: RegExp.$2,
            day: RegExp.$3,
        }

        //使用 Date() 对象，新建对象时会将日期转化为合法日期
        //比如 2020-02-30 被转化为 2020-3-1
        var dateObj = new Date(date.year, date.month - 1, date.day);

        if (date.year != dateObj.getFullYear() || date.month != dateObj.getMonth() + 1 || date.day != dateObj.getDate()) {
            return false;
        }
        return true;
    }
    function IsDate(str) {
        arr = str.split("-");
            intYear = parseInt(arr[0], 10);
            intMonth = parseInt(arr[1], 10);
            intDay = parseInt(arr[2], 10);
            total = intDay + intMonth * 100 + intYear * 10000;

            myDate = new Date();
            var y = myDate.getFullYear();
            var m = myDate.getMonth() + 1;//获取当前月份的日期
            var d = myDate.getDate();
            t = d + m * 100 + y * 10000;
            if (intYear < 1900) {
                return false;
            }
            if (total > t) {
                return false;
            }
            return true
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
