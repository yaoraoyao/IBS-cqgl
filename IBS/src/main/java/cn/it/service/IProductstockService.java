package cn.it.service;

import cn.it.domain.Productstock;

public interface IProductstockService extends IBaseService<Productstock,Long> {
    void delete(String ids);
}