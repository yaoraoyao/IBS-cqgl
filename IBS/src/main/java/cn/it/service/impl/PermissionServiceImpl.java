package cn.it.service.impl;

import cn.it.domain.Permission;
import cn.it.repository.IPermissionRepository;
import cn.it.service.IPermissionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Set;

@Service
public class PermissionServiceImpl extends BaseServiceImpl<Permission,Long> implements IPermissionService {

    @Autowired
    private IPermissionRepository permissionRepository;
    
    @Override
    @Transactional
    public void delete(String ids) {
        permissionRepository.delete(ids);
    }

    @Override
    public Set<String> findSnByEmp(Long employeeId) {
        return permissionRepository.findSnByEmp(employeeId);
    }
}