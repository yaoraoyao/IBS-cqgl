package cn.it.test;

import cn.it.domain.Employee;
import cn.it.service.IEmployeeService;
import cn.it.utils.MD5Util;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

public class PasswordTest extends BaseTest{
    @Autowired
    private IEmployeeService employeeService;

    @Test
    public void testPassword () throws Exception{
        List<Employee> list = employeeService.findByJpql("from Employee");
        for (Employee employee : list) {
            employee.setPassword(MD5Util.getMD5Password(employee.getUserName()));
            employeeService.save(employee);
        }
    }

}
