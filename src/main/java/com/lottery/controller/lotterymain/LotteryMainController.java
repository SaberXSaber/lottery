package com.lottery.controller.lotterymain;



import com.alibaba.fastjson.JSONObject;
import com.lottery.condition.PageCondition;
import com.lottery.pojo.LotteryTypeEntity;
import com.lottery.pojo.UsersEntity;
import com.lottery.service.LotteryTypeService;
import com.lottery.service.RoleService;
import com.lottery.service.UserService;
import com.lottery.utils.ConstantParm;
import com.lottery.utils.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


/**
 * Created by Paul on 2017/3/15.
 */
@Controller
@RequestMapping("/")
public class LotteryMainController {
    @Autowired
    private LotteryTypeService lotteryTypeService;

    @RequestMapping(value="/ly",method = RequestMethod.GET)
    public String lotterylist(ModelMap model){
        return "lotterymain/lotterymain";
    }

    @RequestMapping(value = "/lytdata")
    @ResponseBody
    public Map lytData(PageCondition pageCondition){

        Map reslut = new HashMap();
        if(StringUtils.isEmpty(pageCondition.getSidx())){
            pageCondition.setSidx("SeqNum");
            pageCondition.setSord("desc");
        }
        if(StringUtils.isEmpty(pageCondition.getSord())){
            pageCondition.setSord("desc");
        }
        List<LotteryTypeEntity> listLotteryType =lotteryTypeService.getListByPage(pageCondition);
        int recordTotal = lotteryTypeService.getTotal(pageCondition);
        pageCondition.setRecordTotal(recordTotal);
        reslut.put("total", pageCondition.getTotal());
        reslut.put("rows", listLotteryType);
        return reslut;
    }


    @RequestMapping(value="/lyedit")
    @ResponseBody
    public String lyEdit( LotteryTypeEntity lotteryTypeEntity,String oper){

        boolean result= false;
        if(lotteryTypeEntity.getParentName().equals("高频彩种")){
            lotteryTypeEntity.setParentId(3);
        }
        if(lotteryTypeEntity.getParentName().equals("体育彩票")){
            lotteryTypeEntity.setParentId(2);
        }
        if(lotteryTypeEntity.getParentName().equals("福利彩票")){
            lotteryTypeEntity.setParentId(1);
        }
        if(ConstantParm.OPER_ADD.equals(oper)){
           result=lotteryTypeService.addLy(lotteryTypeEntity)>0;
        }else if(ConstantParm.OPER_EDIT.equals(oper)){
            result=lotteryTypeService.editLy(lotteryTypeEntity)>0;
        }else if(ConstantParm.OPER_DEL.equals(oper)){
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
