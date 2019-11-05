package cn.it.service;

import cn.it.domain.Depot;

public interface IDepotService extends IBaseService<Depot,Long> {
    void delete(String ids);
}