package cn.it.service;

import cn.it.domain.Department;

public interface IDepartmentService extends IBaseService<Department,Long> {
    void delete(String ids);
    Department findByName(String username);
}
