package com.lottery.pojo;

/**
 * Created by IntelliJ IDEA.
 * User: guoshubo
 * Date: 2017/3/16
 * Time: 15:36
 * Description：
 */
public class DateReportEntity {
    private String createTime;
    private long regUserCount;
    private long betUserCount;
    private long betOrderCount;
    private long unbetUserCount;
    private long unbetOrderCount;

    public String getCreateTime() {
        return createTime;
    }

    public void setCreateTime(String createTime) {
        this.createTime = createTime;
    }

    public long getRegUserCount() {
        return regUserCount;
    }

    public void setRegUserCount(long regUserCount) {
        this.regUserCount = regUserCount;
    }

    public long getBetUserCount() {
        return betUserCount;
    }

    public void setBetUserCount(long betUserCount) {
        this.betUserCount = betUserCount;
    }

    public long getBetOrderCount() {
        return betOrderCount;
    }

    public void setBetOrderCount(long betOrderCount) {
        this.betOrderCount = betOrderCount;
    }

    public long getUnbetUserCount() {
        return unbetUserCount;
    }

    public void setUnbetUserCount(long unbetUserCount) {
        this.unbetUserCount = unbetUserCount;
    }

    public long getUnbetOrderCount() {
        return unbetOrderCount;
    }

    public void setUnbetOrderCount(long unbetOrderCount) {
        this.unbetOrderCount = unbetOrderCount;
    }
}
