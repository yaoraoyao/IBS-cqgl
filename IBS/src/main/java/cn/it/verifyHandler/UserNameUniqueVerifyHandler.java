package cn.it.verifyHandler;

import cn.afterturn.easypoi.excel.entity.result.ExcelVerifyHandlerResult;
import cn.afterturn.easypoi.handler.inter.IExcelVerifyHandler;
import cn.it.domain.Employee;
import cn.it.service.IEmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class UserNameUniqueVerifyHandler implements IExcelVerifyHandler<Employee> {
    @Autowired
    private IEmployeeService employeeService;

    @Override
    public ExcelVerifyHandlerResult verifyHandler(Employee employee) {
        ExcelVerifyHandlerResult result = new ExcelVerifyHandlerResult(true);
        if (employee.getId()!=null){
            Employee one = employeeService.findOne(employee.getId());
            if (one.getUserName().equals(employee.getUserName())){
                return result;
            }
            result.setSuccess(false);
            result.setMsg("该用户名已经存在");
            return result;
        }
        result.setSuccess(employeeService.findByUsername(employee.getUserName())==null);
        result.setMsg("该用户名已经存在");
        return result;
    }
}
