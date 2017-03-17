package com.lottery.service;

import com.lottery.condition.PageCondition;
import com.lottery.pojo.LotteryTypeEntity;
import com.lottery.pojo.NoticeListEntity;
import com.lottery.pojo.OrderDetailEntity;

import java.util.List;

/**
 * Created by Paul on 2017/3/15.
 */
public interface LotteryTypeService {
    List<LotteryTypeEntity> getListByPage(PageCondition pageCondition);
    List<NoticeListEntity> getNoticeListByPage(PageCondition pageCondition);
    int getTotal(PageCondition pageCondition);
    int getNoticeTotal(PageCondition pageCondition);

    List<OrderDetailEntity> getOrderDetailListByPage(PageCondition pageCondition);
    int getOrderDetailTotal(PageCondition pageCondition);
    int addLy(LotteryTypeEntity lotteryTypeEntity);
    int editLy(LotteryTypeEntity lotteryTypeEntity);
}
