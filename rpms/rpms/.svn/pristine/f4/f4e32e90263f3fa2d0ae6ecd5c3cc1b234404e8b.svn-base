package cn.itsource.service.impl;


import cn.itsource.base.mapper.BaseMapper;
import cn.itsource.base.service.impl.BaseServiceImpl;
import cn.itsource.domain.Role;
import cn.itsource.mapper.RoleMapper;
import cn.itsource.service.IRoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Transactional(propagation = Propagation.SUPPORTS,readOnly = true)//只读
@Service
public class RoleServiceImpl extends BaseServiceImpl<Role> implements IRoleService {

    @Autowired
    private RoleMapper roleMapper;

    @Override
    protected BaseMapper<Role> getMapper() {

        return roleMapper;
    }

    /*
    如果service层调用的是baseService里的方法，事物不成功

    * 事物有两种实现方式：
    * 1.注解方式：xml中配置事物管理和开启注解驱动
    * 2.xml方式：
    *
    * */
}
