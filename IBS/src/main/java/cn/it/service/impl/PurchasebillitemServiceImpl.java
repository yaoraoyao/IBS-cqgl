package cn.it.service.impl;

import cn.it.domain.Purchasebillitem;
import cn.it.domain.PurchasebillitemVo;
import cn.it.query.PurchasebillitemQuery;
import cn.it.repository.IPurchasebillitemRepository;
import cn.it.service.IPurchasebillitemService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class PurchasebillitemServiceImpl extends BaseServiceImpl<Purchasebillitem,Long> implements IPurchasebillitemService {

    @Autowired
    private IPurchasebillitemRepository purchasebillitemRepository;
    
    @Override
    @Transactional
    public void delete(String ids) {
        purchasebillitemRepository.delete(ids);
    }

    @Override
    public List<PurchasebillitemVo> findData(PurchasebillitemQuery query) {
        List<PurchasebillitemVo> vo = new ArrayList<>();
        List<Purchasebillitem> list = purchasebillitemRepository.findByQuery(query);
        list.forEach(i-> {
            vo.add(new PurchasebillitemVo(i,query.getGroupBy()));
        });
        return vo;
    }

    @Override
    public List<Map<String, Object>> find3DData(PurchasebillitemQuery query) {
        List<Map<String, Object>> list = new ArrayList<>();
        String jpql = "select "+query.getGroupBy()+", sum(o.amount) from Purchasebillitem o " + query.getConditions() + " group by " + query.getGroupBy();
        List Data = purchasebillitemRepository.findByJpql(jpql, query.getParams().toArray());
        for (Object o : Data) {
            Object[] os = (Object[]) o;
            HashMap<String, Object> map = new HashMap<>();
            map.put("name", os[0]);
            map.put("y", os[1]);
            list.add(map);
        }
        return list;
    }
}