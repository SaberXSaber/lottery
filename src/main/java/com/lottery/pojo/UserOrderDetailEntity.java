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
    private int orderDetailId;
    private String currentdate;//
    private int  userId;
    private int orderId;
    private int  lotteryTypeId;
    private int detailType;//选择类型 1，人工  2，机选
    private String lotteryDateNum; //彩票期号
    private String lotteryString; //投注号码
    private BigDecimal costMoney; //花费
    private int orderDetailState;//彩票状态 0,未付款，1,待开奖，2,已中奖，3,未中奖
    private int orderState;//订单状态	1，待付款 2，已付款 3,已取消
    private int curState;//当前状态	0，无效 1，有效
    private String updateTime;
    private String createTime;
    String lotteryTypeName;

    public int getOrderDetailId() {
        return orderDetailId;
    }

    public void setOrderDetailId(int orderDetailId) {
        this.orderDetailId = orderDetailId;
    }

    public String getCurrentdate() {
        return currentdate;
    }

    public void setCurrentdate(String currentdate) {
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

    public String getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(String updateTime) {
        this.updateTime = updateTime;
    }

    public String getCreateTime() {
        return createTime;
    }

    public void setCreateTime(String createTime) {
        this.createTime = createTime;
    }

    public String getLotteryTypeName() {
        return lotteryTypeName;
    }

    public void setLotteryTypeName(String lotteryTypeName) {
        this.lotteryTypeName = lotteryTypeName;
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
