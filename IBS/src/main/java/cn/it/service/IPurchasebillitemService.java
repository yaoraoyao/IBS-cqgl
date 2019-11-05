package cn.it.service;

import cn.it.domain.Purchasebillitem;
import cn.it.domain.PurchasebillitemVo;
import cn.it.query.PurchasebillitemQuery;

import java.util.List;
import java.util.Map;

public interface IPurchasebillitemService extends IBaseService<Purchasebillitem,Long> {
    void delete(String ids);
    /**
     * 查询报表数据【支持高级查询】
     * @param query
     * @return
     */
    List<PurchasebillitemVo> findData(PurchasebillitemQuery query);

    /**
     * 查询图表数据【支持高级查询】
     * @param query
     * @return
     */
    List<Map<String, Object>> find3DData(PurchasebillitemQuery query);
}