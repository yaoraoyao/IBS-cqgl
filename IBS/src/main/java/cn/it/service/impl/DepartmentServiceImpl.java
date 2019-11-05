package cn.it.service.impl;

import cn.it.domain.Department;
import cn.it.repository.IDepartmentRepository;
import cn.it.service.IDepartmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class DepartmentServiceImpl extends BaseServiceImpl<Department,Long> implements IDepartmentService{
    @Autowired
    private IDepartmentRepository departmentRepository;

    @Override
    public Department findByName(String username) {
        return departmentRepository.findByName(username);
    }

    @Override
    @Transactional
    public void delete(String ids) {
        departmentRepository.delete(ids);
    }
}
