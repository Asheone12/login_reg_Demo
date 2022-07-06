package com.example.controller;

import com.example.entity.User;
import com.example.entity.vo.MessageModel;
import com.example.mapper.UserMapper;
import com.example.service.UserService;
import com.example.util.GetSqlSession;
import org.apache.ibatis.session.SqlSession;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
    //实例化UserService对象
    private UserService userService = new UserService();

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //1.接收客户端请求
        String user_name=req.getParameter("userName");
        String user_pwd=req.getParameter("userPwd");
        String user_pwd2=req.getParameter("userPwd2");
        String user_email=req.getParameter("userEmail");
        String user_address=req.getParameter("userAddress");
        //2.调用service层方法，返回消息模型对象
        MessageModel messageModel = userService.userRegist(user_name, user_pwd,user_pwd2,user_email,user_address);
        // 3.判断消息模的状态码
        if (messageModel.getCode() == 1) {//成功
            req.getSession().setAttribute("newUser", messageModel.getObject());
            resp.sendRedirect("login.jsp");
        } else {  //失败
//            System.out.println("登录失败");
            //将消息模型对象设置到request作用域中，请求转发跳转到login.jsp
            req.setAttribute("messageModel", messageModel);
            req.getRequestDispatcher("register.jsp").forward(req, resp);
        }
    }

}
