package com.lottery.pojo;

import java.io.Serializable;

/**
 * Created by IntelliJ IDEA.
 * User: guoshubo
 * Date: 2017/3/9
 * Time: 10:06
 * Description：角色
 */
public class RoleEntity implements Serializable{
    private static final long serialVersionUID = 6368673113269340578L;
    private int roleId;
    private String roleName;
    private int curState;
    private String updateTime;
    private String createTime;
    private String curStateString;

    public int getRoleId() {
        return roleId;
    }

    public void setRoleId(int roleId) {
        this.roleId = roleId;
    }

    public String getRoleName() {
        return roleName;
    }

    public void setRoleName(String roleName) {
        this.roleName = roleName;
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

    public String getCurStateString() {
        if(this.getCurState()==1){
            return "启用";
        }else {
            return "禁用";
        }
    }

    public void setCurStateString(String curStateString) {
        this.curStateString = curStateString;
    }

    @Override
    public String toString() {
        return "RoleEntity{" +
                "roleId=" + roleId +
                ", roleName='" + roleName + '\'' +
                ", curState=" + curState +
                ", updateTime='" + updateTime + '\'' +
                ", createTime='" + createTime + '\'' +
                '}';
    }
}
