package cn.itsource.mapper;

import cn.itsource.base.mapper.BaseMapper;
import cn.itsource.domain.RepairOrderItem;

import java.io.Serializable;
import java.util.List;

public interface RepairOrderItemMapper extends BaseMapper<RepairOrderItem> {
    //通过维修单号查询明细
    List<RepairOrderItem> findByMainId(Serializable id);
}
