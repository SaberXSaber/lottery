package com.lottery.dao;

import com.lottery.condition.PageCondition;
import com.lottery.pojo.LotteryTypeEntity;
import com.lottery.pojo.UsersEntity;

import java.util.List;

/**
 * Created by Paul on 2017/3/15.
 */
public interface LotteryTypeDao {
    List<LotteryTypeEntity> getListByPage(PageCondition pageCondition);
    int getTotal(PageCondition pageCondition);
    int addLy(LotteryTypeEntity lotteryTypeEntity);
}
