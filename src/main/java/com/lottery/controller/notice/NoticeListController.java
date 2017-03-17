package com.lottery.controller.notice;

import com.lottery.condition.PageCondition;
import com.lottery.pojo.LotteryTypeEntity;
import com.lottery.pojo.NoticeListEntity;
import com.lottery.service.LotteryTypeService;
import com.lottery.utils.StringUtils;
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
 * Created by Paul on 2017/3/16.
 */
@Controller
@RequestMapping("/")
public class NoticeListController {
    @Autowired
    private LotteryTypeService lotteryTypeService;

    @RequestMapping(value="/nl",method = RequestMethod.GET)
    public String lotterylist(ModelMap model){
        return "lotterymain/noticelist";
    }


    @RequestMapping(value = "/nldata")
    @ResponseBody
    public Map nlData(PageCondition pageCondition){

        Map reslut = new HashMap();
        if(StringUtils.isEmpty(pageCondition.getSidx())){
            pageCondition.setSidx("ItemId");
            pageCondition.setSord("desc");
        }
        if(StringUtils.isEmpty(pageCondition.getSord())){
            pageCondition.setSord("desc");
        }
        List<NoticeListEntity> listLotteryType =lotteryTypeService.getNoticeListByPage(pageCondition);
        int recordTotal = lotteryTypeService.getNoticeTotal(pageCondition);
        pageCondition.setRecordTotal(recordTotal);
        reslut.put("total", pageCondition.getTotal());
        reslut.put("rows", listLotteryType);
        return reslut;
    }
}
