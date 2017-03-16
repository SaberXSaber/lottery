package com.lottery.dao;

import com.lottery.condition.PageCondition;
import com.lottery.pojo.UserMoneyDetailEntity;

import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: guoshubo
 * Date: 2017/3/14
 * Time: 13:34
 * Description：
 */
public interface UserMoneyDetailDao {
    List<UserMoneyDetailEntity> getByPage(PageCondition pageCondition);
    int add(UserMoneyDetailEntity userMoneyDetail);
    int edit(UserMoneyDetailEntity userMoneyDetail);
    int del(UserMoneyDetailEntity userMoneyDetail);
    int getTotal(PageCondition pageCondition);
}
