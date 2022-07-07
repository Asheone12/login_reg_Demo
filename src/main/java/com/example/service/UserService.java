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
        //1.调用Dao（mapper）层的查询方法，通过用户名查询用户对象
        SqlSession session = GetSqlSession.createSqlSession();
        UserMapper userMapper = session.getMapper(UserMapper.class);
        User u = userMapper.queryUserByName(username);
        //2.判断用户对象是否为空
        if (u == null) {
            //将状态码、提示信息、回显数据设置到消息模型对象中，返回消息模型对象
            messageModel.setCode(0);
            messageModel.setMsg("用户不存在");
            return messageModel;
        }
        //3.判断数据库中查询到的用户密码与前台传递过来的密码作比较,如果不相等，将状态码、提示信息、回显数据设置到消息模型对象中，返回消息模型对象
        if (!password.equals(u.getUserPwd())) {
            //密码不正确
            messageModel.setCode(0);
            messageModel.setMsg("用户密码不正确");
            return messageModel;
        }
        //4.将成功状态、提示信息、用户对象设置到消息模型对象，并return
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
        //1.调用Dao（mapper）层的查询方法，通过用户名查询用户对象,以及通过邮箱查询用户对象
        SqlSession session = GetSqlSession.createSqlSession();
        UserMapper userMapper = session.getMapper(UserMapper.class);
        User u = userMapper.queryUserByName(username);//在数据库查询该用户对象
        User ue = userMapper.queryUserByEmail(useremail);//在数据库查询该用户对象
        //2.判断重复
        //判断用户名是否重复
        if (u != null) {
            //将状态码、提示信息、回显数据设置到消息模型对象中，返回消息模型对象
            messageModel.setCode(0);
            messageModel.setMsg("该用户已存在！");
            return messageModel;
        }
        //判断邮箱是否已被使用
        if (ue != null) {
            //将状态码、提示信息、回显数据设置到消息模型对象中，返回消息模型对象
            messageModel.setCode(0);
            messageModel.setMsg("该邮箱已被使用！");
            return messageModel;
        }

        //3.将成功状态、提示信息、用户对象设置到消息模型对象，并return
        messageModel.setObject(user);
        //成功后，插入数据到数据库
        userMapper.insertUser(user);
        return messageModel;
    }

    public MessageModel userAdd(String username, String truename,String phone, String birthday) {
        MessageModel messageModel = new MessageModel();
        User user = new User();
        user.setUserName(username);
        user.setTrueName(truename);
        user.setPhoneNumber(phone);
        user.setBirthday(birthday);
        //将用户信息存入消息模型中
        messageModel.setObject(user);
        //1.调用Dao（mapper）层的查询方法，通过用户名查询用户对象
        SqlSession session = GetSqlSession.createSqlSession();
        UserMapper userMapper = session.getMapper(UserMapper.class);

        //2.将成功状态、提示信息、用户对象设置到消息模型对象，并return
        //修改数据到数据库
        userMapper.addMsgUser(user);
        User u = userMapper.queryUserByName(username);//在数据库查询该用户对象
        messageModel.setObject(u);
        return messageModel;
    }

    public MessageModel userUpdate(String username, String userpwd0,String userpwd, String useremail) {
        MessageModel messageModel = new MessageModel();
        User user = new User();
        user.setUserName(username);
        user.setUserPwd(userpwd);
        user.setUserEmail(useremail);
        //将用户信息存入消息模型中
        messageModel.setObject(user);
        //1.调用Dao（mapper）层的查询方法，通过用户名查询用户对象,以及通过邮箱查询用户对象
        SqlSession session = GetSqlSession.createSqlSession();
        UserMapper userMapper = session.getMapper(UserMapper.class);
        User u = userMapper.queryUserByName(username);//在数据库查询该用户对象
        User ue = userMapper.queryUserByEmail(useremail);//在数据库查询该用户对象
        //2.判断旧密码是否正确
        if (!userpwd0.equals(u.getUserPwd())) {
            //密码不正确
            messageModel.setCode(0);
            messageModel.setMsg("用户密码不正确");
            return messageModel;
        }
        //3.判断重复
        //判断邮箱是否已被使用
        if (ue != null) {
            //将状态码、提示信息、回显数据设置到消息模型对象中，返回消息模型对象
            messageModel.setCode(0);
            messageModel.setMsg("该邮箱已被使用！");
            return messageModel;
        }

        //3.将成功状态、提示信息、用户对象设置到消息模型对象，并return
        //成功后，插入数据到数据库
        userMapper.updateUser(user);
        u = userMapper.queryUserByName(username);//在数据库查询该用户对象
        messageModel.setObject(u);
        return messageModel;
    }
}