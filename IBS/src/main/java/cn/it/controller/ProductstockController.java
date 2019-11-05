package cn.it.controller;

import cn.it.domain.Productstock;
import cn.it.query.ProductstockQuery;
import cn.it.service.IProductstockService;
import cn.it.utils.PageList;
import cn.it.utils.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("/productstock")
public class ProductstockController{

    @Autowired
    private IProductstockService productstockService;

    @RequestMapping("/index")
    public String index(){
        return "productstock";
    }

    @ResponseBody
    @RequestMapping("/list")
    public PageList<Productstock> page (ProductstockQuery productstockQuery){
        return productstockService.findAll(productstockQuery);
    }

    @ResponseBody
    @RequestMapping("/save")
    public Result save(Productstock productstock){
        Result result = null;
        try {
            if(productstock.getId() != null && productstock.getId() > 0)
                result = new Result(200,"编辑成功！");
            else
                result = new Result(200,"新增成功！");
            productstockService.save(productstock);
        } catch (Exception e) {
            e.printStackTrace();
            result = new Result(500,"操作失败：" + e.getMessage());
        }
        return result;
    }

    @ResponseBody
    @RequestMapping("/findOne")
    public Productstock findOne(Long id){
        return productstockService.findOne(id);
    }

    @ResponseBody
    @RequestMapping("/delete")
    public Result delete(String ids){
        try {
            productstockService.delete(ids);
            return new Result(200,"删除成功！");
        } catch (Exception e) {
            e.printStackTrace();
            return new Result(500,"删除失败：" + e.getMessage());
        }
    }
}