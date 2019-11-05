package cn.it.service;

import cn.it.domain.Product;

public interface IProductService extends IBaseService<Product,Long> {
    void delete(String ids,String paths);
}