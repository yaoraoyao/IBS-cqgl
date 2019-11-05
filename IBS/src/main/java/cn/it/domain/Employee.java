package cn.it.domain;

import cn.afterturn.easypoi.excel.annotation.Excel;
import cn.afterturn.easypoi.excel.annotation.ExcelEntity;
import cn.it.verifyHandler.DepartmentNameNotBlank;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import org.hibernate.validator.constraints.NotBlank;

import javax.persistence.*;
import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "employee")
public class Employee extends BaseDomain{
    @Excel(name="用户名")
    @NotBlank(message = "用户名不能为空")
    private String userName;
    @Excel(name="密码",width = 40)
    private String password;
    @Excel(name="邮箱",width = 30)
    @NotBlank(message = "邮箱不能为空")
    private String email;
    @Excel(name="头像",type=2,width = 10,height = 20, savePath = "D:/software/IdeaProjects/IBS/target/IBS/img")
    private String headImage;
    @Excel(name="年龄")
    @Max(value = 60, message = "年龄不能超过60岁")
    @Min(value = 18, message = "年龄不能低于18岁")
    private Integer age;
    @ManyToOne(fetch = FetchType.LAZY)
    @JsonIgnoreProperties(value={"hibernateLazyInitializer","handler","fieldHandler"})
    @ExcelEntity
    @DepartmentNameNotBlank
    private Department department;
    @ManyToMany(fetch = FetchType.LAZY)
    @JoinTable(name="employee_role",
            joinColumns = @JoinColumn(name="employee_id"),
            inverseJoinColumns = @JoinColumn(name="role_id"))
    @JsonIgnore
    private List<Role> roles = new ArrayList<>();

    public List<Role> getRoles() {
        return roles;
    }

    public void setRoles(List<Role> roles) {
        this.roles = roles;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getHeadImage() {
        return headImage;
    }

    public void setHeadImage(String headImage) {
        this.headImage = headImage;
    }

    public Integer getAge() {
        return age;
    }

    public void setAge(Integer age) {
        this.age = age;
    }

    public Department getDepartment() {
        return department;
    }

    public void setDepartment(Department department) {
        this.department = department;
    }

    @Override
    public String toString() {
        return "Employee{" +
                "id=" + this.getId() +
                ", userName='" + userName + '\'' +
                ", password='" + password + '\'' +
                ", email='" + email + '\'' +
                ", headImage='" + headImage + '\'' +
                ", age=" + age +
                '}';
    }
}
