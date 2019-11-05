package cn.it.test;

import cn.it.domain.Employee;
import cn.it.repository.IEmployeeRepository;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.persistence.criteria.*;
import java.util.List;

public class JpaSpecificationExecutor extends BaseTest {

    @Autowired
    private IEmployeeRepository employeeRepository;

    /**
     * 单条件查询
     * @throws Exception
     */
    @Test
    public void testFindByName () throws Exception{
        List<Employee> list = employeeRepository.findAll(new Specification<Employee>() {
            /**
             * 自己来确定使用什么规则进行查询
             * @param root :根(表) -> 获取要查询的字段(username,password,age,...)
             * @param criteriaQuery -> 查询哪些字段，排序是什么(主要是把多个查询的条件连系起来)
             *                              and,or,...
             * @param criteriaBuilder
             *      字段之间是什么关系，如何生成一个查询条件，每一个查询条件都是什么方式
             *                      主要判断关系（和这个字段是相等，大于，小于like等）
             * @return Predicate 断言，断定; 宣布 -> 最后确定好的规则
             *                    where key = value and key =value ,...
             */
            @Override
            public Predicate toPredicate(Root<Employee> root, CriteriaQuery<?> criteriaQuery, CriteriaBuilder criteriaBuilder) {
                Path username = root.get("userName");
                Predicate like = criteriaBuilder.like(username, "%admin1%");
                return like;
            }
        });
        list.forEach(employee -> System.out.println(employee));
    }

    /**
     * 多条件查询
     */
    @Test
    public void testFindByNameAndEmail () throws Exception{
        List<Employee> list = employeeRepository.findAll(new Specification<Employee>() {
            @Override
            public Predicate toPredicate(Root<Employee> root, CriteriaQuery<?> criteriaQuery, CriteriaBuilder criteriaBuilder) {
                Path userName = root.get("userName");
                Path email = root.get("email");
                Predicate name = criteriaBuilder.like(userName, "%ad%");
                Predicate e = criteriaBuilder.like(email, "%admin%");
                Predicate restriction = criteriaQuery.where(name, e).getRestriction();
                return restriction;
            }
        });
        list.forEach(employee -> System.out.println(employee));
    }

    /**
     * 分页排序单条件查询
     */
    @Test
    public void testSortAndPage () throws Exception{
        Sort age = new Sort(Sort.Direction.DESC, "id");
        PageRequest pageRequest = new PageRequest(0,6,age);
        Page<Employee> page = employeeRepository.findAll(new Specification<Employee>() {
            @Override
            public Predicate toPredicate(Root<Employee> root, CriteriaQuery<?> criteriaQuery, CriteriaBuilder criteriaBuilder) {
                Path username = root.get("userName");
                Predicate like = criteriaBuilder.like(username, "%admin1%");
                return like;
            }
        }, pageRequest);
        page.forEach(employee -> System.out.println(employee));
    }


}
