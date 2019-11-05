package cn.it.domain;





import java.math.BigDecimal;
import javax.persistence.Entity;
import javax.persistence.Table;
/**
 * (Depot)实体类
 *
 * @author 阴俊池
 * @since 2019-08-28 17:49:48
 */
@Entity
@Table(name="depot")
public class Depot extends BaseDomain {
    private String name;
    private BigDecimal maxcapacity;
    private BigDecimal currentcapacity;
    private BigDecimal totalamount;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public BigDecimal getMaxcapacity() {
        return maxcapacity;
    }

    public void setMaxcapacity(BigDecimal maxcapacity) {
        this.maxcapacity = maxcapacity;
    }

    public BigDecimal getCurrentcapacity() {
        return currentcapacity;
    }

    public void setCurrentcapacity(BigDecimal currentcapacity) {
        this.currentcapacity = currentcapacity;
    }

    public BigDecimal getTotalamount() {
        return totalamount;
    }

    public void setTotalamount(BigDecimal totalamount) {
        this.totalamount = totalamount;
    }
}