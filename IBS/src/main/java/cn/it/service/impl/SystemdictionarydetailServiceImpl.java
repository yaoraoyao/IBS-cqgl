package cn.it.service.impl;

import cn.it.domain.Systemdictionarydetail;
import cn.it.domain.Systemdictionarytype;
import cn.it.repository.ISystemdictionarydetailRepository;
import cn.it.service.ISystemdictionarydetailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class SystemdictionarydetailServiceImpl extends BaseServiceImpl<Systemdictionarydetail,Long> implements ISystemdictionarydetailService {

    @Autowired
    private ISystemdictionarydetailRepository systemdictionarydetailRepository;
    
    @Override
    @Transactional
    public void delete(String ids) {
        systemdictionarydetailRepository.delete(ids);
    }

    @Override
    public List<Systemdictionarydetail> findAllUnit(String sn) {
        return systemdictionarydetailRepository.findBySn(sn);
    }

    @Override
    public List<Systemdictionarydetail> findAllBrand(String sn) {
        return systemdictionarydetailRepository.findBySn(sn);
    }
}