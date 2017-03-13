package com.lottery.service;

import com.lottery.condition.PageCondition;
import com.lottery.pojo.RolePageEntity;

import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: guoshubo
 * Date: 2017/3/9
 * Time: 14:17
 * Description：
 */
public interface RolePageService {
    List<RolePageEntity> getByPage(PageCondition pageCondition);
    boolean add(RolePageEntity rolePageEntity);
    boolean edit(RolePageEntity rolePageEntity);
    boolean del(RolePageEntity rolePageEntity);
    int getTotal(PageCondition pageCondition);

    List<String> getUserRight(int roleId);

    boolean addbatchRolePage(List<RolePageEntity> list);
}
