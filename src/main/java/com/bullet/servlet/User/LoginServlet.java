package com.bullet.servlet.User;


import com.bullet.pojo.User;
import com.bullet.service.User.UserService;
import com.bullet.service.User.UserServiceImpl;
import com.bullet.util.Constants;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * @author Administrator
 * @Auther: bullet
 * @Description: com.bullet.servlet.user
 * @version: 1.0
 */
public class LoginServlet extends HttpServlet {
    //Servlet is the Controller, control the servie layer

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String userCode = req.getParameter("userCode");
        String userPassword = req.getParameter("userPassword");

        //Using the service layer method to match
        UserService userService = new UserServiceImpl();
        User user = userService.login(userCode,userPassword);

        if(null != user){// login success
            req.getSession().setAttribute(Constants.USER_SESSION,user);
            resp.sendRedirect("jsp/frame.jsp");
        }else{

            req.setAttribute("error", "Incorrect username or password");
            req.getRequestDispatcher("login.jsp").forward(req,resp);
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doGet(req, resp);
    }


}
