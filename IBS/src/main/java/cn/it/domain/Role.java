package cn.it.domain;



import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

/**
 * (Role)实体类
 *
 * @author 阴俊池
 * @since 2019-08-20 10:40:11
 */
@Entity
@Table(name="role")
public class Role extends BaseDomain {
    private String name;
    private String sn;

    @ManyToMany(fetch = FetchType.LAZY)
    @JoinTable(name="role_permission",
            joinColumns = @JoinColumn(name="role_id"),
            inverseJoinColumns = @JoinColumn(name="permission_id"))
    private List<Permission> permissions = new ArrayList<>();
    @ManyToMany(fetch = FetchType.LAZY,mappedBy = "roles")
    private List<Employee> employees = new ArrayList<>();

    public List<Employee> getEmployees() {
        return employees;
    }

    public void setEmployees(List<Employee> employees) {
        this.employees = employees;
    }

    public List<Permission> getPermissions() {
        return permissions;
    }

    public void setPermissions(List<Permission> permissions) {
        this.permissions = permissions;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSn() {
        return sn;
    }

    public void setSn(String sn) {
        this.sn = sn;
    }

    @Override
    public String toString() {
        return "Role{" +
                "name='" + name + '\'' +
                ", sn='" + sn + '\'' +
                ", permissions=" + permissions +
                ", id=" + id +
                '}';
    }
}