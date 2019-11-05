package cn.it.domain;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import javax.persistence.*;

/**
 * (Permission)实体类
 *
 * @author 阴俊池
 * @since 2019-08-20 10:32:58
 */
@Entity
@Table(name="permission")
public class Permission extends BaseDomain {
    private String name;
    private String url;
    private String descs;
    private String sn;
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name="menu_id")
    private Menu menu;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getDescs() {
        return descs;
    }

    public void setDescs(String descs) {
        this.descs = descs;
    }

    public String getSn() {
        return sn;
    }

    public void setSn(String sn) {
        this.sn = sn;
    }

    public Menu getMenu() {
        return menu;
    }

    public void setMenu(Menu menu) {
        this.menu = menu;
    }

    @Override
    public String toString() {
        return "Permission{" +
                "name='" + name + '\'' +
                ", url='" + url + '\'' +
                ", descs='" + descs + '\'' +
                ", sn='" + sn + '\'' +
                ", id=" + id +
                '}';
    }
}