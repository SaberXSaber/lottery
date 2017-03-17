package com.lottery.pojo;

import java.util.Date;

/**
 * Created by Paul on 2017/3/16.
 */
public class OrderDetailEntity {
    private Integer OrderDetailId;
    private String Currentdate;
    private Integer OrderId;
    private Integer CartId;
    private Integer UserId;
    private Integer LotteryTypeId;
    private Integer DetailType;
    private String LotteryDateNum;
    private String LotteryString;
    private Double CostMoney;
    private Integer OrderDetailState;
    private Integer LotteryLevel;
    private Integer CurState;
    private Date UpdateTime;
    private Date CreateTime;
    private Double OrderMoney;
    private Integer DoubleNum;
    private Integer OrderType;
    private Integer MoreNum;
    private Integer TatalNum;

    public Integer getOrderDetailId() {
        return OrderDetailId;
    }

    public void setOrderDetailId(Integer orderDetailId) {
        OrderDetailId = orderDetailId;
    }

    public String getCurrentdate() {
        return Currentdate;
    }

    public void setCurrentdate(String currentdate) {
        Currentdate = currentdate;
    }

    public Integer getOrderId() {
        return OrderId;
    }

    public void setOrderId(Integer orderId) {
        OrderId = orderId;
    }

    public Integer getCartId() {
        return CartId;
    }

    public void setCartId(Integer cartId) {
        CartId = cartId;
    }

    public Integer getUserId() {
        return UserId;
    }

    public void setUserId(Integer userId) {
        UserId = userId;
    }

    public Integer getLotteryTypeId() {
        return LotteryTypeId;
    }

    public void setLotteryTypeId(Integer lotteryTypeId) {
        LotteryTypeId = lotteryTypeId;
    }

    public Integer getDetailType() {
        return DetailType;
    }

    public void setDetailType(Integer detailType) {
        DetailType = detailType;
    }

    public String getLotteryDateNum() {
        return LotteryDateNum;
    }

    public void setLotteryDateNum(String lotteryDateNum) {
        LotteryDateNum = lotteryDateNum;
    }

    public String getLotteryString() {
        return LotteryString;
    }

    public void setLotteryString(String lotteryString) {
        LotteryString = lotteryString;
    }

    public Double getCostMoney() {
        return CostMoney;
    }

    public void setCostMoney(Double costMoney) {
        CostMoney = costMoney;
    }

    public Integer getOrderDetailState() {
        return OrderDetailState;
    }

    public void setOrderDetailState(Integer orderDetailState) {
        OrderDetailState = orderDetailState;
    }

    public Integer getLotteryLevel() {
        return LotteryLevel;
    }

    public void setLotteryLevel(Integer lotteryLevel) {
        LotteryLevel = lotteryLevel;
    }

    public Integer getCurState() {
        return CurState;
    }

    public void setCurState(Integer curState) {
        CurState = curState;
    }

    public Date getUpdateTime() {
        return UpdateTime;
    }

    public void setUpdateTime(Date updateTime) {
        UpdateTime = updateTime;
    }

    public Date getCreateTime() {
        return CreateTime;
    }

    public void setCreateTime(Date createTime) {
        CreateTime = createTime;
    }

    public Double getOrderMoney() {
        return OrderMoney;
    }

    public void setOrderMoney(Double orderMoney) {
        OrderMoney = orderMoney;
    }

    public Integer getDoubleNum() {
        return DoubleNum;
    }

    public void setDoubleNum(Integer doubleNum) {
        DoubleNum = doubleNum;
    }

    public Integer getOrderType() {
        return OrderType;
    }

    public void setOrderType(Integer orderType) {
        OrderType = orderType;
    }

    public Integer getMoreNum() {
        return MoreNum;
    }

    public void setMoreNum(Integer moreNum) {
        MoreNum = moreNum;
    }

    public Integer getTatalNum() {
        return TatalNum;
    }

    public void setTatalNum(Integer tatalNum) {
        TatalNum = tatalNum;
    }

    public Integer getOrderState() {
        return OrderState;
    }

    public void setOrderState(Integer orderState) {
        OrderState = orderState;
    }

    private Integer OrderState;
}
