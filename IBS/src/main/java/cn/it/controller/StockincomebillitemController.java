package cn.it.controller;

import cn.it.domain.Stockincomebillitem;
import cn.it.query.StockincomebillitemQuery;
import cn.it.service.IStockincomebillitemService;
import cn.it.utils.PageList;
import cn.it.utils.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("/stockincomebillitem")
public class StockincomebillitemController{

    @Autowired
    private IStockincomebillitemService stockincomebillitemService;

    @RequestMapping("/index")
    public String index(){
        return "stockincomebillitem";
    }

    @ResponseBody
    @RequestMapping("/list")
    public PageList<Stockincomebillitem> page (StockincomebillitemQuery stockincomebillitemQuery){
        return stockincomebillitemService.findAll(stockincomebillitemQuery);
    }

    @ResponseBody
    @RequestMapping("/save")
    public Result save(Stockincomebillitem stockincomebillitem){
        Result result = null;
        try {
            if(stockincomebillitem.getId() != null && stockincomebillitem.getId() > 0)
                result = new Result(200,"编辑成功！");
            else
                result = new Result(200,"新增成功！");
            stockincomebillitemService.save(stockincomebillitem);
        } catch (Exception e) {
            e.printStackTrace();
            result = new Result(500,"操作失败：" + e.getMessage());
        }
        return result;
    }

    @ResponseBody
    @RequestMapping("/findOne")
    public Stockincomebillitem findOne(Long id){
        return stockincomebillitemService.findOne(id);
    }

    @ResponseBody
    @RequestMapping("/delete")
    public Result delete(String ids){
        try {
            stockincomebillitemService.delete(ids);
            return new Result(200,"删除成功！");
        } catch (Exception e) {
            e.printStackTrace();
            return new Result(500,"删除失败：" + e.getMessage());
        }
    }
}