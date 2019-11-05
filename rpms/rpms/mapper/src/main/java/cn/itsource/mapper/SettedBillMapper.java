package cn.itsource.mapper;

import cn.itsource.base.mapper.BaseMapper;
import cn.itsource.domain.SettedBill;

import java.util.List;

public interface SettedBillMapper extends BaseMapper<SettedBill> {
    SettedBill findByWay (Long way);
    //通过状态查询结算单
    List<SettedBill> findByStatus(Integer status);
    //通过id查询结算单
    SettedBill findById(Long id);
}
