package cn.itsource.service.impl;


import cn.itsource.base.mapper.BaseMapper;
import cn.itsource.base.service.impl.BaseServiceImpl;
import cn.itsource.domain.Employee;
import cn.itsource.mapper.EmployeeMapper;
import cn.itsource.service.IEmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Transactional(propagation = Propagation.SUPPORTS,readOnly = true)//只读
@Service
public class EmployeeServiceImpl extends BaseServiceImpl<Employee> implements IEmployeeService {

    @Autowired
    private EmployeeMapper employeeMapper;

    @Override
    protected BaseMapper<Employee> getMapper() {

        return employeeMapper;
    }

    public Employee findByName(String name){
       return employeeMapper.findByName(name);
    }
    /*
    如果service层调用的是baseService里的方法，事物不成功

    * 事物有两种实现方式：
    * 1.注解方式：xml中配置事物管理和开启注解驱动
    * 2.xml方式：
    *
    * */
}
