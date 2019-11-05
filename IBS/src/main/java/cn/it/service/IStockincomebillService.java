package cn.it.service;

import cn.it.domain.Stockincomebill;

public interface IStockincomebillService extends IBaseService<Stockincomebill,Long> {
    void delete(String ids);
    void audite(Long id);
}