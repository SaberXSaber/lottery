package com.lottery.serviceImpl;

import com.lottery.condition.PageCondition;
import com.lottery.dao.DateReportDao;
import com.lottery.pojo.DateReportEntity;
import com.lottery.service.DateReportService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: guoshubo
 * Date: 2017/3/16
 * Time: 10:30
 * Description：
 */
@Service
public class DateReportServiceImpl implements DateReportService {
    @Resource
    private DateReportDao dateReportDao;

    @Override
    public List<DateReportEntity> getByPage(PageCondition pageCondition) {
        return dateReportDao.getByPage(pageCondition);
    }

    @Override
    public int getTotal(PageCondition pageCondition) {
        return dateReportDao.getTotal(pageCondition);
    }
}
