package cn.itsource.service.impl;

import cn.itsource.base.mapper.BaseMapper;
import cn.itsource.base.service.impl.BaseServiceImpl;
import cn.itsource.domain.SettedBill;
import cn.itsource.mapper.SettedBillMapper;
import cn.itsource.service.ISettedBillService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional(propagation = Propagation.SUPPORTS,readOnly = true)
public class SettedBillServiceImpl extends BaseServiceImpl<SettedBill> implements ISettedBillService {
    @Autowired
    private SettedBillMapper settedBillMapper;

    @Override
    protected BaseMapper<SettedBill> getMapper() {
        return settedBillMapper;
    }

    @Override
    public SettedBill findByWay(Long way) {
        return settedBillMapper.findByWay(way);
    }

    @Override
    public List<SettedBill> findByStatus(Integer status) {
        return settedBillMapper.findByStatus(status);
    }


    //通过id查询结算单
    @Override
    public SettedBill findById(Long id) {
        return settedBillMapper.findById(id);
    }


}
