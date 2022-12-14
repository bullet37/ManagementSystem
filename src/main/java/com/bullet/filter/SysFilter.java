package com.bullet.filter;

import com.bullet.pojo.User;
import com.bullet.util.Constants;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * @author Administrator
 * @Auther: bullet
 * @Description: com.bullet.filter
 * @version: 1.0
 */
public class SysFilter implements Filter {

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {}

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest request =  (HttpServletRequest)servletRequest;
        HttpServletResponse response = (HttpServletResponse)servletResponse;

        //过滤器，从session中获取用户
        User user = (User)request.getSession().getAttribute(Constants.USER_SESSION);
        if(user == null) {//已经被移除或者注销了，或者未登录
            response.sendRedirect(request.getContextPath()+"/error.jsp");
        }else {
            filterChain.doFilter(servletRequest, servletResponse);
        }
    }

    @Override
    public void destroy() {}
}
