package cn.it.repository;

import cn.it.domain.Department;

public interface IDepartmentRepository extends IBaseRepository<Department,Long> {
    Department findByName(String username);
}

