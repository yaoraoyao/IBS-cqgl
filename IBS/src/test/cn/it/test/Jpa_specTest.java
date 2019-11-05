package cn.it.test;

import cn.it.domain.Employee;
import cn.it.query.EmployeeQuery;
import cn.it.repository.IEmployeeRepository;
import com.github.wenhao.jpa.Specifications;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.domain.Specification;

import java.util.List;

public class Jpa_specTest extends BaseTest {
    @Autowired
    private IEmployeeRepository employeeRepository;

    /**
     * 单条件查询
     * @throws Exception
     */
    @Test
    public void testFindByName () throws Exception{
        Specification<Employee> userName = Specifications.<Employee>and().like("userName","%admin%").build();
        List<Employee> all = employeeRepository.findAll(userName);
        all.forEach(employee -> System.out.println(employee));
    }

    /**
     * 多条件查询
     */
    @Test
    public void testFindByNameAndEmail () throws Exception{
        Specification<Employee> userName = Specifications.<Employee>and()
                .like("email","%ad%")
                .like("userName","%a%").build();
        List<Employee> all = employeeRepository.findAll(userName);
        all.forEach(employee -> System.out.println(employee));
    }

    /**
     * 分页排序查询
     */
    @Test
    public void testSortAndPage () throws Exception{
        Sort sort = new Sort(Sort.Direction.DESC, "id");
        Pageable pageRequest = new PageRequest(0,6,sort);
        Specification<Employee> userName = Specifications.<Employee>and()
                .like("userName","%a%").build();
        Page<Employee> all = employeeRepository.findAll(userName,pageRequest);
        all.forEach(employee -> System.out.println(employee));
    }

    /**
     * 通过query对象查询
     */
    @Test
    public void testQuery () throws Exception{
        EmployeeQuery employeeQuery = new EmployeeQuery();
        employeeQuery.setPageNo(1);
        employeeQuery.setPageSize(6);
//        employeeQuery.setUsername("a");
//        employeeQuery.setEmail("2");
//        employeeQuery.setAge(25);
        employeeQuery.setOrderProperty("id");
        employeeQuery.setOrderType("desc");
        PageRequest request = new PageRequest(employeeQuery.getJpaPageNo(),employeeQuery.getPageSize(),employeeQuery.getSort());
        Page page = employeeRepository.findAll(employeeQuery.getSpecification(), request);
        page.forEach(e -> System.out.println(e));
    }
}
