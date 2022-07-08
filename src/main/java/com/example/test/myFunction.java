package com.example.test;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.regex.Pattern;

public class myFunction {
    public boolean isEmpty(String str) { //判断为空
        if (str == null || str.trim() == "")
            return true;
        return false;
    }

    public boolean isUserName(String name) { //判断用户名是否合法
        String reg = "^[a-zA-Z0-9]*$"; //验证格式，只能是字母或数字！
        if (isEmpty(name)) { //用户名为空
            return false;
        } else if (name.length() < 6 || name.length() > 9) { //用户名长度不符
            return false;
        } else if (!Pattern.matches(reg, name)) {//用户名格式不符
            return false;
        } else {
            return true;
        }
    }

    public boolean isPwd(String password) {//判定密码是否合法
        String reg = "^(?![A-Za-z0-9]+$)(?![a-z0-9\\W]+$)(?![A-Za-z\\W]+$)(?![A-Z0-9\\W]+$)[a-zA-Z0-9\\W]{7,11}$"; //验证格式，至少各含有1个数字、1个大写字母、1个小写字母和其它字符
        if (isEmpty(password)) {  //密码为空
            return false;
        }else if (!Pattern.matches(reg, password)) { //密码格式错误
            return false;
        } else {
            return true;
        }
    }

    public boolean isSame(String password1, String password2) { //两次密码是否相同
        if (password1 != password2) {
            return false;
        } else {
            return true;
        }
    }

    public boolean isEmail(String email) { //判定邮箱
        String reg = "\\w+([-+.]\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*";//邮箱的格式
        if (isEmpty(email)) {
            return false;
        } else if (!Pattern.matches(reg, email)) {//验证格式
            return false;
        } else {
            return true;
        }
    }

    public boolean isAddress(String address) { //判定单位
        if (address.length() > 50) {
            return false;
        } else {
            return true;
        }
    }

    public boolean isTrueName(String tname) { //判定真实姓名
        String reg ="^[\\u4e00-\\u9fa5]{2,4}|[a-zA-Z]{1,20}$";
        if (isEmpty(tname)) {
            return false;
        } else if (!Pattern.matches(reg, tname)) {
            return false;
        } else {
            return true;
        }
    }

    public boolean isPhoneNumber(String phone) {//判断电话号码11位
        String reg ="^\\d{11}$"; //验证格式，
        if (!Pattern.matches(reg, phone)) {
            return false;
        } else {
            return true;
        }
    }

    public boolean isBirthday(String birth) throws ParseException { //判定生日
        String reg = "^(\\d{4})-(\\d{2})-(\\d{2})$"; //验证格式，
        boolean flag=true;
        if (isEmpty(birth)) {   //日期为空
            flag=false;
        } else if (!Pattern.matches(reg, birth)) { //格式不正确
            flag =false;
        }else {
            SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
            String old="1900-01-01";
            String now=simpleDateFormat.format(new Date());
            Date birthTime = simpleDateFormat.parse(birth);
            Date oldTime = simpleDateFormat.parse(old);
            Date nowTime=simpleDateFormat.parse(now);
            flag=(birthTime.before(nowTime))&&(oldTime.before(birthTime));
        }
        return flag;
    }
}
