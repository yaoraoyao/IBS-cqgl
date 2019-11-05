package cn.it.domain;





import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

/**
 * (Menu)实体类
 *
 * @author 阴俊池
 * @since 2019-08-21 21:32:35
 */
@Entity
@Table(name="menu")
@JsonIgnoreProperties(value={"hibernateLazyInitializer","handler","fieldHandler"})
public class Menu extends BaseDomain {
    private String name;
    private String url;
    private String icon;
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name="parent_id")
    @JsonIgnore
    private Menu parent;
    @OneToMany(fetch = FetchType.LAZY,mappedBy = "parent")
    private List<Menu> children = new ArrayList<>();

    public Menu() {
    }

    public Menu(String name, Long id) {
        this.name = name;
        this.id = id;
    }

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

    public String getIcon() {
        return icon;
    }

    public void setIcon(String icon) {
        this.icon = icon;
    }

    public Menu getParent() {
        return parent;
    }

    public void setParent(Menu parent) {
        this.parent = parent;
    }

    public List<Menu> getChildren() {
        return children;
    }

    public void setChildren(List<Menu> children) {
        this.children = children;
    }

    @Override
    public String toString() {
        return "Menu{" +
                "name='" + name + '\'' +
                ", url='" + url + '\'' +
                ", icon='" + icon + '\'' +
//                ", parent=" + parent +
                ", id=" + id +
                '}';
    }

    public String getText(){ //EasyUI的树需要一个text属性
        return name;
    }

    public String getIconCls() {
        return icon;
    }

}