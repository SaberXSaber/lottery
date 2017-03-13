package com.lottery.pojo;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

/**
 * Created by IntelliJ IDEA.
 * User: guoshubo
 * Date: 2017/3/6
 * Time: 14:34
 * Description：用户订单表
 */
public class UserOrderEntity implements Serializable{
    private static final long serialVersionUID = -5755369553039044225L;
    int orderId;
    Date currentdate;//
    int  userId;
    int orderType;//订单类型 1，普通订单 2，组合彩
    BigDecimal orderMoney; //订单金额
    String beginLotteryDateNum; //开始期号

    int doubleNum;//加倍
    int moreNum;//追加期数
    int tatalNum;//注数
    int orderState;//订单状态	1，待付款 2，已付款 3,已取消
    int curState;//当前状态	0，无效 1，有效
    Date updateTime;
    Date createTime;

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public Date getCurrentdate() {
        return currentdate;
    }

    public void setCurrentdate(Date currentdate) {
        this.currentdate = currentdate;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getOrderType() {
        return orderType;
    }

    public void setOrderType(int orderType) {
        this.orderType = orderType;
    }

    public BigDecimal getOrderMoney() {
        return orderMoney;
    }

    public void setOrderMoney(BigDecimal orderMoney) {
        this.orderMoney = orderMoney;
    }

    public String getBeginLotteryDateNum() {
        return beginLotteryDateNum;
    }

    public void setBeginLotteryDateNum(String beginLotteryDateNum) {
        this.beginLotteryDateNum = beginLotteryDateNum;
    }

    public int getDoubleNum() {
        return doubleNum;
    }

    public void setDoubleNum(int doubleNum) {
        this.doubleNum = doubleNum;
    }

    public int getMoreNum() {
        return moreNum;
    }

    public void setMoreNum(int moreNum) {
        this.moreNum = moreNum;
    }

    public int getTatalNum() {
        return tatalNum;
    }

    public void setTatalNum(int tatalNum) {
        this.tatalNum = tatalNum;
    }

    public int getOrderState() {
        return orderState;
    }

    public void setOrderState(int orderState) {
        this.orderState = orderState;
    }

    public int getCurState() {
        return curState;
    }

    public void setCurState(int curState) {
        this.curState = curState;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    @Override
    public String toString() {
        return "UserOrderEntity{" +
                "orderId=" + orderId +
                ", currentdate=" + currentdate +
                ", userId=" + userId +
                ", orderType=" + orderType +
                ", orderMoney=" + orderMoney +
                ", beginLotteryDateNum='" + beginLotteryDateNum + '\'' +
                ", doubleNum=" + doubleNum +
                ", moreNum=" + moreNum +
                ", tatalNum=" + tatalNum +
                ", orderState=" + orderState +
                ", curState=" + curState +
                ", updateTime=" + updateTime +
                ", createTime=" + createTime +
                '}';
    }
}
