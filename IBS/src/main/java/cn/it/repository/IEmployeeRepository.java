package cn.it.repository;

import cn.it.domain.Employee;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface IEmployeeRepository extends IBaseRepository<Employee,Long> {
    Employee findByUserName(String username);
}

