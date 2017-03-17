package com.lottery.controller;

import com.lottery.condition.PageCondition;
import com.lottery.pojo.DateReportEntity;
import com.lottery.service.DateReportService;
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
 * Date: 2017/3/16
 * Time: 10:23
 * Description：
 */
@Controller
@RequestMapping("/")
public class DateReportController {
    @Resource
    private DateReportService dateReportService;

    @RequestMapping(value="/datereportlist",method = RequestMethod.GET)
    public String datereportlist(ModelMap model){
        return "report/dateReport";
    }

    @RequestMapping(value = "/datereportdata")
    @ResponseBody
    public Map list(PageCondition pageCondition){
        Map reslut = new HashMap();
        List<DateReportEntity> listPages =dateReportService.getByPage(pageCondition);
        int recordTotal = dateReportService.getTotal(pageCondition);
        pageCondition.setRecordTotal(recordTotal);
        reslut.put("total", pageCondition.getTotal());
        reslut.put("rows", listPages);
        return reslut;
    }
}
