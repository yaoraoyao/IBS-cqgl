package cn.it.service;

import cn.it.domain.Permission;

import java.util.Set;

public interface IPermissionService extends IBaseService<Permission,Long> {
    void delete(String ids);
    Set<String> findSnByEmp(Long employeeId);
}