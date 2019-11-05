package cn.itsource.domain;

import com.fasterxml.jackson.annotation.JsonFormat;
import org.springframework.format.annotation.DateTimeFormat;

import java.math.BigDecimal;
import java.util.Date;

public class SettedBill {
    //结算单序号
    private Long id;
    //客户
    private String customer;
    //维修单序号
    private Long mainId;
    //生成日期
    private Date settedtime = new Date();
    //应付金额
    private BigDecimal reAmount;
    //实付金额
    private BigDecimal payAmount;
    //客户地址
    private String address;
    //支付方式
    private Long way;
    //结算单状态
    private Integer status =1;//默认为1
    //是否还车
    private String returnCar;

    public String getReturnCar() {
        return returnCar;
    }

    public void setReturnCar(String returnCar) {
        this.returnCar = returnCar;
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

    public Long getMainId() {
        return mainId;
    }

    public void setMainId(Long mainId) {
        this.mainId = mainId;
    }
    @JsonFormat(pattern = "yyyy-MM-dd",timezone = "GMT+8")
    public Date getSettedtime() {
        return settedtime;
    }
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    public void setSettedtime(Date settedtime) {
        this.settedtime = settedtime;
    }

    public BigDecimal getReAmount() {
        return reAmount;
    }

    public void setReAmount(BigDecimal reAmount) {
        this.reAmount = reAmount;
    }

    public BigDecimal getPayAmount() {
        return payAmount;
    }

    public void setPayAmount(BigDecimal payAmount) {
        this.payAmount = payAmount;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public Long getWay() {
        return way;
    }

    public void setWay(Long way) {
        this.way = way;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "SettedBill{" +
                "id=" + id +
                ", customer='" + customer + '\'' +
                ", mainId=" + mainId +
                ", settedtime=" + settedtime +
                ", reAmount=" + reAmount +
                ", payAmount=" + payAmount +
                ", address='" + address + '\'' +
                ", way=" + way +
                ", status=" + status +
                ", returnCar='" + returnCar + '\'' +
                '}';
    }
}
