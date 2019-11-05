package cn.itsource.service.impl;

import cn.itsource.base.mapper.BaseMapper;
import cn.itsource.base.service.impl.BaseServiceImpl;
import cn.itsource.domain.Permission;
import cn.itsource.mapper.PermissionMapper;
import cn.itsource.service.IPermissionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

@Service
@Transactional(propagation = Propagation.SUPPORTS,readOnly = true)
public class PermissionServiceImpl extends BaseServiceImpl<Permission> implements IPermissionService {
    @Autowired
    private PermissionMapper permissionMapper;
    @Override
    protected BaseMapper<Permission> getMapper() {
        return permissionMapper;
    }

    @Override
    public Set<String> findPermissionByEmployeeId(Long empId) {
        //通过Id查询出用户对应的权限
        List<Permission> list = permissionMapper.findPermissionByEmployeeId(empId);
        //将获取permission对象中的sn属性值保存到set集合中
        Set<String> permissions = new HashSet<>();
        list.forEach(p->{
            permissions.add(p.getSn());
            System.out.println("p.getSn()"+p.getSn());
        });
        permissions.forEach(p-> System.out.println("+++"+p));
        return permissions;
    }
}
