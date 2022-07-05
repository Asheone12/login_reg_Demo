package com.example.test;

import com.example.entity.User;
import com.example.mapper.UserMapper;
import com.example.util.GetSqlSession;
import org.apache.ibatis.session.SqlSession;

public class Test {
    public static void main(String[] args){
        SqlSession session = GetSqlSession.createSqlSession();
        UserMapper userMapper=session.getMapper(UserMapper.class);
        User user= userMapper.queryUserByName("user_admin");
        System.out.println(user);
    }
}
