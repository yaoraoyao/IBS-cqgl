package cn.it.domain;











import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import org.springframework.format.annotation.DateTimeFormat;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.persistence.*;

/**
 * (Purchasebill)实体类
 *
 * @author 阴俊池
 * @since 2019-08-26 19:56:06
 */
@Entity
@Table(name="purchasebill")
public class Purchasebill extends BaseDomain {
    //采购日期 非空 前端录入采购单的时候用日期选择框
    private Date vdate;

    //总金额 非空 自动生成【录入采购单明细之后自动计算得来】
    private BigDecimal totalamount = new BigDecimal(0);

    //总数量 非空 自动生成【录入采购单明细之后自动计算得来】
    private BigDecimal totalnum = new BigDecimal(0);;

    //录入时间 非空 自动生成【直接取系统当前日期时间】
    private Date inputtime = new Date();

    //审核时间 可以为空 审核的时候字典获取系统当前日期时间
    private Date auditortime;

    //状态 0表示待审 1表示已审 -1表示作废 自动生成 录入的时候默认0
    private Integer status = 0;

    //供应商 非空 前端使用下拉框选择
    @ManyToOne(fetch = FetchType.LAZY,optional = false)
    @JoinColumn(name="supplier_id")
    @JsonIgnoreProperties(value={"hibernateLazyInitializer","handler","fieldHandler"})
    private Supplier supplier;

    //审核人 可以为空  审核的时候直接获取审核人的当前登录用户对象
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name="auditor_id")
    @JsonIgnoreProperties(value={"hibernateLazyInitializer","handler","fieldHandler"})
    private Employee auditor;

    //录入人 非空 直接获取录入人的当前登录用户对象
    @ManyToOne(fetch = FetchType.LAZY,optional = false)
    @JoinColumn(name="inputUser_id")
    @JsonIgnoreProperties(value={"hibernateLazyInitializer","handler","fieldHandler"})
    private Employee inputuser;

    //采购员 非空 前端使用下拉框选择
    @ManyToOne(fetch = FetchType.LAZY,optional = false)
    @JoinColumn(name="buyer_id")
    @JsonIgnoreProperties(value={"hibernateLazyInitializer","handler","fieldHandler"})
    private Employee buyer;

    /**
     * 组合关系【双向一对多/多对一 + 最强级联 + 孤儿清除】
     */
    @OneToMany(fetch = FetchType.LAZY,mappedBy = "bill",cascade = CascadeType.ALL,orphanRemoval = true)
    private List<Purchasebillitem> billItems = new ArrayList<>();

    public List<Purchasebillitem> getBillItems() {
        return billItems;
    }
    @JsonFormat(pattern = "yyyy-MM-dd",timezone = "GMT+8")
    public Date getVdate() {
        return vdate;
    }
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    public void setVdate(Date vdate) {
        this.vdate = vdate;
    }

    public BigDecimal getTotalamount() {
        return totalamount;
    }

    public void setTotalamount(BigDecimal totalamount) {
        this.totalamount = totalamount;
    }

    public BigDecimal getTotalnum() {
        return totalnum;
    }

    public void setTotalnum(BigDecimal totalnum) {
        this.totalnum = totalnum;
    }
    @JsonFormat(pattern = "yyyy-MM-dd",timezone = "GMT+8")
    public Date getInputtime() {
        return inputtime;
    }

    public void setInputtime(Date inputtime) {
        this.inputtime = inputtime;
    }
    @JsonFormat(pattern = "yyyy-MM-dd",timezone = "GMT+8")
    public Date getAuditortime() {
        return auditortime;
    }

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    public void setAuditortime(Date auditortime) {
        this.auditortime = auditortime;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Supplier getSupplier() {
        return supplier;
    }

    public void setSupplier(Supplier supplier) {
        this.supplier = supplier;
    }

    public Employee getAuditor() {
        return auditor;
    }

    public void setAuditor(Employee auditor) {
        this.auditor = auditor;
    }

    public Employee getInputuser() {
        return inputuser;
    }

    public void setInputuser(Employee inputuser) {
        this.inputuser = inputuser;
    }

    public Employee getBuyer() {
        return buyer;
    }

    public void setBuyer(Employee buyer) {
        this.buyer = buyer;
    }

    public void setBillItems(List<Purchasebillitem> billItems) {
        this.billItems = billItems;
    }
    @Override
    public String toString() {
        return "Purchasebill{" +
                "vdate=" + vdate +
                ", totalamount=" + totalamount +
                ", totalnum=" + totalnum +
                ", inputtime=" + inputtime +
                ", auditortime=" + auditortime +
                ", status=" + status +
                ", supplier=" + supplier +
                ", id=" + id +
                '}';
    }
}