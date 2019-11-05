package cn.it.service.impl;

import cn.it.domain.Role;
import cn.it.repository.IRoleRepository;
import cn.it.service.IRoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class RoleServiceImpl extends BaseServiceImpl<Role,Long> implements IRoleService {

    @Autowired
    private IRoleRepository roleRepository;
    
    @Override
    @Transactional
    public void delete(String ids) {
        roleRepository.delete(ids);
    }
}