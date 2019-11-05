package cn.it.service;

import cn.it.domain.MenuVo;

public interface IMenuVoService extends IBaseService<MenuVo,Long> {
    void delete(String ids);
}