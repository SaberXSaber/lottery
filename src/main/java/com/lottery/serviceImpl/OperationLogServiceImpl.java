package com.lottery.serviceImpl;

import com.lottery.dao.OperationLogDao;
import com.lottery.pojo.OperationLog;
import com.lottery.service.OperationLogService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * Created by IntelliJ IDEA.
 * User: guoshubo
 * Date: 2017/3/8
 * Time: 14:41
 * Description：
 */
@Service
public class OperationLogServiceImpl implements OperationLogService {
    @Resource
    private OperationLogDao operationLogDao;

    @Override
    public boolean add(OperationLog operationLog) {
        return operationLogDao.add(operationLog)>0;
    }
}
