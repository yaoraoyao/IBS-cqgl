package cn.it.query;
import java.math.BigDecimal;
import java.util.Date;

import cn.it.domain.Purchasebill;
import cn.it.domain.Stockincomebill;
import com.github.wenhao.jpa.Specifications;
import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.time.DateUtils;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.format.annotation.DateTimeFormat;

public class StockincomebillQuery extends BaseQuery<Stockincomebill> {

    private Date beginDate;
    private Date endDate;
    private Integer status;
    @Override
    public Specification getSpecification() {
        Date endDate2 = null;
        if(null != endDate){
            endDate2 = DateUtils.addDays(endDate, 1);
        }
        Specification<Purchasebill> specification = Specifications.<Purchasebill>and()
                .ge(null != beginDate, "vdate", beginDate)
                .lt(null != endDate2, "vdate", endDate2)
                .eq(null != status, "status", status)
                .build();
        return specification;
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