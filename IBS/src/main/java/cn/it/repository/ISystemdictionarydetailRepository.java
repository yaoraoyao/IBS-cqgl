package cn.it.repository;
import cn.it.domain.Systemdictionarydetail;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface ISystemdictionarydetailRepository extends IBaseRepository<Systemdictionarydetail,Long>{
    @Query("select o from Systemdictionarydetail o where o.types.sn = ?1")
    List<Systemdictionarydetail>findBySn(String sn);
}