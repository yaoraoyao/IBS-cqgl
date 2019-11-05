package cn.itsource.service;

import cn.itsource.base.service.IBaseService;
import cn.itsource.domain.SettedBill;

import java.util.List;


public interface ISettedBillService extends IBaseService<SettedBill> {
    SettedBill findByWay (Long way);

    List<SettedBill> findByStatus(Integer status);

    //根据结算单号查询
    SettedBill findById(Long id);
}
