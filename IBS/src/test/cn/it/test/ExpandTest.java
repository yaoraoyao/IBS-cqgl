package cn.it.test;

import cn.it.domain.Employee;
import cn.it.query.EmployeeQuery;
import cn.it.repository.IEmployeeRepository;
import cn.it.utils.PageList;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;

import java.util.List;

public class ExpandTest extends BaseTest {
    @Autowired
    private IEmployeeRepository employeeRepository;

    @Test
    public void testFindPageByQuery () throws Exception{
        EmployeeQuery employeeQuery = new EmployeeQuery();
//        employeeQuery.setCurrentPage(1);
//        employeeQuery.setPageSize(6);
//        employeeQuery.setUserName("a");
////        employeeQuery.setEmail("2");
////        employeeQuery.setAge(25);
//        employeeQuery.setOrderName("id");
//        employeeQuery.setOrderType("desc");
        Page page = employeeRepository.findPageByQuery(employeeQuery);
        PageList<Employee> list = new PageList<Employee>(employeeQuery.getPageNo(),employeeQuery.getPageSize(),  employeeRepository.findPageByQuery(employeeQuery).getTotalElements(), employeeRepository.findPageByQuery(employeeQuery).getContent());
        System.out.println(list.getRows());
    }

    @Test
    public void testFindByQuery () throws Exception{
        EmployeeQuery employeeQuery = new EmployeeQuery();
//        employeeQuery.setUsername("admin");
        employeeQuery.setOrderProperty("id");
        employeeQuery.setOrderType("desc");
        List<Employee> list = employeeRepository.findByQuery(employeeQuery);
        list.forEach(employee -> System.out.println(employee));
    }

    @Test
    public void testFindByJpql () throws Exception{
        List jpql = employeeRepository.findByJpql("select e from Employee e where username like ? and age=?","%admin1%", 25);
        jpql.forEach(e -> System.out.println(e));
    }
}
