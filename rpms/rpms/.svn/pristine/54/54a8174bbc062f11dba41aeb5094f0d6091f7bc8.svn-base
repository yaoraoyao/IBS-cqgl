package cn.itsource.base.service.impl;

import cn.itsouce.util.PageList;
import cn.itsource.base.mapper.BaseMapper;
import cn.itsource.base.query.BaseQuery;
import cn.itsource.base.service.IBaseService;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;

import java.io.Serializable;
import java.util.List;

public abstract class BaseServiceImpl<T> implements IBaseService<T> {

    protected abstract BaseMapper<T> getMapper();

    @Override
    public List<T> findAll() {
        return getMapper().findAll();
    }

    @Override
    public T findOne(Serializable id) {
        return getMapper().findOne(id);
    }

    @Override
    public void update(T t) {

        getMapper().update(t);
    }

    @Override
    public void delete(Serializable id) {
        getMapper().delete(id);

    }

    @Override
    public void save(T t) {
        getMapper().save(t);
    }

    @Override
    public List<T> query(BaseQuery baseQuery) {
        return getMapper().query(baseQuery);
    }

    @Override
    public PageList<T> queryByPage(BaseQuery baseQuery) {

        PageList<T> pageList = new PageList<>();
        // 第一页 每页显示10条
        Page<T> page = PageHelper.startPage(baseQuery.getPageNum(), baseQuery.getPageSize());
        List<T> query = getMapper().query(baseQuery);
        pageList.setTotal(page.getTotal());
        pageList.setRows(query);

        return pageList;
    }
}
