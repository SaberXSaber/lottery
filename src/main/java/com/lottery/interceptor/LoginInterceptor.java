package com.lottery.interceptor;

import com.lottery.pojo.UsersEntity;
import com.lottery.utils.ConstantParm;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Created by IntelliJ IDEA.
 * User: guoshubo
 * Date: 2017/2/16
 * Time: 11:23
 * Description：
 */
class LoginInterceptor implements HandlerInterceptor {

    private static  final  String[] letGoUrls = {"/login","/error","index"};


    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object o) throws Exception {
        //获取请求的URL
        String url = request.getRequestURI();

        //URL:login.jsp是公开的;这个demo是除了login.jsp是可以公开访问的，其它的URL都进行拦截控制
        for(String s : letGoUrls){
            if(url.contains(s)){//url包含登录相关的链接
                return true;
//                break; //跳出
            }
        }


        //获取Session
        HttpSession session = request.getSession();
        UsersEntity user = (UsersEntity)session.getAttribute(ConstantParm.SEESION_USER);

        if(user != null){
            return true;
        }
        //不符合条件的，跳转到登录界面
//        request.getRequestDispatcher("/").forward(request, response);
        response.sendRedirect("/index");

        return false;
    }


    @Override
    public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, ModelAndView modelAndView) throws Exception {

    }

    @Override
    public void afterCompletion(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) throws Exception {

    }
}
