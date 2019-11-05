package cn.itsource.service.impl;

import cn.itsource.base.mapper.BaseMapper;
import cn.itsource.base.service.impl.BaseServiceImpl;
import cn.itsource.domain.RepairOrderItem;
import cn.itsource.mapper.RepairOrderItemMapper;
import cn.itsource.service.IRepairOrderItemService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.io.Serializable;
import java.util.List;

@Service
@Transactional(propagation = Propagation.SUPPORTS,readOnly = true)
public class RepairOrderItemServiceImpl extends BaseServiceImpl<RepairOrderItem> implements IRepairOrderItemService {

    @Autowired
    private RepairOrderItemMapper repairOrderItemMapper;

    @Override
    protected BaseMapper<RepairOrderItem> getMapper() {
        return repairOrderItemMapper;
    }

    @Override
    public List<RepairOrderItem> findByMainId(Serializable id) {
        return repairOrderItemMapper.findByMainId(id);
    }
}
