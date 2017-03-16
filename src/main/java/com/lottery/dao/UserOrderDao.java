package com.lottery.dao;

import com.lottery.condition.PageCondition;
import com.lottery.pojo.UserOrderDetailEntity;
import com.lottery.pojo.UserOrderEntity;

import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: guoshubo
 * Date: 2017/3/14
 * Time: 13:46
 * Description：
 */
public interface UserOrderDao {
    List<UserOrderEntity> getByPage(PageCondition pageCondition);
    int add(UserOrderEntity userOrder);
    int edit(UserOrderEntity userOrder);
    int del(UserOrderEntity userOrder);
    int getTotal(PageCondition pageCondition);

    List<UserOrderDetailEntity> getUserOrderDetail(Integer orderId);
}
