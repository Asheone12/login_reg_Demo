package com.example.controller;

import com.example.entity.vo.MessageModel;
import com.example.service.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/addition")
public class AdditionServlet extends HttpServlet {
    //实例化UserService对象
    private UserService userService = new UserService();
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // 1.接收客户端的请求（接收参数；姓名，密码）
        String username = req.getParameter("userName");
        String trueName = req.getParameter("trueName");
        String phoneNumber = req.getParameter("phoneNumber");
        String birthday = req.getParameter("birthday");
        // 2.调用service层的方法，返回消息模型对象
        MessageModel messageModel = userService.userAdd(username,trueName,phoneNumber,birthday);
        // 3.判断消息模的状态码
        if (messageModel.getCode() == 1) {//成功
            req.getSession().setAttribute("user", messageModel.getObject());
            resp.sendRedirect("index.jsp");
        } else {  //失败
//            System.out.println("登录失败");
            //将消息模型对象设置到request作用域中，请求转发跳转到login.jsp
            req.setAttribute("messageModel", messageModel);
            req.getRequestDispatcher("login.jsp").forward(req, resp);
        }
    }
}
