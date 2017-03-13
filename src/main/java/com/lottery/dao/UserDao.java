package com.lottery.dao;

import com.lottery.condition.PageCondition;
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
public interface UserDao {
    UsersEntity getUser();
    List<UsersEntity> getUserByPage(PageCondition pageCondition);
    int addUser(UsersEntity usersEntity);
    int updateUser(UsersEntity usersEntity);
    int deleteUser(UsersEntity usersEntity);

    int getTotal(PageCondition pageCondition);

    UsersEntity getUserByNamepwd(Map<String,Object> map);
}
