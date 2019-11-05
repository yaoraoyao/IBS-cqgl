package cn.it.service;

import cn.it.domain.Systemdictionarytype;

public interface ISystemdictionarytypeService extends IBaseService<Systemdictionarytype,Long> {
    void delete(String ids);
}