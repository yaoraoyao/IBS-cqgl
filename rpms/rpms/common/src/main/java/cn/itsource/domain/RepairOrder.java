package cn.itsource.domain;

import com.fasterxml.jackson.annotation.JsonFormat;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class RepairOrder {
    //为维修工单号
    private Long id;
    //客户名称
    private String customer;
    //车牌号
    private String carnum;
    //维修单创建时间
    private Date createtime =new Date();

    //维修单状态
    private Integer status;

    //维修人员
    private Employee optId ;

    //客户地址
    private String address;
    //维修单明细
    private List<RepairOrderItem> items = new ArrayList<>();

    public List<RepairOrderItem> getItems() {
        return items;
    }

    public void setItems(List<RepairOrderItem> items) {
        this.items = items;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getCustomer() {
        return customer;
    }

    public void setCustomer(String customer) {
        this.customer = customer;
    }

    public String getCarnum() {
        return carnum;
    }

    public void setCarnum(String carnum) {
        this.carnum = carnum;
    }

    @JsonFormat(pattern = "yyyy-MM-dd",timezone = "GMT+8")
    public Date getCreatetime() {
        return createtime;
    }
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    public void setCreatetime(Date createtime) {
        this.createtime = createtime;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Employee getOptId() {
        return optId;
    }

    public void setOptId(Employee optId) {
        this.optId = optId;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    @Override
    public String toString() {
        return "RepairOrder{" +
                "id=" + id +
                ", custormer='" + customer + '\'' +
                ", carnum='" + carnum + '\'' +
                ", createtime=" + createtime +
                ", status=" + status +
                ", optId='" + optId.getId() + '\'' +
                ", address='" + address + '\'' +
                '}';
    }
}
