package cn.itsource.domain;

public class PayWay {
    private Long id;
    private String way;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getWay() {
        return way;
    }

    public void setWay(String way) {
        this.way = way;
    }

    @Override
    public String toString() {
        return "PayWay{" +
                "id=" + id +
                ", way='" + way + '\'' +
                '}';
    }
}
