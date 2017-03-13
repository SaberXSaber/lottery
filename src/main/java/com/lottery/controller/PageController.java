package com.lottery.controller;

import com.alibaba.fastjson.JSONObject;
import com.lottery.condition.PageCondition;
import com.lottery.pojo.PageEntity;
import com.lottery.service.PageService;
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
public class PageController extends BaseController{

    @Autowired
    private PageService pageService;


    @RequestMapping(value="/pagelist",method = RequestMethod.GET)
    public String pagelist(ModelMap model){
        if(!hasRight()){
            return "403";
        }
        return "users/page";
    }


    @RequestMapping(value = "/pagedata")
    @ResponseBody
    public Map list(PageCondition pageCondition){
        Map reslut = new HashMap();
        List<PageEntity> listPages =pageService.getPageByPage(pageCondition);
        int recordTotal = pageService.getTotal(pageCondition);
        pageCondition.setRecordTotal(recordTotal);
        reslut.put("total", pageCondition.getTotal());
        reslut.put("rows", listPages);
        return reslut;
    }

    @RequestMapping(value="/pageedit")
    @ResponseBody
    public String edit( PageEntity pageEntity,String oper){
        boolean result= false;
        if(ConstantParm.OPER_ADD.equals(oper)){
            result=pageService.addPage(pageEntity);
        }else if(ConstantParm.OPER_EDIT.equals(oper)){
            result=pageService.updatePage(pageEntity);
        }else if(ConstantParm.OPER_DEL.equals(oper)){
            result=pageService.deletePage(pageEntity);
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

    @RequestMapping(value="/pages")
    @ResponseBody
    public List<PageEntity> roleList(){
        List<PageEntity> pageList=  pageService.pageList();
        return pageList;
    }
}
