package cn.it.repository;
import cn.it.domain.Menu;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface IMenuRepository extends IBaseRepository<Menu,Long>{
    @Query("select distinct m from Employee e join e.roles r join r.permissions p join p.menu m where e.id = ?1")
    List<Menu> findByLoginUser(Long userId);
    List<Menu> findByParentIsNotNull();
    List<Menu> findByParentIsNull();
}