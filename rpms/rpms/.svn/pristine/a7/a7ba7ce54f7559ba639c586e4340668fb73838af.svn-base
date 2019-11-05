package cn.itsource.service.impl;

import cn.itsource.base.mapper.BaseMapper;
import cn.itsource.base.service.impl.BaseServiceImpl;
import cn.itsource.domain.RepairOrder;
import cn.itsource.domain.RepairOrderItem;
import cn.itsource.mapper.RepairOrderMapper;
import cn.itsource.service.IRepairOrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional(propagation = Propagation.SUPPORTS,readOnly = true)
public class RepairOrderServiceImpl extends BaseServiceImpl<RepairOrder> implements IRepairOrderService {

    @Autowired
    private RepairOrderMapper repairOrderMapper;

    @Override
    protected BaseMapper<RepairOrder> getMapper() {
        return repairOrderMapper;
    }

    @Override
    public List<RepairOrderItem> findItemsById(Long id) {
        List<RepairOrderItem> list = repairOrderMapper.findItemsById(id);
        return list;
    }
}
