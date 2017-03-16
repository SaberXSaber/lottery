package com.lottery.serviceImpl;

import com.lottery.condition.PageCondition;
import com.lottery.dao.LotteryTypeDao;
import com.lottery.dao.UserDao;
import com.lottery.pojo.LotteryTypeEntity;
import com.lottery.service.LotteryTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Paul on 2017/3/15.
 */
@Service
public class LotteryTypeImpl implements LotteryTypeService {

    @Autowired
    private LotteryTypeDao lotteryTypeDao;


    @Override
    public List<LotteryTypeEntity> getListByPage(PageCondition pageCondition) {
        return lotteryTypeDao.getListByPage(pageCondition);
    }

    @Override
    public int getTotal(PageCondition pageCondition) {
        return lotteryTypeDao.getTotal(pageCondition);
    }

    @Override
    public int addLy(LotteryTypeEntity lotteryTypeEntity) {
        return  lotteryTypeDao.addLy(lotteryTypeEntity);
    }
}
