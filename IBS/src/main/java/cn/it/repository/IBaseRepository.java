package cn.it.repository;

import cn.it.query.BaseQuery;
import com.sun.xml.internal.bind.v2.model.core.ID;
import org.springframework.data.domain.Page;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.NoRepositoryBean;

import java.io.Serializable;
import java.util.List;

@NoRepositoryBean
public interface IBaseRepository<T,ID extends Serializable> extends JpaRepository<T,ID>,JpaSpecificationExecutor<T> {
    /**
     * 根据Query拿到分页对象(分页)
     * @param baseQuery
     * @return
     */
    Page findPageByQuery(BaseQuery baseQuery);

    /**
     * 根据Query拿到对应的所有数据(不分页)
     * @param baseQuery
     * @return
     */
    List<T> findByQuery(BaseQuery baseQuery);

    /**
     * 根据jpql与对应的参数拿到数据 jpql: select .. where a = ? and b=?   values:问号的值
     * @param jpql
     * @param values
     * @return
     */
    List findByJpql(String jpql,Object... values);

    void delete(String ids);
}
