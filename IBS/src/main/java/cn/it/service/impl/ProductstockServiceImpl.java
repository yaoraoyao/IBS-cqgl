package cn.it.service.impl;

import cn.it.domain.Productstock;
import cn.it.repository.IProductstockRepository;
import cn.it.service.IProductstockService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class ProductstockServiceImpl extends BaseServiceImpl<Productstock,Long> implements IProductstockService {

    @Autowired
    private IProductstockRepository productstockRepository;
    
    @Override
    @Transactional
    public void delete(String ids) {
        productstockRepository.delete(ids);
    }
}