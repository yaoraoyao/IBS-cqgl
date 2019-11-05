package cn.it.domain;




import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import javax.persistence.*;

/**
 * (Producttype)实体类
 *
 * @author 阴俊池
 * @since 2019-08-24 11:10:13
 */
@Entity
@Table(name="producttype")
public class Producttype extends BaseDomain {
    private String name;
    private String descs;
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name="parent_id")
    @JsonIgnoreProperties(value={"hibernateLazyInitializer","handler","fieldHandler"})
    private Producttype parent;

    public Producttype() {
    }

    public Producttype(String name, Long id) {
        this.name = name;
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescs() {
        return descs;
    }

    public void setDescs(String descs) {
        this.descs = descs;
    }

    public Producttype getParent() {
        return parent;
    }

    public void setParent(Producttype parent) {
        this.parent = parent;
    }

    @Override
    public String toString() {
        return "Producttype{" +
                "name='" + name + '\'' +
                ", descs='" + descs + '\'' +
                ", parent=" + parent +
                ", id=" + id +
                '}';
    }
}