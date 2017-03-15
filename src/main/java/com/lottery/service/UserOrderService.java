package com.lottery.service;

import com.lottery.condition.PageCondition;
import com.lottery.pojo.UserOrderDetailEntity;
import com.lottery.pojo.UserOrderEntity;

import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: guoshubo
 * Date: 2017/3/14
 * Time: 13:47
 * Description：
 */
public interface UserOrderService {
    List<UserOrderEntity> getByPage(PageCondition pageCondition);
    boolean add(UserOrderEntity userOrder);
    boolean edit(UserOrderEntity userOrder);
    boolean del(UserOrderEntity userOrder);
    int getTotal(PageCondition pageCondition);

    List<UserOrderDetailEntity> getUserOrderDetail(Integer orderId);
}
