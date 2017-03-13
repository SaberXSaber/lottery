package com.lottery.dao;

import com.lottery.condition.PageCondition;
import com.lottery.pojo.UserInfoEntity;
import com.lottery.pojo.UsersEntity;

import java.util.List;
import java.util.Map;

/**
 * Created by IntelliJ IDEA.
 * User: guoshubo
 * Date: 2017/3/3
 * Time: 16:52
 * Description：
 */
public interface UserInfoDao {
    UserInfoEntity getUserInfo();
    List<UserInfoEntity> getUserInfoByPage(PageCondition pageCondition);
    int addUserInfo(UserInfoEntity userInfosEntity);
    int updateUserInfo(UserInfoEntity userInfosEntity);
    int deleteUserInfo(UserInfoEntity userInfosEntity);

    int getTotal(PageCondition pageCondition);

    UsersEntity getUserByNamepwd(Map<String, Object> map);
}
