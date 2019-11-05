package cn.itsource.mapper;


import cn.itsource.base.mapper.BaseMapper;
import cn.itsource.domain.Employee;

public interface EmployeeMapper extends BaseMapper<Employee> {

    //通过username查询用户
    Employee findByName(String username);

}
