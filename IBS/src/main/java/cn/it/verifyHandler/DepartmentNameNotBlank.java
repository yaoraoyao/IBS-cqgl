package cn.it.verifyHandler;

import javax.validation.Constraint;
import javax.validation.Payload;
import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

@Target({ElementType.FIELD})
@Retention(RetentionPolicy.RUNTIME)
@Constraint(validatedBy = DepartmentNameNotBlankValidator.class)
public @interface DepartmentNameNotBlank {
    String message() default "关联的部门名称不能为空";

    Class<?>[] groups() default { };

    Class<? extends Payload>[] payload() default { };
}
