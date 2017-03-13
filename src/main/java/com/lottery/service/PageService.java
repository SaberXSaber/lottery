package com.lottery.service;

import com.lottery.condition.PageCondition;
import com.lottery.pojo.PageEntity;
import com.lottery.pojo.RoleEntity;

import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: guoshubo
 * Date: 2017/3/3
 * Time: 16:51
 * Description：
 */
public interface PageService {
    List<PageEntity> getPageByPage(PageCondition pageCondition);
    boolean addPage(PageEntity pageEntity);
    boolean updatePage(PageEntity pageEntity);
    boolean deletePage(PageEntity pageEntity);
    int getTotal(PageCondition pageCondition);

    List<PageEntity> pageList();
}
