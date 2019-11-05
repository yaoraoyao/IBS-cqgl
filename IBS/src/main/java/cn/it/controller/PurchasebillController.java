package cn.it.controller;

import cn.it.domain.Purchasebill;
import cn.it.domain.Purchasebillitem;
import cn.it.query.PurchasebillQuery;
import cn.it.service.IPurchasebillService;
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
@RequestMapping("/purchasebill")
public class PurchasebillController{

    @Autowired
    private IPurchasebillService purchasebillService;

    @RequestMapping("/index")
    public String index(){
        return "purchasebill";
    }

    @ResponseBody
    @RequestMapping("/list")
    public PageList<Purchasebill> page (PurchasebillQuery purchasebillQuery){
        return purchasebillService.findAll(purchasebillQuery);
    }

    @ResponseBody
    @RequestMapping("/save")
    public Result save(Purchasebill purchasebill){
        Result result = null;
        try {
            //inputuser不允许为空，这里直接获取录入人的当前登录用户对象
            purchasebill.setInputuser(ShiroSessionUtils.getUser());
            //定义两个BigDecimal用来统计采购单总金额和总数量
            BigDecimal totalAmount = new BigDecimal(0);
            BigDecimal totalNum = new BigDecimal(0);
            //确保采购单明细能够找到采购单对象
            List<Purchasebillitem> list = purchasebill.getBillItems();
            for (Purchasebillitem item : list) {
                item.setBill(purchasebill);
                //计算采购单明细小计金额
                item.setAmount(item.getPrice().multiply(item.getNum()));
                //累加总金额和总数量
                totalAmount = totalAmount.add(item.getAmount());
                totalNum = totalNum.add(item.getNum());
            }
            //设置总金额和总数量
            purchasebill.setTotalamount(totalAmount);
            purchasebill.setTotalnum(totalNum);
            if(purchasebill.getId() != null && purchasebill.getId() > 0)
                result = new Result(200,"编辑成功！");
            else{
                result = new Result(200,"新增成功！");
            }
            purchasebillService.save(purchasebill);
        } catch (Exception e) {
            e.printStackTrace();
            result = new Result(500,"操作失败：" + e.getMessage());
        }
        return result;
    }

    @ResponseBody
    @RequestMapping("/findOne")
    public Purchasebill findOne(Long id){
        return purchasebillService.findOne(id);
    }

    @ResponseBody
    @RequestMapping("/delete")
    public Result delete(String ids){
        try {
            purchasebillService.delete(ids);
            return new Result(200,"删除成功！");
        } catch (Exception e) {
            e.printStackTrace();
            return new Result(500,"删除失败：" + e.getMessage());
        }
    }

    @ResponseBody
    @RequestMapping("/audite")
    public Result audite(Long id) {
        try {
            purchasebillService.audite(id);
        } catch (Exception e) {
            e.printStackTrace();
            return new Result(500, "审核失败-原因是：" + e.getMessage());
        }
        return new Result(200, "审核成功！");
    }
}