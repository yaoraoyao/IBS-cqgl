package cn.it.service.impl;

import cn.it.domain.Producttype;
import cn.it.repository.IProducttypeRepository;
import cn.it.service.IProducttypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class ProducttypeServiceImpl extends BaseServiceImpl<Producttype,Long> implements IProducttypeService {

    @Autowired
    private IProducttypeRepository producttypeRepository;
    
    @Override
    @Transactional
    public void delete(String ids) {
        producttypeRepository.delete(ids);
    }

    @Override
    public List<Producttype> findByParentIsNull() {
        return producttypeRepository.findByParentIsNull();
    }

    @Override
    public List<Producttype> findByParentIsNotNull() {
        return producttypeRepository.findByParentIsNotNull();
    }
}