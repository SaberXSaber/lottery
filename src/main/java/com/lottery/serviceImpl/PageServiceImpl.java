package com.lottery.serviceImpl;

import com.lottery.condition.PageCondition;
import com.lottery.dao.PageDao;
import com.lottery.pojo.PageEntity;
import com.lottery.service.PageService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: guoshubo
 * Date: 2017/3/9
 * Time: 10:46
 * Description：
 */
@Service
public class PageServiceImpl implements PageService {
    @Resource
    private PageDao pageDao;

    @Override
    public List<PageEntity> getPageByPage(PageCondition pageCondition) {
        return pageDao.getPageByPage(pageCondition);
    }

    @Override
    public boolean addPage(PageEntity pageEntity) {
        return pageDao.addPage(pageEntity)>0;
    }

    @Override
    public boolean updatePage(PageEntity pageEntity) {
        return pageDao.updatePage(pageEntity)>0;
    }

    @Override
    public boolean deletePage(PageEntity pageEntity) {
        return pageDao.deletePage(pageEntity)>0;
    }

    @Override
    public int getTotal(PageCondition pageCondition) {
        return pageDao.getTotal(pageCondition);
    }

    @Override
    public List<PageEntity> pageList() {
        return pageDao.pageList();
    }
}
