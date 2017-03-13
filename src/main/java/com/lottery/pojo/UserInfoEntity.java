package com.lottery.pojo;

import java.io.Serializable;

/**
 * Created by IntelliJ IDEA.
 * User: guoshubo
 * Date: 2017/3/3
 * Time: 16:53
 * Description： 用户
 */
public class UserInfoEntity implements Serializable{
    private static final long serialVersionUID = 5323147708393454789L;
    int userId;
    String mobilePhone;
    String nickName;
    String loginAccount;
    String loginPwd;
    String logoUrl;
    int curState;
    String updateTime;
    String createTime;

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getMobilePhone() {
        return mobilePhone;
    }

    public void setMobilePhone(String mobilePhone) {
        this.mobilePhone = mobilePhone;
    }

    public String getNickName() {
        return nickName;
    }

    public void setNickName(String nickName) {
        this.nickName = nickName;
    }

    public String getLoginAccount() {
        return loginAccount;
    }

    public void setLoginAccount(String loginAccount) {
        this.loginAccount = loginAccount;
    }

    public String getLoginPwd() {
        return loginPwd;
    }

    public void setLoginPwd(String loginPwd) {
        this.loginPwd = loginPwd;
    }

    public String getLogoUrl() {
        return logoUrl;
    }

    public void setLogoUrl(String logoUrl) {
        this.logoUrl = logoUrl;
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

    @Override
    public String toString() {
        return "UsersEntity{" +
                "userId=" + userId +
                ", mobilePhone='" + mobilePhone + '\'' +
                ", nickName='" + nickName + '\'' +
                ", loginAccount='" + loginAccount + '\'' +
                ", loginPwd='" + loginPwd + '\'' +
                ", logoUrl='" + logoUrl + '\'' +
                ", curState=" + curState +
                ", updateTime=" + updateTime +
                ", createTime=" + createTime +
                '}';
    }
}
