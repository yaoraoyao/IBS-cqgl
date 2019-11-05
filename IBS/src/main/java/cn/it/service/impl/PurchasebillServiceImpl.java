package cn.it.service.impl;

import cn.it.domain.Productstock;
import cn.it.domain.Purchasebill;
import cn.it.domain.Purchasebillitem;
import cn.it.domain.Stockincomebillitem;
import cn.it.repository.IProductstockRepository;
import cn.it.repository.IPurchasebillRepository;
import cn.it.service.IPurchasebillService;
import cn.it.utils.ShiroSessionUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

@Service
public class PurchasebillServiceImpl extends BaseServiceImpl<Purchasebill,Long> implements IPurchasebillService {

    @Autowired
    private IPurchasebillRepository purchasebillRepository;
    @Autowired
    private IProductstockRepository productstockRepository;
    
    @Override
    @Transactional
    public void delete(String ids) {
        purchasebillRepository.delete(ids);
    }

    @Override
    @Transactional
    public void audite(Long id) {
        Purchasebill purchasebill = purchasebillRepository.findOne(id);
        if(null == purchasebill){
            throw new RuntimeException("该采购单不存在！");
        }
        if(purchasebill.getStatus() != 0){
            throw new RuntimeException("只有待审的订单的才可以审核！");
        }
        purchasebill.setStatus(1);
        purchasebill.setAuditor(ShiroSessionUtils.getUser());
        purchasebill.setAuditortime(new Date());
        super.save(purchasebill);
    }
}