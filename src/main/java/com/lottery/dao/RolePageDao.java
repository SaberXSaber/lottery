package com.lottery.dao;

import com.lottery.condition.PageCondition;
import com.lottery.pojo.RolePageEntity;

import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: guoshubo
 * Date: 2017/3/9
 * Time: 14:15
 * Description：
 */
public interface RolePageDao {
    List<RolePageEntity> getByPage(PageCondition pageCondition);
    int add(RolePageEntity rolePageEntity);
    int edit(RolePageEntity rolePageEntity);
    int del(RolePageEntity rolePageEntity);
    int getTotal(PageCondition pageCondition);

    List<String> rolePageDao(int roleId);

    int addbatchRolePage(List<RolePageEntity> list);
}
