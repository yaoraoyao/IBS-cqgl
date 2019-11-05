package cn.it.domain;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import java.math.BigDecimal;
import javax.persistence.*;

/**
 * (入库订单明细)实体类
 *
 * @author 阴俊池
 * @since 2019-08-28 17:49:48
 */
@Entity
@Table(name="stockincomebillitem")
public class Stockincomebillitem extends BaseDomain {
    private BigDecimal price;
    private BigDecimal num;
    private BigDecimal amount;
    private String descs;
    //商品 多对一,非空
    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "product_id")
    @JsonIgnoreProperties(value={"hibernateLazyInitializer","handler","fieldHandler"})
    private Product product;

    //入库单 组合关系,非空
    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "bill_id")
    @JsonIgnore
    private Stockincomebill bill;

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

    public Stockincomebill getBill() {
        return bill;
    }

    public void setBill(Stockincomebill bill) {
        this.bill = bill;
    }
}