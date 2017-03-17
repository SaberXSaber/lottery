package com.lottery.controller.system;

import com.alibaba.fastjson.JSONObject;
import com.lottery.condition.PageCondition;
import com.lottery.controller.BaseController;
import com.lottery.pojo.OperationLog;
import com.lottery.pojo.RoleEntity;
import com.lottery.service.RoleService;
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
 * Date: 2017/3/9
 * Time: 10:16
 * Description：
 */
@Controller
@RequestMapping("/")
public class RoleController extends BaseController {

    @Autowired
    private RoleService roleService;


    @RequestMapping(value="/rolelist",method = RequestMethod.GET)
    public String rolelist(ModelMap model){
        if(!hasRight()){
            return "403";
        }
        return "users/role";
    }


    @RequestMapping(value = "/roledata")
    @ResponseBody
    public Map list(PageCondition pageCondition){
        Map reslut = new HashMap();
        List<RoleEntity> listRoles =roleService.getRoleByPage(pageCondition);
        int recordTotal = roleService.getTotal(pageCondition);
        pageCondition.setRecordTotal(recordTotal);
        reslut.put("total", pageCondition.getTotal());
        reslut.put("rows", listRoles);
        return reslut;
    }

    @RequestMapping(value="/roleedit")
    @ResponseBody
    public String edit( RoleEntity roleEntity,String oper){
        boolean result= false;
        if(ConstantParm.OPER_ADD.equals(oper)){
            result=roleService.addRole(roleEntity);
        }else if(ConstantParm.OPER_EDIT.equals(oper)){
            result=roleService.updateRole(roleEntity);
        }else if(ConstantParm.OPER_DEL.equals(oper)){
            result=roleService.deleteRole(roleEntity);
        }else {
            result=true;
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

    @RequestMapping(value="/roles")
    @ResponseBody
    public List<RoleEntity> roleList(){
        List<RoleEntity> roleList=  roleService.roleList();
        return roleList;
    }
}
