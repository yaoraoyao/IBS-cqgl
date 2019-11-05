package cn.it.test;

import cn.it.domain.Employee;
import cn.it.repository.IEmployeeRepository;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:spring.xml")
public class SpringDataJpaTest {
    @Autowired
    private IEmployeeRepository employeeRepository;

    /**
     * 查询所有数据
     * @throws Exception
     */
    @Test
    public void testFindAll () throws Exception{
        List<Employee> list = employeeRepository.findAll();
        list.forEach(employee -> System.out.println(employee));
    }

    /**
     * 保存
     * @throws Exception
     */
    @Test
    public void testSave () throws Exception{
        Employee employee = new Employee();
        employee.setUserName("阴俊池");
        employee.setPassword("888888");
        employee.setAge(18);
//        employee.setDepartment_id(3L);
        employee.setEmail("ctguctgu@163.com");
        employeeRepository.save(employee);
    }

    /**
     * 删除
     * @throws Exception
     */
    @Test
    public void testDel () throws Exception{
        employeeRepository.delete(273L);
    }

    /**
     * 修改
     * @throws Exception
     */
    @Test
    public void testUpdate () throws Exception{
        Employee employee = employeeRepository.findOne(274L);
        employee.setUserName("ctgu");
        employeeRepository.save(employee);
    }

    /**
     * 分页
     * @throws Exception
     */
    @Test
    public void testPage () throws Exception{
        PageRequest pageRequest = new PageRequest(0, 5);
        Page<Employee> page = employeeRepository.findAll(pageRequest);
        System.out.println(page.getTotalPages());
        System.out.println(page.getTotalElements());
        System.out.println(page.getContent());
        System.out.println(page.getNumber());
        System.out.println(page.getNumberOfElements());
        System.out.println(page.getSize());
        page.forEach(employee -> System.out.println(employee));
    }

    /**
     * 排序
     * @throws Exception
     */
    @Test
    public void testSort () throws Exception{
        Sort id = new Sort(Sort.Direction.DESC, "id");
        List<Employee> list = employeeRepository.findAll(id);
        list.forEach(employee -> System.out.println(employee));
    }

    /**
     * 分页+排序
     */
    @Test
    public void testPageAndSort () throws Exception{
        Sort id = new Sort(Sort.Direction.DESC, "id");
        PageRequest pageRequest = new PageRequest(0, 6, id);
        Page<Employee> page = employeeRepository.findAll(pageRequest);
        page.forEach(employee -> System.out.println(employee));
    }

    /**
     * 单一简单条件查询
     */
    @Test
    public void testFindByName () throws Exception{
//        List<Employee> like = employeeRepository.findByUserNameLike("%admin1%");
//        like.forEach(employee -> System.out.println(employee));
//        List<Employee> name = employeeRepository.findByUserName("admin");
//        name.forEach(employee -> System.out.println(employee));
//        List<Employee> name = employeeRepository.findByName("%admin2%");
//        name.forEach(employee -> System.out.println(employee));
    }

    /**
     * 多条件查询
     */
    @Test
    public void testFindByNameAndAge () throws Exception{
//        List<Employee> list = employeeRepository.findAllByUserNameLikeAndAge("%admin1%", 25);
//        list.forEach(employee -> System.out.println(employee));
    }
}
