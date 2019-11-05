package cn.itsource.base.service;

import cn.itsouce.util.PageList;
import cn.itsource.base.query.BaseQuery;

import java.io.Serializable;
import java.util.List;

public interface IBaseService<T> {
    List<T> findAll();

    T findOne(Serializable id);

    void update(T t);

    void delete(Serializable id);

    void save(T t);
    //查询所有数据不分页

    List<T> query(BaseQuery baseQuery);

    PageList<T> queryByPage(BaseQuery baseQuery);

}
