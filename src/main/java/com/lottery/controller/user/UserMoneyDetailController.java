package com.lottery.controller.user;

import com.lottery.condition.PageCondition;
import com.lottery.controller.BaseController;
import com.lottery.dao.UserMoneyDetailDao;
import com.lottery.pojo.UserMoneyDetailEntity;
import com.lottery.service.UserMoneyDetailService;
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
 * Time: 13:33
 * Description：
 */
@Controller
@RequestMapping("/")
public class UserMoneyDetailController extends BaseController {
    @Resource
    private UserMoneyDetailService userMoneyDetailService;

    @RequestMapping(value="/usermoneydetaillist",method = RequestMethod.GET)
    public String userlist(ModelMap model){
      /*  if(!hasRight()){
            return "403";
        }*/
        return "userinfo/userMoneyDetail";
    }


    @RequestMapping(value = "/usermoneydetaildata")
    @ResponseBody
    public Map list(PageCondition pageCondition){
        Map reslut = new HashMap();
        List<UserMoneyDetailEntity> listUserM =userMoneyDetailService.getByPage(pageCondition);
        int recordTotal = userMoneyDetailService.getTotal(pageCondition);
        pageCondition.setRecordTotal(recordTotal);
        reslut.put("total", pageCondition.getTotal());
        reslut.put("rows", listUserM);
        return reslut;
    }

}
