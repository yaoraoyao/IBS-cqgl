package cn.it.service.impl;

import cn.it.query.BaseQuery;
import cn.it.repository.IBaseRepository;
import cn.it.service.IBaseService;
import cn.it.utils.PageList;
import com.sun.xml.internal.bind.v2.model.core.ID;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.io.Serializable;
import java.util.List;

@Transactional(readOnly = true,propagation = Propagation.SUPPORTS)
public class BaseServiceImpl<T,ID extends Serializable> implements IBaseService<T,ID> {

    @Autowired
    private IBaseRepository<T,ID> baseRepository;

    @Override
    @Transactional
    public void save(T t) {
        baseRepository.save(t);
    }

    @Override
    @Transactional
    public void delete(ID id) {
        baseRepository.delete(id);
    }

    @Override
    public T findOne(ID id) {
        return (T) baseRepository.findOne(id);
    }

    @Override
    public PageList<T> findAll(BaseQuery baseQuery) {
        Page<T> page = baseRepository.findPageByQuery(baseQuery);
        return new PageList<T>(baseQuery.getPageNo(),baseQuery.getPageSize(),page.getTotalElements(),page.getContent());
    }

    @Override
    public List<T> findRealAll(BaseQuery baseQuery) {
        return baseRepository.findByQuery(baseQuery);
    }

    @Override
    public List findByJpql(String jpql, Object... values) {
        return baseRepository.findByJpql(jpql, values);
    }
}
