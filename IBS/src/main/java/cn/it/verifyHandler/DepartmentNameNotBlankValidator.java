package cn.it.verifyHandler;

import cn.it.domain.Department;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Component;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

@Component
public class DepartmentNameNotBlankValidator implements ConstraintValidator<DepartmentNameNotBlank,Object> {
    @Override
    public void initialize(DepartmentNameNotBlank departmentNameNotBlank) {

    }

    @Override
    public boolean isValid(Object o, ConstraintValidatorContext constraintValidatorContext) {
        if (!o.getClass().equals(Department.class)){
            return true;
        }
        Department department = (Department) o;
        if (department==null ||department.getId()!=null){
            return true;
        }
        return StringUtils.isNotBlank(department.getName());
    }
}
