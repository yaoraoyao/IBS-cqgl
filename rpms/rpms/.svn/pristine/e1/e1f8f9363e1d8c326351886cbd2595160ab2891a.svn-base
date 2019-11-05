package cn.itsource.domain;

import com.fasterxml.jackson.annotation.JsonFormat;
import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serializable;
import java.util.Date;

public class Employee implements Serializable {

    private Long id;
    /*维修员名称*/
    private String username;
    private String password;
    private Integer age;
    private String email;

    /*维修员雇佣日期*/
    private Date Hiredate;

    private Long departmentId;


    public Employee() {

    }


    public String getUsername() {

        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Long getId() {

        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }


    public Integer getAge() {
        return age;
    }

    public void setAge(Integer age) {
        this.age = age;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    @JsonFormat(pattern = "yyyy-MM-dd",timezone = "GMT+8")
    public Date getHiredate() {
        return Hiredate;
    }

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    public void setHiredate(Date hiredate) {
        Hiredate = hiredate;
    }

    public Long getDepartmentId() {
        return departmentId;
    }

    public void setDepartmentId(Long departmentId) {
        this.departmentId = departmentId;
    }

}
