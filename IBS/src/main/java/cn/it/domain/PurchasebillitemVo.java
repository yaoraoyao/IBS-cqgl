package cn.it.domain;

import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.time.DateUtils;

import java.math.BigDecimal;
import java.util.Calendar;
import java.util.Date;
import javax.persistence.Entity;
import javax.persistence.Table;
/**
 * VIEW(Purchasebillitemvo)实体类
 *
 * @author 阴俊池
 * @since 2019-08-27 10:50:33
 */

public class PurchasebillitemVo {
    private Long id;
    private String supplierName;
    private String buyerName;
    private String productName;
    private String productTypeName;
    private Date vdate;
    private BigDecimal num;
    private BigDecimal price;
    private BigDecimal amount;
    private Integer status;
    private String groupBy;

    public PurchasebillitemVo(Purchasebillitem item, String groupBy){
        this.id = item.getId();
        this.amount = item.getAmount();
        this.num = item.getNum();
        this.price = item.getPrice();
        this.vdate = item.getBill().getVdate();
        this.status = item.getBill().getStatus();
        this.supplierName = item.getBill().getSupplier().getName();
        this.buyerName = item.getBill().getBuyer().getUserName();
        this.productName = item.getProduct().getName();
        this.productTypeName = item.getProduct().getTypes().getName();
        //前端分组
        if("o.bill.supplier.name".equals(groupBy)){
            this.groupBy = supplierName;  //按供应商分组
        }else if("o.bill.buyer.username".equals(groupBy)){
            this.groupBy = buyerName;     //按采购员分组
        }else if("o.product.types.name".equals(groupBy)){
            this.groupBy = productTypeName;     //按商品类型分组
        }else{
            // DateUtils.toCalendar(vdate) 表示将vdate转化为Calendar日历对象
            // get(Calendar.YEAR)表示获取年份
            // get(Calendar.MONTH)表示获取月份(0~~11)  所以要加1
            this.groupBy = DateUtils.toCalendar(vdate).get(Calendar.YEAR) + "年"
                    +(DateUtils.toCalendar(vdate).get(Calendar.MONTH)+1) + "月";       //按月份分组
        }
    }

    public PurchasebillitemVo() {
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getSupplierName() {
        return supplierName;
    }

    public void setSupplierName(String supplierName) {
        this.supplierName = supplierName;
    }

    public String getBuyerName() {
        return buyerName;
    }

    public void setBuyerName(String buyerName) {
        this.buyerName = buyerName;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getProductTypeName() {
        return productTypeName;
    }

    public void setProductTypeName(String productTypeName) {
        this.productTypeName = productTypeName;
    }

    @JsonFormat(pattern = "yyyy-MM-dd",timezone = "GMT+8")
    public Date getVdate() {
        return vdate;
    }

    public void setVdate(Date vdate) {
        this.vdate = vdate;
    }

    public BigDecimal getNum() {
        return num;
    }

    public void setNum(BigDecimal num) {
        this.num = num;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public BigDecimal getAmount() {
        return amount;
    }

    public void setAmount(BigDecimal amount) {
        this.amount = amount;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public String getGroupBy() {
        return groupBy;
    }

    public void setGroupBy(String groupBy) {
        this.groupBy = groupBy;
    }

    @Override
    public String toString() {
        return "PurchasebillitemVo{" +
                "id=" + id +
                ", supplierName='" + supplierName + '\'' +
                ", buyerName='" + buyerName + '\'' +
                ", productName='" + productName + '\'' +
                ", productTypeName='" + productTypeName + '\'' +
                ", vdate=" + vdate +
                ", num=" + num +
                ", price=" + price +
                ", amount=" + amount +
                ", status=" + status +
                '}';
    }
}