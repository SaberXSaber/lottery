package com.lottery.pojo;

import java.util.Date;

/**
 * Created by Paul on 2017/3/15.
 */
public class LotteryTypeEntity {
    private Integer TypeId;
    private Integer SeqNum;
    private String TypeName;
    private String Tips;
    private Integer ParentId;
    private String ParentName;
    private String LogoUrl;
    private String Price;
    private Integer CurState;
    private Date UpdateTime;
    private Date CreateTime;

    @Override
    public String toString() {
        return "LotteryTypeEntity{" +
                "TypeId=" + TypeId +
                ", SeqNum=" + SeqNum +
                ", TypeName='" + TypeName + '\'' +
                ", Tips='" + Tips + '\'' +
                ", ParentId=" + ParentId +
                ", ParentName='" + ParentName + '\'' +
                ", LogoUrl='" + LogoUrl + '\'' +
                ", Price='" + Price + '\'' +
                ", CurState=" + CurState +
                ", UpdateTime=" + UpdateTime +
                ", CreateTime=" + CreateTime +
                '}';
    }

    public Integer getTypeId() {
        return TypeId;
    }

    public void setTypeId(Integer typeId) {
        TypeId = typeId;
    }

    public Integer getSeqNum() {
        return SeqNum;
    }

    public void setSeqNum(Integer seqNum) {
        SeqNum = seqNum;
    }

    public String getTypeName() {
        return TypeName;
    }

    public void setTypeName(String typeName) {
        TypeName = typeName;
    }

    public String getTips() {
        return Tips;
    }

    public void setTips(String tips) {
        Tips = tips;
    }

    public Integer getParentId() {
        return ParentId;
    }

    public void setParentId(Integer parentId) {
        ParentId = parentId;
    }

    public String getParentName() {
        return ParentName;
    }

    public void setParentName(String parentName) {
        ParentName = parentName;
    }

    public String getLogoUrl() {
        return LogoUrl;
    }

    public void setLogoUrl(String logoUrl) {
        LogoUrl = logoUrl;
    }

    public String getPrice() {
        return Price;
    }

    public void setPrice(String price) {
        Price = price;
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
}
