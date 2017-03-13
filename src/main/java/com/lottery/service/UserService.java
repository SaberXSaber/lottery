package com.lottery.service;

import com.lottery.condition.PageCondition;
import com.lottery.pojo.UsersEntity;

import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: guoshubo
 * Date: 2017/3/3
 * Time: 16:51
 * Description：
 */
public interface UserService {
    UsersEntity getUser();
    List<UsersEntity> getUserByPage(PageCondition pageCondition);
    boolean addUser(UsersEntity usersEntity);
    boolean updateUser(UsersEntity usersEntity);
    boolean deleteUser(UsersEntity usersEntity);
    int getTotal(PageCondition pageCondition);

    UsersEntity getUserByNamepwd(String userName,String password);

}
