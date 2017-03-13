package com.lottery.serviceImpl;

import com.lottery.condition.PageCondition;
import com.lottery.dao.RolePageDao;
import com.lottery.pojo.RolePageEntity;
import com.lottery.service.RolePageService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: guoshubo
 * Date: 2017/3/9
 * Time: 14:17
 * Description：
 */
@Service
public class RolePageServiceImpl implements RolePageService {
    @Resource
    private RolePageDao rolePageDao;

    @Override
    public List<RolePageEntity> getByPage(PageCondition pageCondition) {
        return rolePageDao.getByPage(pageCondition);
    }

    @Override
    public boolean add(RolePageEntity rolePageEntity) {
        return rolePageDao.add(rolePageEntity)>0;
    }

    @Override
    public boolean edit(RolePageEntity rolePageEntity) {
        return rolePageDao.edit(rolePageEntity)>0;
    }

    @Override
    public boolean del(RolePageEntity rolePageEntity) {
        return rolePageDao.del(rolePageEntity)>0;
    }

    @Override
    public int getTotal(PageCondition pageCondition) {
        return rolePageDao.getTotal(pageCondition);
    }

    @Override
    public List<String> getUserRight(int roleId) {
        return rolePageDao.rolePageDao(roleId);
    }

    @Override
    public boolean addbatchRolePage(List<RolePageEntity> list) {
        return rolePageDao.addbatchRolePage(list)>0;
    }
}
