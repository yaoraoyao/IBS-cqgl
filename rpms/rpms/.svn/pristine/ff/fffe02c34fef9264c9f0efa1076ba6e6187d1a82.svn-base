package cn.itsource.base.mapper;

import cn.itsouce.util.PageList;
import cn.itsource.base.query.BaseQuery;

import java.io.Serializable;
import java.util.List;

public interface BaseMapper<T> {
    List<T> findAll();

    T findOne(Serializable id);

    void update(T department);

    void delete(Serializable id);

    void save(T department);

    List<T> query(BaseQuery baseQuery);

    PageList<T> queryByPage(BaseQuery baseQuery);

}
