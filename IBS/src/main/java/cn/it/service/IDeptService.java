package cn.it.service;

import cn.it.domain.Dept;

public interface IDeptService extends IBaseService<Dept,Long> {
    void delete(String ids);
}