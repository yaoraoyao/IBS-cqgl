package cn.it.service.impl;

import cn.it.domain.MenuVo;
import cn.it.domain.Role;
import cn.it.repository.IMenuVoRepository;
import cn.it.repository.IRoleRepository;
import cn.it.service.IMenuService;
import cn.it.service.IMenuVoService;
import cn.it.service.IRoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class MenuVoServiceImpl extends BaseServiceImpl<MenuVo,Long> implements IMenuVoService {

    @Autowired
    private IMenuVoRepository menuVoRepository;

    @Override
    public void delete(String ids) {

    }
}