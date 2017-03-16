package com.lottery.controller;

import com.lottery.condition.PageCondition;
import com.lottery.pojo.UserOrderDetailEntity;
import com.lottery.pojo.UserOrderEntity;
import com.lottery.service.UserOrderService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by IntelliJ IDEA.
 * User: guoshubo
 * Date: 2017/3/14
 * Time: 13:51
 * Description：
 */
@Controller
@RequestMapping("/")
public class UserOrderController {
    @Resource
    private UserOrderService userOrderService;

    @RequestMapping(value="/userorderlist",method = RequestMethod.GET)
    public String userorderlist(ModelMap model){
       /* if(!hasRight()){
            return "403";
        }*/
        return "userinfo/userOrder";
    }

    @RequestMapping(value = "/userorderdata")
    @ResponseBody
    public Map list(PageCondition pageCondition){
        Map reslut = new HashMap();
        List<UserOrderEntity> listUserOrder =userOrderService.getByPage(pageCondition);
        int recordTotal = userOrderService.getTotal(pageCondition);
        pageCondition.setRecordTotal(recordTotal);
        reslut.put("total", pageCondition.getTotal());
        reslut.put("rows", listUserOrder);
        return reslut;
    }

    @RequestMapping(value="/userorderdetial",method = RequestMethod.GET)
    public String userorderdetial(ModelMap model,Integer orderId){
        List<UserOrderDetailEntity> listuo = userOrderService.getUserOrderDetail(orderId);
        model.addAttribute("listUserOrderDetail",listuo);
        return "userinfo/userOrderDetail";
    }
}
