package com.lottery.service;

import com.lottery.condition.PageCondition;
import com.lottery.pojo.UserMoneyDetailEntity;

import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: guoshubo
 * Date: 2017/3/14
 * Time: 13:35
 * Description：
 */
public interface UserMoneyDetailService {
    List<UserMoneyDetailEntity> getByPage(PageCondition pageCondition);
    boolean add(UserMoneyDetailEntity userMoneyDetail);
    boolean edit(UserMoneyDetailEntity userMoneyDetail);
    boolean del(UserMoneyDetailEntity userMoneyDetail);
    int getTotal(PageCondition pageCondition);
}
