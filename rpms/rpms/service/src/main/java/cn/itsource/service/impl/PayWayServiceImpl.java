package cn.itsource.service.impl;

import cn.itsource.base.mapper.BaseMapper;
import cn.itsource.base.service.impl.BaseServiceImpl;
import cn.itsource.domain.PayWay;
import cn.itsource.mapper.PayWayMapper;
import cn.itsource.service.IPayWayService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional(propagation = Propagation.SUPPORTS,readOnly = true)
public class PayWayServiceImpl extends BaseServiceImpl<PayWay> implements IPayWayService{
    @Autowired
    private PayWayMapper payWayMapper;
    @Override
    protected BaseMapper<PayWay> getMapper() {
        return payWayMapper;
    }
}
