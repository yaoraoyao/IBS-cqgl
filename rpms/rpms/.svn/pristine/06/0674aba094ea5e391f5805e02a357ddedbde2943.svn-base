package cn.itsource.domain;

import com.fasterxml.jackson.annotation.JsonFormat;
import org.springframework.format.annotation.DateTimeFormat;

import java.math.BigDecimal;
import java.util.Date;


public class Part {
    private Long id;
    //配件名称
    private String name;
    //配件价格
    private BigDecimal price;
    //配件数量
    private Integer num;
    //配件预警数
    private Integer warnum;
    //配件描述
    private String context;
    //配件入库时间
    private Date createtime;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public Integer getNum() {
        return num;
    }

    public void setNum(Integer num) {
        this.num = num;
    }

    public Integer getWarnum() {
        return warnum;
    }

    public void setWarnum(Integer warnum) {
        this.warnum = warnum;
    }

    public String getContext() {
        return context;
    }

    public void setContext(String context) {
        this.context = context;
    }

    @JsonFormat(timezone = "GMT+8", pattern = "yyyy-MM-dd")
    public Date getCreatetime() {
        return createtime;
    }

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    public void setCreatetime(Date createtime) {
        this.createtime = createtime;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Override
    public String toString() {
        return "Part{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", price=" + price +
                ", num=" + num +
                ", warnum=" + warnum +
                ", context='" + context + '\'' +
                ", createtime=" + createtime +
                '}';
    }
}
