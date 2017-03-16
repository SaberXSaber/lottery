package com.lottery.serviceImpl;

import com.lottery.condition.PageCondition;
import com.lottery.dao.UserInfoDao;
import com.lottery.pojo.UserInfoEntity;
import com.lottery.service.UserInfoService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: guoshubo
 * Date: 2017/3/14
 * Time: 9:46
 * Description：
 */
@Service
public class UserInfoServiceImpl implements UserInfoService {

    @Resource
    private UserInfoDao userInfoDao;

    @Override
    public UserInfoEntity getUserInfo() {
        return null;
    }

    @Override
    public List<UserInfoEntity> getUserInfoByPage(PageCondition pageCondition) {
        return userInfoDao.getUserInfoByPage(pageCondition);
    }

    @Override
    public boolean addUserInfo(UserInfoEntity userInfoEntity) {
        return userInfoDao.addUserInfo(userInfoEntity)>0;
    }

    @Override
    public boolean updateUserInfo(UserInfoEntity userInfoEntity) {
        return userInfoDao.updateUserInfo(userInfoEntity)>0;
    }

    @Override
    public boolean deleteUserInfo(UserInfoEntity userInfoEntity) {
        return userInfoDao.deleteUserInfo(userInfoEntity)>0;
    }

    @Override
    public int getTotal(PageCondition pageCondition) {
        return userInfoDao.getTotal(pageCondition);
    }

}
