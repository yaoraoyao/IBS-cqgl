package cn.it.service.impl;

import cn.it.domain.Employee;
import cn.it.repository.IDepartmentRepository;
import cn.it.repository.IEmployeeRepository;
import cn.it.service.IEmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class EmployeeServiceImpl extends BaseServiceImpl<Employee,Long> implements IEmployeeService{

    @Autowired
    private IEmployeeRepository employeeRepository;

    @Override
    @Transactional
    public void delete(String ids) {
        employeeRepository.delete(ids);
    }

    @Override
    public Employee findByUsername(String username) {
        return employeeRepository.findByUserName(username);
    }
    @Override
    public List<Employee> findAllBuyer() {
        String jpql = "select o from Employee o where o.department.name = ?";
        return employeeRepository.findByJpql(jpql, "采购部");
    }
    @Override
    public List<Employee> findAllKeeper() {
        String jpql = "select o from Employee o where o.department.name = ?";
        return employeeRepository.findByJpql(jpql, "仓管部");
    }
}
