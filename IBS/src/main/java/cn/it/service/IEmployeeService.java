package cn.it.service;

import cn.it.domain.Employee;

import java.util.List;

public interface IEmployeeService extends IBaseService<Employee,Long> {
    void delete(String ids);
    Employee findByUsername(String username);
    List<Employee> findAllBuyer();
    List<Employee> findAllKeeper();
}
