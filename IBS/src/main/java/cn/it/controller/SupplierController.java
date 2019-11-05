package cn.it.controller;

import cn.it.domain.Supplier;
import cn.it.query.SupplierQuery;
import cn.it.service.ISupplierService;
import cn.it.utils.PageList;
import cn.it.utils.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/supplier")
public class SupplierController{

    @Autowired
    private ISupplierService supplierService;

    @RequestMapping("/index")
    public String index(){
        return "supplier";
    }

    @ResponseBody
    @RequestMapping("/list")
    public PageList<Supplier> page (SupplierQuery supplierQuery){
        return supplierService.findAll(supplierQuery);
    }

    @ResponseBody
    @RequestMapping("/save")
    public Result save(Supplier supplier){
        Result result = null;
        try {
            if(supplier.getId() != null && supplier.getId() > 0)
                result = new Result(200,"编辑成功！");
            else
                result = new Result(200,"新增成功！");
            supplierService.save(supplier);
        } catch (Exception e) {
            e.printStackTrace();
            result = new Result(500,"操作失败：" + e.getMessage());
        }
        return result;
    }

    @ResponseBody
    @RequestMapping("/findOne")
    public Supplier findOne(Long id){
        return supplierService.findOne(id);
    }

    @ResponseBody
    @RequestMapping("/delete")
    public Result delete(String ids){
        try {
            supplierService.delete(ids);
            return new Result(200,"删除成功！");
        } catch (Exception e) {
            e.printStackTrace();
            return new Result(500,"删除失败：" + e.getMessage());
        }
    }

    @ResponseBody
    @RequestMapping("/findAll")
    public List<Supplier> findAll(SupplierQuery supplierQuery){
        return supplierService.findRealAll(supplierQuery);
    }

}