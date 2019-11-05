package cn.it.domain;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import java.math.BigDecimal;
import java.util.Date;
import javax.persistence.*;

/**
 * (Productstock)实体类
 *
 * @author 阴俊池
 * @since 2019-08-28 17:49:48
 */
@Entity
@Table(name="productstock")
public class Productstock extends BaseDomain {
    private BigDecimal num;// 当前仓库的产品的数量
    private BigDecimal amount;// 当前仓库的产品的小计
    private BigDecimal price;// 当前仓库的产品的价格
    private Date incomeDate;// 入库时间
    private Boolean warning = true;// 库存过多或者过少，过少自动发出库存预警
    private BigDecimal topNum = new BigDecimal(100);// 最大库存量
    private BigDecimal bottomNum = new BigDecimal(50);// 最小库存量

    //商品 多对一,非空 同时唯一(同一个产品，同一个仓库 -> 才进行累加)
    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "product_id")
    @JsonIgnoreProperties(value={"hibernateLazyInitializer","handler","fieldHandler"})
    private Product product;

    //仓库 多对一,非空
    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "depot_id")
    @JsonIgnoreProperties(value={"hibernateLazyInitializer","handler","fieldHandler"})
    private Depot depot;

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

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }
    @JsonFormat(pattern = "yyyy-MM-dd",timezone = "GMT+8")
    public Date getIncomeDate() {
        return incomeDate;
    }

    public void setIncomeDate(Date incomeDate) {
        this.incomeDate = incomeDate;
    }

    public Boolean getWarning() {
        return warning;
    }

    public void setWarning(Boolean warning) {
        this.warning = warning;
    }

    public BigDecimal getTopNum() {
        return topNum;
    }

    public void setTopNum(BigDecimal topNum) {
        this.topNum = topNum;
    }

    public BigDecimal getBottomNum() {
        return bottomNum;
    }

    public void setBottomNum(BigDecimal bottomNum) {
        this.bottomNum = bottomNum;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public Depot getDepot() {
        return depot;
    }

    public void setDepot(Depot depot) {
        this.depot = depot;
    }

    @Override
    public String toString() {
        return "Productstock{" +
                "num=" + num +
                ", amount=" + amount +
                ", price=" + price +
                ", incomeDate=" + incomeDate +
                ", warning=" + warning +
                ", topNum=" + topNum +
                ", bottomNum=" + bottomNum +
                ", id=" + id +
                '}';
    }
}