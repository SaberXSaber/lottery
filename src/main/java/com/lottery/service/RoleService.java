package com.lottery.service;

import com.lottery.condition.PageCondition;
import com.lottery.pojo.RoleEntity;


import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: guoshubo
 * Date: 2017/3/3
 * Time: 16:51
 * Description：
 */
public interface RoleService {
    List<RoleEntity> getRoleByPage(PageCondition pageCondition);
    boolean addRole(RoleEntity roleEntity);
    boolean updateRole(RoleEntity roleEntity);
    boolean deleteRole(RoleEntity roleEntity);
    int getTotal(PageCondition pageCondition);

    List<RoleEntity> roleList();
}
