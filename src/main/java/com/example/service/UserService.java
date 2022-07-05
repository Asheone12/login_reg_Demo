package com.example.service;

import com.example.entity.User;
import com.example.entity.vo.MessageModel;
import com.example.mapper.UserMapper;
import com.example.util.GetSqlSession;
import com.example.util.StringUtil;
import org.apache.ibatis.session.SqlSession;

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
}
