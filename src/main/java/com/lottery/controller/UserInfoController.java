package com.lottery.controller;


import com.alibaba.fastjson.JSONObject;
import com.lottery.condition.PageCondition;
import com.lottery.pojo.UserInfoEntity;
import com.lottery.service.UserInfoService;
import com.lottery.utils.ConstantParm;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by IntelliJ IDEA.
 * User: guoshubo
 * Date: 2017/3/3
 * Time: 16:48
 * Description：
 */
@Controller
@RequestMapping("/")
public class UserInfoController extends BaseController {

    @Autowired
    private UserInfoService userInfoService;


    @RequestMapping(value="/userinfolist",method = RequestMethod.GET)
    public String userInfolist(ModelMap model){
       /* if(!hasRight()){
            return "403";
        }*/
        return "userinfo/userinfo";
    }


    @RequestMapping(value = "/userinfodata")
    @ResponseBody
    public Map list(PageCondition pageCondition){
        Map reslut = new HashMap();
        List<UserInfoEntity> listUserInfos =userInfoService.getUserInfoByPage(pageCondition);
        int recordTotal = userInfoService.getTotal(pageCondition);
        pageCondition.setRecordTotal(recordTotal);
        reslut.put("total", pageCondition.getTotal());
        reslut.put("rows", listUserInfos);
        return reslut;
    }

    @RequestMapping(value="/userinfoedit")
    @ResponseBody
    public String edit( UserInfoEntity usersEntity,String oper){

        boolean result= false;
        if(ConstantParm.OPER_ADD.equals(oper)){
            result=userInfoService.addUserInfo(usersEntity);
            System.out.println("用户添加");
        }else if(ConstantParm.OPER_EDIT.equals(oper)){
            result=userInfoService.updateUserInfo(usersEntity);
            System.out.println("用户修改");
        }else if(ConstantParm.OPER_DEL.equals(oper)){
            result=userInfoService.deleteUserInfo(usersEntity);
            System.out.println("用户删除");
        }else {
            result =true;
        }

        JSONObject res = new JSONObject();
        if(result){
            res.put("msg", "操作成功");
            res.put("successs", result);
            res.put("status", 200);

        }else {
            res.put("msg", "操作失败");
            res.put("successs", result);
            res.put("status", 500);
        }
        return res.toString();

    }



}
