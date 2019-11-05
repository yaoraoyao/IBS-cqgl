package cn.it.controller;

import cn.it.domain.Stockincomebill;
import cn.it.domain.Stockincomebillitem;
import cn.it.query.StockincomebillQuery;
import cn.it.service.IStockincomebillService;
import cn.it.utils.PageList;
import cn.it.utils.Result;
import cn.it.utils.ShiroSessionUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/stockincomebill")
public class StockincomebillController {

    @Autowired
    private IStockincomebillService stockincomebillService;

    @RequestMapping("/index")
    public String index() {
        return "stockincomebill";
    }

    @ResponseBody
    @RequestMapping("/list")
    public PageList<Stockincomebill> page(StockincomebillQuery stockincomebillQuery) {
        return stockincomebillService.findAll(stockincomebillQuery);
    }

    @ResponseBody
    @RequestMapping("/save")
    public Result save(Stockincomebill stockincomebill) {
        stockincomebill.setInputUser(ShiroSessionUtils.getUser());
        //定义两个BigDecimal用来统计采购单总金额和总数量
        BigDecimal totalAmount = new BigDecimal(0);
        BigDecimal totalNum = new BigDecimal(0);
        //确保采购单明细能够找到采购单对象
        List<Stockincomebillitem> list = stockincomebill.getBillItems();
        for (Stockincomebillitem item : list) {
            item.setBill(stockincomebill);
            //计算采购单明细小计金额
            item.setAmount(item.getPrice().multiply(item.getNum()));
            //累加总金额和总数量
            totalAmount = totalAmount.add(item.getAmount());
            totalNum = totalNum.add(item.getNum());
        }
        //设置总金额和总数量
        stockincomebill.setTotalAmount(totalAmount);
        stockincomebill.setTotalNum(totalNum);
        stockincomebillService.save(stockincomebill);
        Result result = null;
        try {
            if (stockincomebill.getId() != null && stockincomebill.getId() > 0)
                result = new Result(200, "编辑成功！");
            else
                result = new Result(200, "新增成功！");
            stockincomebillService.save(stockincomebill);
        } catch (Exception e) {
            e.printStackTrace();
            result = new Result(500, "操作失败：" + e.getMessage());
        }
        return result;
    }

    @ResponseBody
    @RequestMapping("/findOne")
    public Stockincomebill findOne(Long id) {
        return stockincomebillService.findOne(id);
    }

    @ResponseBody
    @RequestMapping("/delete")
    public Result delete(String ids) {
        try {
            stockincomebillService.delete(ids);
            return new Result(200, "删除成功！");
        } catch (Exception e) {
            e.printStackTrace();
            return new Result(500, "删除失败：" + e.getMessage());
        }
    }

    @ResponseBody
    @RequestMapping("/audite")
    public Result audite(Long id) {
        try {
            stockincomebillService.audite(id);
        } catch (Exception e) {
            e.printStackTrace();
            return new Result(500, "审核失败-原因是：" + e.getMessage());
        }
        return new Result(200, "审核成功！");
    }
}