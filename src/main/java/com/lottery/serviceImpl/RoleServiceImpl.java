package com.lottery.serviceImpl;

import com.lottery.condition.PageCondition;
import com.lottery.dao.RoleDao;
import com.lottery.pojo.RoleEntity;
import com.lottery.service.RoleService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: guoshubo
 * Date: 2017/3/9
 * Time: 10:10
 * Description：
 */
@Service
public class RoleServiceImpl implements RoleService {
    @Resource
    private RoleDao roleDao;
    @Override
    public List<RoleEntity> getRoleByPage(PageCondition pageCondition) {
        return roleDao.getRoleByPage(pageCondition);
    }

    @Override
    public boolean addRole(RoleEntity roleEntity) {
        return roleDao.addRole(roleEntity)>0;
    }

    @Override
    public boolean updateRole(RoleEntity roleEntity) {
        return roleDao.updateRole(roleEntity)>0;
    }

    @Override
    public boolean deleteRole(RoleEntity roleEntity) {
        return roleDao.deleteRole(roleEntity)>0;
    }

    @Override
    public int getTotal(PageCondition pageCondition) {
        return roleDao.getTotal(pageCondition);
    }

    @Override
    public List<RoleEntity> roleList() {
        return roleDao.roleList();
    }
}
