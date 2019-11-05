package cn.it.service.impl;

import cn.it.domain.Systemdictionarytype;
import cn.it.repository.ISystemdictionarytypeRepository;
import cn.it.service.ISystemdictionarytypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class SystemdictionarytypeServiceImpl extends BaseServiceImpl<Systemdictionarytype,Long> implements ISystemdictionarytypeService {

    @Autowired
    private ISystemdictionarytypeRepository systemdictionarytypeRepository;
    
    @Override
    @Transactional
    public void delete(String ids) {
        systemdictionarytypeRepository.delete(ids);
    }
}