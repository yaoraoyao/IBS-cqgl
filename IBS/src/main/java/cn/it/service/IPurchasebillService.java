package cn.it.service;

import cn.it.domain.Purchasebill;

public interface IPurchasebillService extends IBaseService<Purchasebill,Long> {
    void delete(String ids);
    void audite(Long id);
}