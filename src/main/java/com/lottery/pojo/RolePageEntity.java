package com.lottery.pojo;

import java.io.Serializable;

/**
 * Created by IntelliJ IDEA.
 * User: guoshubo
 * Date: 2017/3/9
 * Time: 14:08
 * Description：
 */
public class RolePageEntity implements Serializable{
    private static final long serialVersionUID = -7843734850445326168L;
    private int id;
    private int roleId;
    private int pageId;
    private String roleName;
    private String PageName;
    private int curState;
    private String updateTime;
    private String createTime;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getRoleId() {
        return roleId;
    }

    public void setRoleId(int roleId) {
        this.roleId = roleId;
    }

    public int getPageId() {
        return pageId;
    }

    public void setPageId(int pageId) {
        this.pageId = pageId;
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

    public String getRoleName() {
        return roleName;
    }

    public void setRoleName(String roleName) {
        this.roleName = roleName;
    }

    public String getPageName() {
        return PageName;
    }

    public void setPageName(String pageName) {
        PageName = pageName;
    }

    @Override
    public String toString() {
        return "RolePageEntity{" +
                "id=" + id +
                ", roleId=" + roleId +
                ", pageId=" + pageId +
                ", roleName='" + roleName + '\'' +
                ", PageName='" + PageName + '\'' +
                ", curState=" + curState +
                ", updateTime='" + updateTime + '\'' +
                ", createTime='" + createTime + '\'' +
                '}';
    }


}
