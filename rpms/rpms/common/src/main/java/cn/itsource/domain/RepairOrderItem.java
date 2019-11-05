package cn.itsource.domain;

import java.math.BigDecimal;

public class RepairOrderItem {
    /**维修明细单号*/
    private Long id;
    /**维修工单号*/
    private Long mainid;
    /**维修员*/
    private Employee optid;
    /**维修配件*/
    private Long pid;
    /**配件价格*/
    private BigDecimal amt1;
    /**工时费*/
    private BigDecimal amt2;
    /**配件数量*/
    private BigDecimal num;
    /**总金额*/
    private BigDecimal totalamt;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getMainid() {
        return mainid;
    }

    public void setMainid(Long mainid) {
        this.mainid = mainid;
    }

    public Employee getOptid() {
        return optid;
    }

    public void setOptid(Employee optid) {
        this.optid = optid;
    }

    public Long getPid() {
        return pid;
    }

    public void setPid(Long pid) {
        this.pid = pid;
    }

    public BigDecimal getAmt1() {
        return amt1;
    }

    public void setAmt1(BigDecimal amt1) {
        this.amt1 = amt1;
    }

    public BigDecimal getAmt2() {
        return amt2;
    }

    public void setAmt2(BigDecimal amt2) {
        this.amt2 = amt2;
    }

    public BigDecimal getNum() {
        return num;
    }

    public void setNum(BigDecimal num) {
        this.num = num;
    }

    public BigDecimal getTotalamt() {
        return totalamt;
    }

    public void setTotalamt(BigDecimal totalamt) {
        this.totalamt = totalamt;
    }

    @Override
    public String toString() {
        return "RepairOrderItem{" +
                "id=" + id +
                ", mainid=" + mainid +
                ", opid=" + optid +
                ", pid=" + pid +
                ", amt1=" + amt1 +
                ", amt2=" + amt2 +
                ", num=" + num +
                ", totalamt=" + totalamt +
                '}';
    }
}
