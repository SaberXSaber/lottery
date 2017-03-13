package com.lottery.controller;

import com.lottery.pojo.UsersEntity;
import com.lottery.service.UserService;
import com.lottery.utils.ConstantParm;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

/**
 * Created by IntelliJ IDEA.
 * User: guoshubo
 * Date: 2017/3/3
 * Time: 16:45
 * Description：
 */
@Controller
public class IndexController {
    @Resource
    private  UserService userService;

    @RequestMapping("/index")
    public String index(){
        return "/login";
    }


    @RequestMapping("/login")
    public String login( HttpSession httpSession,Model model,String username,String password) {
        if(StringUtils.isBlank(username)&&StringUtils.isNotBlank(password)){
            model.addAttribute("msg", "用户名和密码错误");
            return "login";
        }
        UsersEntity user= userService.getUserByNamepwd(username, password);
        if (user != null){
            httpSession.setAttribute(ConstantParm.SEESION_USER, user);
            httpSession.setMaxInactiveInterval(30 * 60);
            return "/index";
        }else {
            model.addAttribute("msg", "用户名和密码错误");
            return "/login";
        }
    }

    @RequestMapping("/logout")
    public String logout( HttpSession httpSession) {
        httpSession.removeAttribute(ConstantParm.SEESION_USER);
        return "/login";
    }
}
