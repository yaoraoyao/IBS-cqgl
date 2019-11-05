package cn.itsource.service;

import cn.itsource.base.service.IBaseService;
import cn.itsource.domain.RepairOrder;
import cn.itsource.domain.RepairOrderItem;

import java.util.List;


public interface IRepairOrderService extends IBaseService<RepairOrder> {
    List<RepairOrderItem> findItemsById(Long id);
}
