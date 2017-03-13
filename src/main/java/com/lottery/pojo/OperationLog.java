package com.lottery.pojo;

import java.util.Date;

/**
 * Created by IntelliJ IDEA.
 * User: guoshubo
 * Date: 2017/2/23
 * Time: 14:31
 * Description：
 */
public class OperationLog {
    private int id;
    private int userId;

    private int operatorType;

    private Date operatorTime;

    private String descr;

    private String requestIp;

    private String params;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }


    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getOperatorType() {
        return operatorType;
    }

    public void setOperatorType(int operatorType) {
        this.operatorType = operatorType;
    }

    public Date getOperatorTime() {
        return operatorTime;
    }

    public void setOperatorTime(Date operatorTime) {
        this.operatorTime = operatorTime;
    }

    public String getDescr() {
        return descr;
    }

    public void setDescr(String descr) {
        this.descr = descr;
    }

    public String getRequestIp() {
        return requestIp;
    }

    public void setRequestIp(String requestIp) {
        this.requestIp = requestIp;
    }

    public String getParams() {
        return params;
    }

    public void setParams(String params) {
        this.params = params;
    }


    @Override
    public String toString() {
        return "OperationLog{" +
                "id=" + id +
                ", userId='" + userId + '\'' +
                ", operatorType='" + operatorType + '\'' +
                ", operatorTime=" + operatorTime +
                ", descr='" + descr + '\'' +
                ", requestIp='" + requestIp + '\'' +
                ", params='" + params + '\'' +
                '}';
    }
}