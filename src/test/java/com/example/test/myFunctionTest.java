package com.example.test;

import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import java.text.ParseException;

import static org.junit.jupiter.api.Assertions.*;

class myFunctionTest {
    myFunction funcObj;
    @BeforeEach
    void setUp() {
        System.out.println("开始测试");
        funcObj=new myFunction();
    }

    @AfterEach
    void tearDown() {
        System.out.println("结束测试");
        funcObj=null;
    }

    @Test
    void isEmpty_1() {
        System.out.println("测试是否为空。。。");
        assertTrue(funcObj.isEmpty("")==true);
    }
    @Test
    void isEmpty_2() {
        System.out.println("测试是否为空。。。");
        assertTrue(funcObj.isEmpty("你好！")==false);
    }

    @Test
    void isUserName_1() {//格式不符
        System.out.println("测试是否为合法用户名。。。");
        assertTrue(funcObj.isUserName("赫然今天吃煲仔饭")==false);
    }
    @Test
    void isUserName_2() {//长度不符
        System.out.println("测试是否为合法用户名。。。");
        assertTrue(funcObj.isUserName("lisi")==false);
    }
    @Test
    void isUserName_3() {//合法
        System.out.println("测试是否为合法用户名。。。");
        assertTrue(funcObj.isUserName("lisi123")==true);
    }

    @Test
    void isPwd_1() {//格式不符
        System.out.println("测试是否为合法密码。。。");
        assertTrue(funcObj.isPwd("1234567")==false);
    }
    @Test
    void isPwd_2() {//长度过短
        System.out.println("测试是否为合法密码。。。");
        assertTrue(funcObj.isPwd("123Aa@")==false);
    }
    @Test
    void isPwd_3() {//长度过长
        System.out.println("测试是否为合法密码。。。");
        assertTrue(funcObj.isPwd("123Aa@123456")==false);
    }
    @Test
    void isPwd_4() {//合法
        System.out.println("测试是否为合法密码。。。");
        assertTrue(funcObj.isPwd("Qq123%%")==true);
    }

    @Test
    void isSame_1() {//不一致
        System.out.println("测试两次密码是否一致。。。");
        assertTrue(funcObj.isSame("123","1234")==false);
    }
    void isSame_2() {//一致
        System.out.println("测试两次密码是否一致。。。");
        assertTrue(funcObj.isSame("123","123")==true);
    }

    @Test
    void isEmail_1() {//格式不符
        System.out.println("测试是否为合法邮箱。。。");
        assertTrue(funcObj.isEmail("123@123")==false);
    }

    @Test
    void isEmail_2() {//格式不符
        System.out.println("测试是否为合法邮箱。。。");
        assertTrue(funcObj.isEmail("123@13.com")==true);
    }

    @Test
    void isAddress_1() {//
        System.out.println("测试是否为合法地址。。。");
        assertTrue(funcObj.isAddress("柯桥区柯桥街道山阴路中国轻纺城果品蔬菜批发市场综合楼105号")==true);
    }

    @Test
    void isTrueName_1() {//格式不符
        System.out.println("测试是否为合法姓名。。。");
        assertTrue(funcObj.isTrueName("123a")==false);
    }
    @Test
    void isTrueName_2() {//长度不符
        System.out.println("测试是否为合法姓名。。。");
        assertTrue(funcObj.isTrueName("理塘丁真真")==false);
    }
    @Test
    void isTrueName_3() {//合法
        System.out.println("测试是否为合法姓名。。。");
        assertTrue(funcObj.isTrueName("丁真")==true);
    }
    @Test
    void isTrueName_4() {//合法
        System.out.println("测试是否为合法姓名。。。");
        assertTrue(funcObj.isTrueName("litangDingZhen")==true);
    }

    @Test
    void isPhoneNumber_1() {//长度不符
        System.out.println("测试是否为合法手机号。。。");
        assertTrue(funcObj.isPhoneNumber("12345678")==false);
    }
    @Test
    void isPhoneNumber_2() {//格式不符
        System.out.println("测试是否为合法手机号。。。");
        assertTrue(funcObj.isPhoneNumber("12345678a90")==false);
    }
    @Test
    void isPhoneNumber_3() {//合法
        System.out.println("测试是否为合法手机号。。。");
        assertTrue(funcObj.isPhoneNumber("12345678901")==true);
    }

    @Test
    void isBirthday() throws ParseException {//格式不符
        System.out.println("测试是否为合法生日。。。");
        assertTrue(funcObj.isBirthday("1997/11/11")==false);
    }
    @Test
    void isBirthday_2() throws ParseException {//小于1900年
        System.out.println("测试是否为合法生日。。。");
        assertTrue(funcObj.isBirthday("1899/11/11")==false);
    }
    @Test
    void isBirthday_3() throws ParseException {//大于当前时间
        System.out.println("测试是否为合法生日。。。");
        assertTrue(funcObj.isBirthday("2022-7-9")==false);
    }
    @Test
    void isBirthday_4() throws ParseException {//合法
        System.out.println("测试是否为合法生日。。。");
        assertTrue(funcObj.isBirthday("1997-11-11")==true);
    }
}