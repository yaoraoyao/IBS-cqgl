package cn.it.query;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import cn.it.domain.Purchasebillitem;
import com.github.wenhao.jpa.Specifications;
import org.apache.commons.lang3.time.DateUtils;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.format.annotation.DateTimeFormat;

public class PurchasebillitemQuery extends BaseQuery<Purchasebillitem> {

    private Date beginDate;
    private Date endDate;
    private Long buyerId;
    private Long supplierId;
    private Integer status;
    private String groupBy = "o.bill.supplier.name";

    @Override
    public Specification getSpecification(){
        Date endDate2 = null;
        if(null != endDate){
            endDate2 = DateUtils.addDays(endDate, 1);
        }
        Specification<Purchasebillitem> specification = Specifications.<Purchasebillitem>and()
                //第一个参数布尔值，表示为true的时候就拼接后面这个查询条件，为false的时候就不管
                .ge(null != beginDate,"bill.vdate", beginDate)
                .lt(null != endDate2,"bill.vdate", endDate2)
                .eq(null != status, "bill.status", status)
                .eq(buyerId!=null&&buyerId>0,"bill.buyer",buyerId)
                .eq(supplierId!=null&&supplierId>0,"bill.supplier",supplierId)
                //如果觉得高级查询的条件不够用，那你就自己添加吧....
                .build();
        System.out.println();
        return specification;
    }


    //用来存放执行JPQL语句时需要传入的参数值
    private List<Object> params = new ArrayList<>();
    /**
     * 获取JPQL语句的高级查询条件
     * @return
     */
    public String getConditions(){
        StringBuilder where = new StringBuilder();
        if(null != beginDate){
            where.append(" and o.bill.vdate >= ?");
            params.add(beginDate);
        }
        if(null != endDate){
            Date endDate2 = DateUtils.addDays(endDate, 1);
            where.append(" and o.bill.vdate < ?");
            params.add(endDate2);
        }
        if(null != status){
            where.append(" and o.bill.status = ?");
            params.add(status);
        }
        if(null != buyerId){
            where.append(" and o.bill.buyer.id = ?");
            params.add(buyerId);
        }
        if(null != supplierId){
            where.append(" and o.bill.supplier.id = ?");
            params.add(supplierId);
        }
        return where.toString().replaceFirst("and", "where");
    }

    public List<Object> getParams() {
        return params;
    }

    public void setParams(List<Object> params) {
        this.params = params;
    }

    public Date getBeginDate() {
        return beginDate;
    }
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    public void setBeginDate(Date beginDate) {
        this.beginDate = beginDate;
    }

    public Date getEndDate() {
        return endDate;
    }
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    public void setEndDate(Date endDate) {
        this.endDate = endDate;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Long getBuyerId() {
        return buyerId;
    }

    public void setBuyerId(Long buyerId) {
        this.buyerId = buyerId;
    }

    public Long getSupplierId() {
        return supplierId;
    }

    public void setSupplierId(Long supplierId) {
        this.supplierId = supplierId;
    }

    public String getGroupBy() {
        return groupBy;
    }

    public void setGroupBy(String groupBy) {
        this.groupBy = groupBy;
    }
    
    @Override
    public Pageable getPageable() {
        Pageable pageable = new PageRequest(getJpaPageNo(), getPageSize(), getSort());
        return pageable;
    }

    @Override
    public Sort getSort() {
        Sort.Direction direction = Sort.Direction.ASC;
        if(getOrderType().equalsIgnoreCase("desc")){
            direction = Sort.Direction.DESC;
        }
        Sort sort = new Sort(new Sort.Order(direction, getOrderProperty()));
        return sort;
    }
}