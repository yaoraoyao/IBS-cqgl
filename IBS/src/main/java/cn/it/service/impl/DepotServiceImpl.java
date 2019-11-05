package cn.it.service.impl;

import cn.it.domain.Depot;
import cn.it.repository.IDepotRepository;
import cn.it.service.IDepotService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class DepotServiceImpl extends BaseServiceImpl<Depot,Long> implements IDepotService {

    @Autowired
    private IDepotRepository depotRepository;
    
    @Override
    @Transactional
    public void delete(String ids) {
        depotRepository.delete(ids);
    }
}