package cn.it.service;

import cn.it.domain.Menu;
import cn.it.domain.MenuVo;

import java.util.List;

public interface IMenuService extends IBaseService<Menu,Long> {
    void delete(String ids);
    List<Menu> findByLoginUser();
    List<Menu> findByParentIsNotNull();
    List<Menu> findByParentIsNull();
}