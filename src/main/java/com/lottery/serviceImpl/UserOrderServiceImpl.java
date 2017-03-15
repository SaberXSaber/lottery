package com.lottery.serviceImpl;

import com.lottery.condition.PageCondition;
import com.lottery.dao.UserOrderDao;
import com.lottery.pojo.UserOrderDetailEntity;
import com.lottery.pojo.UserOrderEntity;
import com.lottery.service.UserOrderService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: guoshubo
 * Date: 2017/3/14
 * Time: 13:47
 * Description：
 */
@Service
public class UserOrderServiceImpl implements UserOrderService {
    @Resource
    private UserOrderDao userOrderDao;

    @Override
    public List<UserOrderEntity> getByPage(PageCondition pageCondition) {
        return userOrderDao.getByPage(pageCondition);
    }

    @Override
    public boolean add(UserOrderEntity userOrder) {
        return userOrderDao.add(userOrder)>0;
    }

    @Override
    public boolean edit(UserOrderEntity userOrder) {
        return userOrderDao.edit(userOrder)>0;
    }

    @Override
    public boolean del(UserOrderEntity userOrder) {
        return userOrderDao.del(userOrder)>0;
    }

    @Override
    public int getTotal(PageCondition pageCondition) {
        return userOrderDao.getTotal(pageCondition);
    }

    @Override
    public List<UserOrderDetailEntity> getUserOrderDetail(Integer orderId) {
        return userOrderDao.getUserOrderDetail(orderId);
    }
}
