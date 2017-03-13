package com.lottery.serviceImpl;

import com.lottery.condition.PageCondition;
import com.lottery.dao.UserDao;
import com.lottery.pojo.UsersEntity;
import com.lottery.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by IntelliJ IDEA.
 * User: guoshubo
 * Date: 2017/3/3
 * Time: 16:52
 * Description：
 */
@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserDao userDao;

    @Override
    public UsersEntity getUser() {
        return null;
    }

    @Override
    public List<UsersEntity> getUserByPage(PageCondition pageCondition) {
        return userDao.getUserByPage(pageCondition);
    }

    @Override
    public boolean addUser(UsersEntity usersEntity) {
        return userDao.addUser(usersEntity)>0;
    }

    @Override
    public boolean updateUser(UsersEntity usersEntity) {
        return userDao.updateUser(usersEntity)>0;
    }

    @Override
    public boolean deleteUser(UsersEntity usersEntity) {
        return userDao.deleteUser(usersEntity)>0;
    }

    @Override
    public int getTotal(PageCondition pageCondition) {
        return userDao.getTotal(pageCondition);
    }

    @Override
    public UsersEntity getUserByNamepwd(String userName, String password) {
        Map<String,Object> map = new HashMap<String, Object>();
        map.put("loginName",userName);
        map.put("loginPwd",password);
        return  userDao.getUserByNamepwd(map);
    }
}
