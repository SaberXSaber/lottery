package com.lottery.controller;


import com.alibaba.fastjson.JSONObject;
import com.lottery.condition.PageCondition;
import com.lottery.pojo.UsersEntity;
import com.lottery.service.RoleService;
import com.lottery.service.UserService;
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
public class UserController extends BaseController {

    @Autowired
    private UserService userService;


    @RequestMapping(value="/userlist",method = RequestMethod.GET)
    public String userlist(ModelMap model){
        if(!hasRight()){
            return "403";
        }
        return "users/user";
    }


    @RequestMapping(value = "/userdata")
    @ResponseBody
    public Map list(PageCondition pageCondition){
        Map reslut = new HashMap();
        List<UsersEntity> listUsers =userService.getUserByPage(pageCondition);
        int recordTotal = userService.getTotal(pageCondition);
        pageCondition.setRecordTotal(recordTotal);
        reslut.put("total", pageCondition.getTotal());
        reslut.put("rows", listUsers);
        return reslut;
    }

    @RequestMapping(value="/useredit")
    @ResponseBody
    public Map edit( UsersEntity usersEntity,String oper){

        boolean result= false;
        if(ConstantParm.OPER_ADD.equals(oper)){
            result=userService.addUser(usersEntity);
            System.out.println("用户添加");
        }else if(ConstantParm.OPER_EDIT.equals(oper)){
            result=userService.updateUser(usersEntity);
            System.out.println("用户修改");
        }else if(ConstantParm.OPER_DEL.equals(oper)){
            result=userService.deleteUser(usersEntity);
            System.out.println("用户删除");
        }else if(ConstantParm.OPER_ABLE.equals(oper)){
            result=userService.ableUser(usersEntity);
            System.out.println("启用禁用用户");
        } else {
            result =true;
        }

        Map<String,Object> res = new JSONObject();
        if(result){
            res.put("msg", "操作成功");
            res.put("successs", result);
            res.put("status", 200);

        }else {
            res.put("msg", "操作失败");
            res.put("successs", result);
            res.put("status", 500);
        }
        return res;

    }
}
