package com.lottery.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Created by IntelliJ IDEA.
 * User: guoshubo
 * Date: 2017/3/16
 * Time: 10:23
 * Description：
 */
@Controller
@RequestMapping("/")
public class DateReportController {
    @RequestMapping(value="/datereportlist",method = RequestMethod.GET)
    public String datereportlist(ModelMap model){

        return "users/";
    }
}
