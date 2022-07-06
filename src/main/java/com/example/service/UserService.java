package com.example.service;

import com.example.entity.User;
import com.example.entity.vo.MessageModel;
import com.example.mapper.UserMapper;
import com.example.util.GetSqlSession;
import com.example.util.StringUtil;
import org.apache.ibatis.session.SqlSession;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

//用户登录
public class UserService {
    public MessageModel userLogin(String username, String password) {
        MessageModel messageModel = new MessageModel();
        User user = new User();
        user.setUserName(username);
        user.setUserPwd(password);
        messageModel.setObject(user);
        //1.参数的非空判断
        if (StringUtil.isEmpty(username) || StringUtil.isEmpty(password)) {
            //将状态码、提示信息、回显数据色号知道消息模型对象中，返回消息模型对象
            messageModel.setCode(0);
            messageModel.setMsg("用户姓名和密码不能为空");
            //回显数据
            return messageModel;
        }
        //2.调用Dao（mapper）层的查询方法，通过用户名查询用户对象
        SqlSession session = GetSqlSession.createSqlSession();
        UserMapper userMapper = session.getMapper(UserMapper.class);
        User u = userMapper.queryUserByName(username);
        //3.判断用户对象是否为空
        if (u == null) {
            //将状态码、提示信息、回显数据设置到消息模型对象中，返回消息模型对象
            messageModel.setCode(0);
            messageModel.setMsg("用户不存在");
            return messageModel;
        }
        //4.判断数据库中查询到的用户密码与前台传递过来的密码作比较,如果不相等，将状态码、提示信息、回显数据设置到消息模型对象中，返回消息模型对象
        if (!password.equals(u.getUserPwd())) {
            //密码不正确
            messageModel.setCode(0);
            messageModel.setMsg("用户密码不正确");
            return messageModel;
        }
        //5.将成功状态、提示信息、用户对象设置到消息模型对象，并return
        messageModel.setObject(u);
        return messageModel;
    }

    public MessageModel userRegist(String username, String userpwd,String userpwd2, String useremail, String useraddress) {
        MessageModel messageModel = new MessageModel();
        User user = new User();
        user.setUserName(username);
        user.setUserPwd(userpwd);
        user.setUserEmail(useremail);
        user.setUserAddress(useraddress);
        DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//注意月和小时的格式为两个大写字母
        java.util.Date date = new Date();//获得当前时间
        String registTime = df.format(date);//将当前时间转换成特定格式的时间字符串，这样便可以插入到数据库中
        user.setRegistTime(registTime);
        //将用户信息存入消息模型中
        messageModel.setObject(user);
        //1.参数的非空判断
        if (StringUtil.isEmpty(username) || StringUtil.isEmpty(userpwd)) {
            //将状态码、提示信息、回显数据色号知道消息模型对象中，返回消息模型对象
            messageModel.setCode(0);
            messageModel.setMsg("用户姓名和密码不能为空");
            //回显数据
            return messageModel;

        }else if(StringUtil.isEmpty(userpwd2)){
            messageModel.setCode(0);
            messageModel.setMsg("请再次输入密码！");
            //回显数据
            return messageModel;
        }
        //2.调用Dao（mapper）层的查询方法，通过用户名查询用户对象
        SqlSession session = GetSqlSession.createSqlSession();
        UserMapper userMapper = session.getMapper(UserMapper.class);
        User u = userMapper.queryUserByName(username);//在数据库查询该用户对象
        //3.判断用户对象是否已存在
        if (u != null) {
            //将状态码、提示信息、回显数据设置到消息模型对象中，返回消息模型对象
            messageModel.setCode(0);
            messageModel.setMsg("该用户已存在！");
            return messageModel;
        }
        //4.判断邮箱是否已被使用
        //5.判断两次密码是否不一致
        if (!userpwd2.equals(userpwd)) {
            messageModel.setCode(0);
            messageModel.setMsg("两次密码不一致！");
            return messageModel;
        }
        //5.将成功状态、提示信息、用户对象设置到消息模型对象，并return
        messageModel.setObject(user);
        //成功后，插入数据到数据库
        userMapper.insertUser(user);
        return messageModel;
    }
}