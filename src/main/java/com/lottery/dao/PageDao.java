package com.lottery.dao;

import com.lottery.condition.PageCondition;
import com.lottery.pojo.PageEntity;
import com.lottery.pojo.RoleEntity;

import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: guoshubo
 * Date: 2017/3/3
 * Time: 16:52
 * Description：
 */
public interface PageDao {
    List<PageEntity> getPageByPage(PageCondition pageCondition);
    int addPage(PageEntity pageEntity);
    int updatePage(PageEntity pageEntity);
    int deletePage(PageEntity pageEntity);
    int getTotal(PageCondition pageCondition);

    List<PageEntity> pageList();
}
