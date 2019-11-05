package cn.itsource.service;

import cn.itsource.base.service.IBaseService;
import cn.itsource.domain.Permission;

import java.util.List;
import java.util.Set;

public interface IPermissionService extends IBaseService<Permission> {

    Set<String> findPermissionByEmployeeId(Long empId);
}
