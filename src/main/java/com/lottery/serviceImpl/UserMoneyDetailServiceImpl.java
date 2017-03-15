package com.lottery.serviceImpl;

import com.lottery.condition.PageCondition;
import com.lottery.dao.UserMoneyDetailDao;
import com.lottery.pojo.UserMoneyDetailEntity;
import com.lottery.service.UserMoneyDetailService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: guoshubo
 * Date: 2017/3/14
 * Time: 13:36
 * Description：
 */
@Service
public class UserMoneyDetailServiceImpl implements UserMoneyDetailService {
    @Resource
    private UserMoneyDetailDao userMoneyDetailDao;
    @Override
    public List<UserMoneyDetailEntity> getByPage(PageCondition pageCondition) {
        return userMoneyDetailDao.getByPage(pageCondition);
    }

    @Override
    public boolean add(UserMoneyDetailEntity userMoneyDetail) {
        return userMoneyDetailDao.add(userMoneyDetail)>0;
    }

    @Override
    public boolean edit(UserMoneyDetailEntity userMoneyDetail) {
        return userMoneyDetailDao.edit(userMoneyDetail)>0;
    }

    @Override
    public boolean del(UserMoneyDetailEntity userMoneyDetail) {
        return userMoneyDetailDao.del(userMoneyDetail)>0;
    }

    @Override
    public int getTotal(PageCondition pageCondition) {
        return userMoneyDetailDao.getTotal(pageCondition);
    }
}
