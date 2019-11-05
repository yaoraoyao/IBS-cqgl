package cn.itsource.domain;

import java.util.ArrayList;
import java.util.List;

public class Menu {

    private Long id;
    /*菜单名称*/
    private String label;
    /*地址*/
    private String url;
    /*图标*/
    private String icon;
    /*上级菜单*/
    private Long parent_id;

    private List<Menu> children = new ArrayList<>();



    public List<Menu> getChildren() {
        return children;
    }

    public void setChildren(List<Menu> children) {
        this.children = children;
    }

    @Override
    public String toString() {
        return "Menu{" +
                "id=" + id +
                ", label='" + label + '\'' +
                ", url='" + url + '\'' +
                ", icon='" + icon + '\'' +
                ", parent_id=" + parent_id +
                ", children=" + children +
                '}';
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getLabel() {
        return label;
    }

    public void setLabel(String label) {
        this.label = label;
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

    public Long getParent_id() {
        return parent_id;
    }

    public void setParent_id(Long parent_id) {
        this.parent_id = parent_id;
    }
}
