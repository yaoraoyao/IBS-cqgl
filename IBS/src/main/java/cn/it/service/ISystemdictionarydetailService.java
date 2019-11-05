package cn.it.service;

import cn.it.domain.Systemdictionarydetail;

import java.util.List;

public interface ISystemdictionarydetailService extends IBaseService<Systemdictionarydetail,Long> {
    void delete(String ids);
    List<Systemdictionarydetail> findAllUnit(String sn);
    List<Systemdictionarydetail> findAllBrand(String sn);
}