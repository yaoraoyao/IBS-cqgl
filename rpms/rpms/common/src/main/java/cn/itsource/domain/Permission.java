package cn.itsource.domain;

public class Permission {

    private Long id;
    private String name;
    private String resource;
    private String sn;
    private Long menu_id;

    @Override
    public String toString() {
        return "Permission{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", resource='" + resource + '\'' +
                ", sn='" + sn + '\'' +
                ", menu_id=" + menu_id +
                '}';
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getResource() {
        return resource;
    }

    public void setResource(String resource) {
        this.resource = resource;
    }

    public String getSn() {
        return sn;
    }

    public void setSn(String sn) {
        this.sn = sn;
    }

    public Long getMenu_id() {
        return menu_id;
    }

    public void setMenu_id(Long menu_id) {
        this.menu_id = menu_id;
    }

    public Permission() {

    }

    public Permission(Long id, String name, String resource, String sn, Long menu_id) {

        this.id = id;
        this.name = name;
        this.resource = resource;
        this.sn = sn;
        this.menu_id = menu_id;
    }
}
