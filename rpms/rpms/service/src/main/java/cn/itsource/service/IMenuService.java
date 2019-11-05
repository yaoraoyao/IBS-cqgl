package cn.itsource.service;

import cn.itsource.base.service.IBaseService;
import cn.itsource.domain.Menu;

import java.io.Serializable;
import java.util.List;

public interface IMenuService extends IBaseService<Menu> {

    List<Menu> findMenuByEmployeeId(Serializable id);
}
