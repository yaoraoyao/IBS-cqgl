package cn.it.repository;
import cn.it.domain.Permission;
import org.springframework.data.jpa.repository.Query;

import java.util.Set;

public interface IPermissionRepository extends IBaseRepository<Permission,Long>{

    @Query("select distinct p.sn from Employee e join e.roles r join r.permissions p where e.id = ?1")
    Set<String> findSnByEmp(Long employeeId);

}