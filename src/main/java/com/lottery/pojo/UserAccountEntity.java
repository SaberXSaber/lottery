package com.lottery.pojo;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

/**
 * Created by IntelliJ IDEA.
 * User: guoshubo
 * Date: 2017/3/6
 * Time: 14:23
 * Description：用户账户
 */
public class UserAccountEntity implements Serializable {
    private static final long serialVersionUID = -5383469752009346799L;
    int userId;
    BigDecimal userBalance; //用户余额
    BigDecimal freezeMoney; //冻结金额
    String IDCardNum; //身份证号码
    String IDCardUrlP;//身份证正面
    String IDCardUrlN;//身份证反面
    int isRealNA;//是否实名认证
    int isBindBankCard;//是否绑定银行卡
    String payPwd;//支付密码	备用
    int curState;//当前状态	0，无效 1，有效
    Date updateTime;
    Date createTime;

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public BigDecimal getUserBalance() {
        return userBalance;
    }

    public void setUserBalance(BigDecimal userBalance) {
        this.userBalance = userBalance;
    }

    public BigDecimal getFreezeMoney() {
        return freezeMoney;
    }

    public void setFreezeMoney(BigDecimal freezeMoney) {
        this.freezeMoney = freezeMoney;
    }

    public String getIDCardNum() {
        return IDCardNum;
    }

    public void setIDCardNum(String IDCardNum) {
        this.IDCardNum = IDCardNum;
    }

    public String getIDCardUrlP() {
        return IDCardUrlP;
    }

    public void setIDCardUrlP(String IDCardUrlP) {
        this.IDCardUrlP = IDCardUrlP;
    }

    public String getIDCardUrlN() {
        return IDCardUrlN;
    }

    public void setIDCardUrlN(String IDCardUrlN) {
        this.IDCardUrlN = IDCardUrlN;
    }

    public int getIsRealNA() {
        return isRealNA;
    }

    public void setIsRealNA(int isRealNA) {
        this.isRealNA = isRealNA;
    }

    public int getIsBindBankCard() {
        return isBindBankCard;
    }

    public void setIsBindBankCard(int isBindBankCard) {
        this.isBindBankCard = isBindBankCard;
    }

    public String getPayPwd() {
        return payPwd;
    }

    public void setPayPwd(String payPwd) {
        this.payPwd = payPwd;
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
        return "UserAccountEntity{" +
                "userId=" + userId +
                ", userBalance=" + userBalance +
                ", freezeMoney=" + freezeMoney +
                ", IDCardNum='" + IDCardNum + '\'' +
                ", IDCardUrlP='" + IDCardUrlP + '\'' +
                ", IDCardUrlN='" + IDCardUrlN + '\'' +
                ", isRealNA=" + isRealNA +
                ", isBindBankCard=" + isBindBankCard +
                ", payPwd='" + payPwd + '\'' +
                ", curState=" + curState +
                ", updateTime=" + updateTime +
                ", createTime=" + createTime +
                '}';
    }
}
