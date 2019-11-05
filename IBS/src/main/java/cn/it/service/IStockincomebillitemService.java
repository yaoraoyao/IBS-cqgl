package cn.it.service;

import cn.it.domain.Stockincomebillitem;

public interface IStockincomebillitemService extends IBaseService<Stockincomebillitem,Long> {
    void delete(String ids);
}