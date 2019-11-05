package cn.it.service.impl;

import cn.it.domain.Stockincomebillitem;
import cn.it.repository.IStockincomebillitemRepository;
import cn.it.service.IStockincomebillitemService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class StockincomebillitemServiceImpl extends BaseServiceImpl<Stockincomebillitem,Long> implements IStockincomebillitemService {

    @Autowired
    private IStockincomebillitemRepository stockincomebillitemRepository;
    
    @Override
    @Transactional
    public void delete(String ids) {
        stockincomebillitemRepository.delete(ids);
    }
}