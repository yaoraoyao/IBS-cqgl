package cn.it.service.impl;

import cn.it.domain.Supplier;
import cn.it.repository.ISupplierRepository;
import cn.it.service.ISupplierService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class SupplierServiceImpl extends BaseServiceImpl<Supplier,Long> implements ISupplierService {

    @Autowired
    private ISupplierRepository supplierRepository;
    
    @Override
    @Transactional
    public void delete(String ids) {
        supplierRepository.delete(ids);
    }
}