package com.lottery.dao;

import com.lottery.condition.PageCondition;
import com.lottery.pojo.RoleEntity;

import java.util.List;
import java.util.Map;

/**
 * Created by IntelliJ IDEA.
 * User: guoshubo
 * Date: 2017/3/3
 * Time: 16:52
 * Description：
 */
public interface RoleDao {
    List<RoleEntity> getRoleByPage(PageCondition pageCondition);
    int addRole(RoleEntity roleEntity);
    int updateRole(RoleEntity roleEntity);
    int deleteRole(RoleEntity roleEntity);
    int getTotal(PageCondition pageCondition);
    List<RoleEntity> roleList();
}
