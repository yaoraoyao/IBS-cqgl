package cn.itsource.service;


import cn.itsource.base.service.IBaseService;
import cn.itsource.domain.Employee;

public interface IEmployeeService extends IBaseService<Employee> {
    Employee findByName(String name);
}
