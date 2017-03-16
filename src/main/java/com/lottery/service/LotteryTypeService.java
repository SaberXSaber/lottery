package com.lottery.service;

import com.lottery.condition.PageCondition;
import com.lottery.pojo.LotteryTypeEntity;

import java.util.List;

/**
 * Created by Paul on 2017/3/15.
 */
public interface LotteryTypeService {
    List<LotteryTypeEntity> getListByPage(PageCondition pageCondition);
    int getTotal(PageCondition pageCondition);
    int addLy(LotteryTypeEntity lotteryTypeEntity);
}
