package com.lottery.pojo;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

/**
 * Created by IntelliJ IDEA.
 * User: guoshubo
 * Date: 2017/3/6
 * Time: 14:30
 * Description：用户收支明细表
 */
public class UserMoneyDetailEntity implements Serializable{

    private static final long serialVersionUID = 4020688149247445340L;
    int detailId;
    Date currentdate;
    int userId;
    int        typeId;//1，收入 2，支出
    int typeDetailId;//充值，提现，冻结，中奖，
    BigDecimal money;// 收入为正，支出为负
    String remark; //备注信息
    int curState;//当前状态	0，无效 1，有效
    Date updateTime;
    Date createTime;

    public int getDetailId() {
        return detailId;
    }

    public void setDetailId(int detailId) {
        this.detailId = detailId;
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

    public int getTypeId() {
        return typeId;
    }

    public void setTypeId(int typeId) {
        this.typeId = typeId;
    }

    public int getTypeDetailId() {
        return typeDetailId;
    }

    public void setTypeDetailId(int typeDetailId) {
        this.typeDetailId = typeDetailId;
    }

    public BigDecimal getMoney() {
        return money;
    }

    public void setMoney(BigDecimal money) {
        this.money = money;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
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
        return "UserMoneyDetailEntity{" +
                "detailId=" + detailId +
                ", currentdate=" + currentdate +
                ", userId=" + userId +
                ", typeId=" + typeId +
                ", typeDetailId=" + typeDetailId +
                ", money=" + money +
                ", remark='" + remark + '\'' +
                ", curState=" + curState +
                ", updateTime=" + updateTime +
                ", createTime=" + createTime +
                '}';
    }
}
