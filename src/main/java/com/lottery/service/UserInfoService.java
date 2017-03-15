package com.lottery.service;

import com.lottery.condition.PageCondition;
import com.lottery.pojo.UserInfoEntity;

import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: guoshubo
 * Date: 2017/3/3
 * Time: 16:51
 * Description：
 */
public interface UserInfoService {
    UserInfoEntity getUserInfo();
    List<UserInfoEntity> getUserInfoByPage(PageCondition pageCondition);
    boolean addUserInfo(UserInfoEntity userInfoEntity);
    boolean updateUserInfo(UserInfoEntity userInfoEntity);
    boolean deleteUserInfo(UserInfoEntity userInfoEntity);
    int getTotal(PageCondition pageCondition);

}
