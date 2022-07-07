package com.example.controller;

import com.example.entity.vo.MessageModel;
import com.example.service.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/updateMsg")
public class UpdateMsgServlet extends HttpServlet {
    private UserService userService = new UserService();
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // 1.接收客户端的请求（接收参数；姓名，密码）
        String username = req.getParameter("userName");
        String userpwd0 = req.getParameter("userPwd0");
        String userpwd = req.getParameter("userPwd");
        String useremail = req.getParameter("userEmail");
        // 2.调用service层的方法，返回消息模型对象
        MessageModel messageModel = userService.userUpdate(username, userpwd0,userpwd,useremail);
        // 3.判断消息模的状态码
        if (messageModel.getCode() == 1) {//成功
            req.getSession().setAttribute("user", messageModel.getObject());
            resp.sendRedirect("index.jsp");
        } else {  //失败
//            System.out.println("登录失败");
            //将消息模型对象设置到request作用域中，请求转发跳转到login.jsp
            req.setAttribute("messageModel", messageModel);
            req.getRequestDispatcher("update.jsp").forward(req, resp);
        }
    }
}
