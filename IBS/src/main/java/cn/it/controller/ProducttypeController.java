package cn.it.controller;

import cn.it.domain.Producttype;
import cn.it.query.ProducttypeQuery;
import cn.it.service.IProducttypeService;
import cn.it.utils.PageList;
import cn.it.utils.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import java.util.List;

@Controller
@RequestMapping("/productType")
public class ProducttypeController{

    @Autowired
    private IProducttypeService producttypeService;

    @RequestMapping("/index")
    public String index(){
        return "producttype";
    }

    @ResponseBody
    @RequestMapping("/list")
    public PageList<Producttype> page (ProducttypeQuery producttypeQuery){
        return producttypeService.findAll(producttypeQuery);
    }

    @ResponseBody
    @RequestMapping("/save")
    public Result save(Producttype producttype){
        Result result = null;
        try {
            if(producttype.getId() != null && producttype.getId() > 0)
                result = new Result(200,"编辑成功！");
            else{
                result = new Result(200,"新增成功！");
                if (producttype.getParent()!=null && producttype.getParent().getId()==-1L){
                    producttype.setParent(null);
                }
            }
            producttypeService.save(producttype);
        } catch (Exception e) {
            e.printStackTrace();
            result = new Result(500,"操作失败：" + e.getMessage());
        }
        return result;
    }

    @ResponseBody
    @RequestMapping("/findOne")
    public Producttype findOne(Long id){
        return producttypeService.findOne(id);
    }

    @ResponseBody
    @RequestMapping("/delete")
    public Result delete(String ids){
        try {
            producttypeService.delete(ids);
            return new Result(200,"删除成功！");
        } catch (Exception e) {
            e.printStackTrace();
            return new Result(500,"删除失败：" + e.getMessage());
        }
    }

    @ResponseBody
    @RequestMapping("/parent")
    public List<Producttype> parent(){
        List<Producttype> list = producttypeService.findByParentIsNull();
        list.add(0,new Producttype("请选择父级类型",-1L));
        return list;
    }

    @ResponseBody
    @RequestMapping("/child")
    public List<Producttype> child(){
        List<Producttype> list = producttypeService.findByParentIsNotNull();
        return list;
    }
}