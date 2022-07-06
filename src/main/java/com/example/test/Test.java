package com.example.test;

import com.example.entity.User;
import com.example.mapper.UserMapper;
import com.example.util.GetSqlSession;
import org.apache.ibatis.session.SqlSession;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

public class Test {
    public static void main(String[] args){
        SqlSession session = GetSqlSession.createSqlSession();
        UserMapper userMapper=session.getMapper(UserMapper.class);
        User user= userMapper.queryUserByEmail("12345@qq.com");
        System.out.println(user);
    }

    /**public static void main(String[] args){
        SqlSession session = GetSqlSession.createSqlSession();
        UserMapper userMapper=session.getMapper(UserMapper.class);
        User user= new User();
        user.setUserName("傻逼");
        user.setUserPwd("Qq1231231");
        user.setUserEmail("1173349123431@qq.com");
        user.setUserAddress("gp之江学院");
        DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//注意月和小时的格式为两个大写字母
        java.util.Date date = new Date();//获得当前时间
        String registTime = df.format(date);//将当前时间转换成特定格式的时间字符串，这样便可以插入到数据库中
        user.setRegistTime(registTime);
        userMapper.insertUser(user);
    }*/
}
