package com.lottery.controller;

import com.lottery.pojo.OperationLog;
import com.lottery.pojo.UsersEntity;
import com.lottery.service.OperationLogService;
import com.lottery.service.RolePageService;
import com.lottery.utils.ConstantParm;
import com.lottery.utils.FuncUtils;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: guoshubo
 * Date: 2017/3/8
 * Time: 14:33
 * Description：
 */
public class BaseController {
    @Resource
    private OperationLogService operationLogService;
    @Resource
    private RolePageService rolePageService;

    public  void addOperationLog( int operatortype,String desc,String params){
        HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
        HttpSession session = request.getSession();
        UsersEntity user= (UsersEntity) session.getAttribute(ConstantParm.SEESION_USER);
        OperationLog o = FuncUtils.setOperationLog(user.getUserId(), operatortype,
                desc, params, FuncUtils.getIpAddr(request));
        operationLogService.add(o);
    }

    public  boolean hasRight(){
        HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
        String url = request.getRequestURI();
        HttpSession session = request.getSession();
        UsersEntity user= (UsersEntity) session.getAttribute(ConstantParm.SEESION_USER);
        List<String> pagePath = rolePageService.getUserRight(user.getRoleId());
        if(pagePath.contains(url)){
            return true;
        }else {
            return false;
        }
    }
}
