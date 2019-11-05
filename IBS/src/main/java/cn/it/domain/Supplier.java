package cn.it.domain;


import javax.persistence.Entity;
import javax.persistence.Table;
/**
 * (Supplier)实体类
 *
 * @author 阴俊池
 * @since 2019-08-26 19:56:07
 */
@Entity
@Table(name="supplier")
public class Supplier extends BaseDomain {
    private String name;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}