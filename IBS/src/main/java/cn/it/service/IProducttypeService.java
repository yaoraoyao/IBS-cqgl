package cn.it.service;

import cn.it.domain.Producttype;

import java.util.List;

public interface IProducttypeService extends IBaseService<Producttype,Long> {
    void delete(String ids);
    List<Producttype> findByParentIsNull();
    List<Producttype> findByParentIsNotNull();
}