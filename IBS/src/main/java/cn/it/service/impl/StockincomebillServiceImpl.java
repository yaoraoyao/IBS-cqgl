package cn.it.service.impl;

import cn.it.domain.*;
import cn.it.repository.IDepotRepository;
import cn.it.repository.IProductstockRepository;
import cn.it.repository.IStockincomebillRepository;
import cn.it.service.IDepotService;
import cn.it.service.IStockincomebillService;
import cn.it.utils.ShiroSessionUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

@Service
public class StockincomebillServiceImpl extends BaseServiceImpl<Stockincomebill,Long> implements IStockincomebillService {

    @Autowired
    private IStockincomebillRepository stockincomebillRepository;
    @Autowired
    private IProductstockRepository productstockRepository;

    @Override
    @Transactional
    public void delete(String ids) {
        stockincomebillRepository.delete(ids);
    }

    @Override
    @Transactional
    public void audite(Long id) {
        Stockincomebill bill = stockincomebillRepository.findOne(id);
        // ① 如果入库单不存在，就不允许审核
        if(null == bill){
            throw new RuntimeException("该入库单不存在！");
        }
        // ① 如果入库单的状态不是待审，就不允许审核
        if(bill.getStatus() != 0){
            throw new RuntimeException("只有待审的订单的才可以审核！");
        }

        // 入库单状态，审核人，审核时间
        bill.setStatus(1);
        bill.setAuditor(ShiroSessionUtils.getUser());
        bill.setAuditorTime(new Date());
        // 显示更新一下
        super.save(bill);

        // ② 获取当前入库单所包含的明细，用来查询库存表【判断】
        List<Stockincomebillitem> list = bill.getBillItems();
        String jpql = "select o from Productstock o where o.product.id=? and o.depot.id=?";
        for (Stockincomebillitem item : list) {
            //通过仓库和商品查询库存
            List<Productstock> productstockList = productstockRepository.findByJpql(jpql, item.getProduct().getId(), bill.getDepot().getId());
            // ③ 判断库存中(当前仓库)是否已经有当前商品
            if(productstockList != null && productstockList.size() == 1){
                //当前仓库中已有当前商品【直接修改库存数量、采购单价（加权平均法计算）、总金额、入库时间改为当前时间】
                Productstock productstock = productstockList.get(0);
                productstock.setNum(productstock.getNum().add(item.getNum()));          //修改库存数量
                productstock.setAmount(productstock.getAmount().add(item.getAmount())); //修改总金额
                productstock.setIncomeDate(new Date());                                 //修改入库时间
                productstock.setPrice(productstock.getAmount().divide(productstock.getNum(),2, BigDecimal.ROUND_HALF_UP));//修改单价【加权平均法】
                // 保存【脏数据更新：持久化对象修改了属性之后，事务提交时会自动更新】
                productstockRepository.save(productstock);
            }else{
                //当前仓库中没有当前商品
                Productstock productStock = new Productstock();
                // 小计
                productStock.setAmount(item.getAmount());
                // 仓库
                productStock.setDepot(bill.getDepot());
                // 入库时间
                productStock.setIncomeDate(new Date());
                // 入库数量
                productStock.setNum(item.getNum());
                // 入库价格
                productStock.setPrice(item.getPrice());
                // 入库产品
                productStock.setProduct(item.getProduct());
                // 保存
                productstockRepository.save(productStock);
            }
        }
    }
}