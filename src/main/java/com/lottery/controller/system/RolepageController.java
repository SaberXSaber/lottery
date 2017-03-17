package com.lottery.controller.system;

import com.alibaba.fastjson.JSONObject;
import com.lottery.condition.PageCondition;
import com.lottery.controller.BaseController;
import com.lottery.pojo.RolePageEntity;
import com.lottery.service.PageService;
import com.lottery.service.RolePageService;
import com.lottery.service.RoleService;
import com.lottery.utils.ConstantParm;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by IntelliJ IDEA.
 * User: guoshubo
 * Date: 2017/3/9
 * Time: 14:23
 * Description：
 */
@Controller
@RequestMapping("/")
public class RolepageController extends BaseController {
    @Autowired
    private RolePageService rolePageService;
    @Autowired
    private PageService pageService;
    @Autowired
    private RoleService roleService;


    @RequestMapping(value="/rolePagelist",method = RequestMethod.GET)
    public String rolePagelist(ModelMap model){
        if(!hasRight()){
            return "403";
        }
        model.addAttribute("pageLists",  pageService.pageList());
        model.addAttribute("roleLists",  roleService.roleList());
        return "users/rolepage";
    }


    @RequestMapping(value = "/rolePagedata")
    @ResponseBody
    public Map list(PageCondition pageCondition){
        Map reslut = new HashMap();
        List<RolePageEntity> listPageRoles =rolePageService.getByPage(pageCondition);
        int recordTotal = rolePageService.getTotal(pageCondition);
        pageCondition.setRecordTotal(recordTotal);
        reslut.put("total", pageCondition.getTotal());
        reslut.put("rows", listPageRoles);
        return reslut;
    }

    @RequestMapping(value="/rolePageedit")
    @ResponseBody
    public String edit(RolePageEntity rolePageEntity,String oper){
        boolean result= false;
       /* RolePageEntity rolePageEntity = new RolePageEntity();
        rolePageEntity.setRoleId(roleId);
        rolePageEntity.setPageId(pageId);*/
        if(ConstantParm.OPER_ADD.equals(oper)){
            result=rolePageService.add(rolePageEntity);
        }else if(ConstantParm.OPER_EDIT.equals(oper)){
            result=rolePageService.edit(rolePageEntity);
        }else if(ConstantParm.OPER_DEL.equals(oper)){
            result=rolePageService.del(rolePageEntity);
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

    @RequestMapping(value = "/addbatchright")
    @ResponseBody
    public String addbatchright(String roleId, String pages){
        String[] pageArray= pages.split(",");
        List<RolePageEntity> list = new ArrayList();
        for(String s : pageArray){
            RolePageEntity rp = new RolePageEntity();
            rp.setRoleId(Integer.valueOf(roleId));
            rp.setPageId(Integer.valueOf(s));
            list.add(rp);
        }
        boolean result = rolePageService.addbatchRolePage(list);
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
