package cn.it.service;

import cn.it.domain.Role;

public interface IRoleService extends IBaseService<Role,Long> {
    void delete(String ids);
}