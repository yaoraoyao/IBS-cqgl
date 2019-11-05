package cn.it.domain;



import javax.persistence.Entity;
import javax.persistence.Table;
/**
 * (Systemdictionarytype)实体类
 *
 * @author 阴俊池
 * @since 2019-08-24 11:10:13
 */
@Entity
@Table(name="systemdictionarytype")
public class Systemdictionarytype extends BaseDomain {
    private String sn;
    private String name;

    public String getSn() {
        return sn;
    }

    public void setSn(String sn) {
        this.sn = sn;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}