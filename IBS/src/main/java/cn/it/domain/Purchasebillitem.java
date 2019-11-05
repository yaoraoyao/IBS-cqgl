package cn.it.domain;







import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import java.math.BigDecimal;
import javax.persistence.*;

/**
 * (Purchasebillitem)实体类
 *
 * @author 阴俊池
 * @since 2019-08-26 19:56:07
 */
@Entity
@Table(name="purchasebillitem")
public class Purchasebillitem extends BaseDomain {
    //采购单价 非空 前端填写
    private BigDecimal price;

    //采购数量 非空 前端填写
    private BigDecimal num;

    //小计金额 非空 自动计算生成
    private BigDecimal amount;

    //备注 可以为空 前端填写
    private String descs;

    //商品 非空 前端使用下拉框选择
    @ManyToOne(fetch = FetchType.LAZY,optional = false)
    @JoinColumn(name="product_id")
    @JsonIgnoreProperties(value={"hibernateLazyInitializer","handler","fieldHandler"})
    private Product product;

    //采购单 非空 自动生成
    @ManyToOne(fetch = FetchType.LAZY,optional = false)
    @JoinColumn(name="bill_id")
    @JsonIgnore
    private Purchasebill bill;

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public BigDecimal getNum() {
        return num;
    }

    public void setNum(BigDecimal num) {
        this.num = num;
    }

    public BigDecimal getAmount() {
        return amount;
    }

    public void setAmount(BigDecimal amount) {
        this.amount = amount;
    }

    public String getDescs() {
        return descs;
    }

    public void setDescs(String descs) {
        this.descs = descs;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public Purchasebill getBill() {
        return bill;
    }

    public void setBill(Purchasebill bill) {
        this.bill = bill;
    }

    @Override
    public String toString() {
        return "Purchasebillitem{" +
                "price=" + price +
                ", num=" + num +
                ", amount=" + amount +
                ", descs='" + descs + '\'' +
                ", id=" + id +
                '}';
    }
}