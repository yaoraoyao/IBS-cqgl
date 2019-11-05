package cn.it.service;

import cn.it.query.BaseQuery;
import cn.it.utils.PageList;
import com.sun.xml.internal.bind.v2.model.core.ID;
import org.springframework.data.domain.Page;

import java.io.Serializable;
import java.util.List;

public interface IBaseService<T,ID extends Serializable> {

    void save(T t);
    void delete(ID id);
    T findOne(ID id);
    PageList<T> findAll(BaseQuery baseQuery);
    List<T> findRealAll(BaseQuery baseQuery);
    List<T> findByJpql(String jpql, Object... values);
}
