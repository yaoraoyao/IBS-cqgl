package cn.itsource.service.impl;

import cn.itsource.base.mapper.BaseMapper;
import cn.itsource.base.service.impl.BaseServiceImpl;
import cn.itsource.domain.SystemLog;
import cn.itsource.mapper.SystemLogMapper;
import cn.itsource.service.ISystemLogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional(propagation = Propagation.SUPPORTS,readOnly = true)
public class SystemLogServiceImpl extends BaseServiceImpl<SystemLog> implements ISystemLogService {
    @Autowired
    private SystemLogMapper systemLogMapper;

    @Override
    protected BaseMapper<SystemLog> getMapper() {
        return systemLogMapper;
    }
}
