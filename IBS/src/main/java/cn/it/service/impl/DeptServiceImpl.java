package cn.it.service.impl;

import cn.it.domain.Dept;
import cn.it.repository.IDeptRepository;
import cn.it.service.IDeptService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class DeptServiceImpl extends BaseServiceImpl<Dept,Long> implements IDeptService {

    @Autowired
    private IDeptRepository deptRepository;
    
    @Override
    @Transactional
    public void delete(String ids) {
        deptRepository.delete(ids);
    }
}