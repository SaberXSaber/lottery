package com.lottery.pojo;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

/**
 * Created by IntelliJ IDEA.
 * User: guoshubo
 * Date: 2017/3/6
 * Time: 14:37
 * Description：用户订单详情表
 */
public class UserOrderDetailEntity implements Serializable{

    private static final long serialVersionUID = 248816755232657484L;
    int orderDetailId;
    Date currentdate;//
    int  userId;
    int orderId;
    int  lotteryTypeId;//订单金额
    int detailType;//选择类型 1，人工  2，机选
    String lotteryDateNum; //彩票期号
    String lotteryString; //投注号码
    BigDecimal costMoney; //花费
    int orderDetailState;//彩票状态 0,未付款，1,待开奖，2,已中奖，3,未中奖
    int orderState;//订单状态	1，待付款 2，已付款 3,已取消
    int curState;//当前状态	0，无效 1，有效
    Date updateTime;
    Date createTime;

    public int getOrderDetailId() {
        return orderDetailId;
    }

    public void setOrderDetailId(int orderDetailId) {
        this.orderDetailId = orderDetailId;
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

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public int getLotteryTypeId() {
        return lotteryTypeId;
    }

    public void setLotteryTypeId(int lotteryTypeId) {
        this.lotteryTypeId = lotteryTypeId;
    }

    public int getDetailType() {
        return detailType;
    }

    public void setDetailType(int detailType) {
        this.detailType = detailType;
    }

    public String getLotteryDateNum() {
        return lotteryDateNum;
    }

    public void setLotteryDateNum(String lotteryDateNum) {
        this.lotteryDateNum = lotteryDateNum;
    }

    public String getLotteryString() {
        return lotteryString;
    }

    public void setLotteryString(String lotteryString) {
        this.lotteryString = lotteryString;
    }

    public BigDecimal getCostMoney() {
        return costMoney;
    }

    public void setCostMoney(BigDecimal costMoney) {
        this.costMoney = costMoney;
    }

    public int getOrderDetailState() {
        return orderDetailState;
    }

    public void setOrderDetailState(int orderDetailState) {
        this.orderDetailState = orderDetailState;
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
        return "UserOrderDetailEntity{" +
                "orderDetailId=" + orderDetailId +
                ", currentdate=" + currentdate +
                ", userId=" + userId +
                ", orderId=" + orderId +
                ", lotteryTypeId=" + lotteryTypeId +
                ", detailType=" + detailType +
                ", lotteryDateNum='" + lotteryDateNum + '\'' +
                ", lotteryString='" + lotteryString + '\'' +
                ", costMoney=" + costMoney +
                ", orderDetailState=" + orderDetailState +
                ", orderState=" + orderState +
                ", curState=" + curState +
                ", updateTime=" + updateTime +
                ", createTime=" + createTime +
                '}';
    }
}
