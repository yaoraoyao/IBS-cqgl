package cn.it.query;

import cn.it.domain.Employee;
import com.github.wenhao.jpa.Specifications;
import org.apache.commons.lang3.StringUtils;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.domain.Specification;

public class EmployeeQuery extends BaseQuery<Employee> {

    private String userName;
    private String email;
    private Integer age1;
    private Integer age2;
    private Long departmentId;

    public Long getDepartmentId() {
        return departmentId;
    }

    public void setDepartmentId(Long departmentId) {
        this.departmentId = departmentId;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public Integer getAge1() {
        return age1;
    }

    public void setAge1(Integer age1) {
        this.age1 = age1;
    }

    public Integer getAge2() {
        return age2;
    }

    public void setAge2(Integer age2) {
        this.age2 = age2;
    }

    @Override
    public Specification getSpecification() {
//        String jpql = "select e from Employee e where e.department.id=?";
        return Specifications.<Employee>and()
                //第一个参数是布尔值：如果为true的时候才去拼接当前条件，为false就直接跳过
                .like(StringUtils.isNotBlank(userName),"userName", "%"+userName+"%")
                .like(StringUtils.isNotBlank(email),"email", "%"+email+"%")
                .ge(null!=age1&&age1>0,"age",age1)
                .le(null!=age2&&age2>0,"age",age2)
                .eq(null!=departmentId&&departmentId>0,"department.id",departmentId)
                .build();
    }

    @Override
    public Pageable getPageable() {
        Pageable pageable = new PageRequest(getJpaPageNo(), getPageSize(), getSort());
        return pageable;
    }

    @Override
    public Sort getSort() {
        Sort.Direction direction = Sort.Direction.ASC;
        if(getOrderType().equalsIgnoreCase("desc")){
            direction = Sort.Direction.DESC;
        }
        Sort sort = new Sort(new Sort.Order(direction, getOrderProperty()));
        return sort;
    }
}
