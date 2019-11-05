package cn.it.service;

import cn.it.domain.Supplier;

public interface ISupplierService extends IBaseService<Supplier,Long> {
    void delete(String ids);
}