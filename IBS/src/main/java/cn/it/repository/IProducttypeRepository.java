package cn.it.repository;
import cn.it.domain.Producttype;

import java.util.List;

public interface IProducttypeRepository extends IBaseRepository<Producttype,Long>{
    List<Producttype> findByParentIsNull();
    List<Producttype> findByParentIsNotNull();
}