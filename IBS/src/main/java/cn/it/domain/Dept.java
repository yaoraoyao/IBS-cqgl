package cn.it.domain;


import javax.persistence.Entity;
import javax.persistence.Table;
/**
 * (Dept)实体类
 *
 * @author 阴俊池
 * @since 2019-08-16 19:38:48
 */
@Entity
@Table(name="dept")
public class Dept extends BaseDomain {
    private String name;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}