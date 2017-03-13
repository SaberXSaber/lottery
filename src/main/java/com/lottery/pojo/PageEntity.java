package com.lottery.pojo;

import java.io.Serializable;

/**
 * Created by IntelliJ IDEA.
 * User: guoshubo
 * Date: 2017/3/9
 * Time: 10:41
 * Description：
 */
public class PageEntity implements Serializable{
    private static final long serialVersionUID = -7423189464092372031L;
    private int pageId;
    private String pageName;
    private String pageGroupName;
    private String pagePath;
    private int curState;
    private String updateTime;
    private String createTime;

    public int getPageId() {
        return pageId;
    }

    public void setPageId(int pageId) {
        this.pageId = pageId;
    }

    public String getPageName() {
        return pageName;
    }

    public void setPageName(String pageName) {
        this.pageName = pageName;
    }

    public String getPageGroupName() {
        return pageGroupName;
    }

    public void setPageGroupName(String pageGroupName) {
        this.pageGroupName = pageGroupName;
    }

    public String getPagePath() {
        return pagePath;
    }

    public void setPagePath(String pagePath) {
        this.pagePath = pagePath;
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
        return "PageEntity{" +
                "pageId=" + pageId +
                ", pageName='" + pageName + '\'' +
                ", pageGroupName='" + pageGroupName + '\'' +
                ", pagePath='" + pagePath + '\'' +
                ", curState=" + curState +
                ", updateTime='" + updateTime + '\'' +
                ", createTime='" + createTime + '\'' +
                '}';
    }
}
