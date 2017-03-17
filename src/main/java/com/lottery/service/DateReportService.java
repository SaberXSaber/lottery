package com.lottery.service;

import com.lottery.condition.PageCondition;
import com.lottery.pojo.DateReportEntity;

import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: guoshubo
 * Date: 2017/3/16
 * Time: 10:29
 * Description：
 */
public interface DateReportService {
    List<DateReportEntity> getByPage(PageCondition pageCondition);
    int getTotal(PageCondition pageCondition);
}
