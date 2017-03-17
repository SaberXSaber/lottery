package com.lottery.pojo;

import com.alibaba.fastjson.annotation.JSONField;

import java.io.Serializable;

/**
 * Created by Paul on 2017/3/16.
 */
    @SuppressWarnings("serial")
    public class NoticeListEntity implements Serializable {
        @JSONField(name = "ItemId")
        public Integer ItemId;
        @JSONField(name = "TypeName")
        public String TypeName;
        @JSONField(name = "LogoUrl")
        public String LogoUrl;
        @JSONField(name = "LotterySeq")
        public String LotterySeq;
        @JSONField(name = "LotteryDate")
        public String LotteryDate;
        @JSONField(name = "LotteryString")
        public String LotteryString;

        public Integer getItemId() {
            return ItemId;
        }

        public void setItemId(Integer itemId) {
            ItemId = itemId;
        }

        public String getTypeName() {
            return TypeName;
        }

        public void setTypeName(String typeName) {
            TypeName = typeName;
        }

        public String getLogoUrl() {
            return LogoUrl;
        }

        public void setLogoUrl(String logoUrl) {
            LogoUrl = logoUrl;
        }

        public String getLotterySeq() {
            return LotterySeq;
        }

        public void setLotterySeq(String lotterySeq) {
            LotterySeq = lotterySeq;
        }

        public String getLotteryDate() {
            return LotteryDate;
        }

        public void setLotteryDate(String lotteryDate) {
            LotteryDate = lotteryDate;
        }

        public String getLotteryString() {
            return LotteryString;
        }

        public void setLotteryString(String lotteryString) {
            LotteryString = lotteryString;
        }
    }
