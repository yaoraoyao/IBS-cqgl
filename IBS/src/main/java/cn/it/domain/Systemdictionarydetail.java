package cn.it.domain;



import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import javax.persistence.*;

/**
 * (Systemdictionarydetail)实体类
 *
 * @author 阴俊池
 * @since 2019-08-24 11:10:13
 */
@Entity
@Table(name="systemdictionarydetail")
public class Systemdictionarydetail extends BaseDomain {
    private String name;
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name="types_id")
    @JsonIgnoreProperties(value={"hibernateLazyInitializer","handler","fieldHandler"})
    private Systemdictionarytype types;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Systemdictionarytype getTypes() {
        return types;
    }

    public void setTypes(Systemdictionarytype types) {
        this.types = types;
    }
}