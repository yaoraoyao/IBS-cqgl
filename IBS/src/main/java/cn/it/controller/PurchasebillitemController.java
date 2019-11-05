package cn.it.controller;

import cn.it.domain.Purchasebillitem;
import cn.it.domain.PurchasebillitemVo;
import cn.it.query.PurchasebillitemQuery;
import cn.it.service.IPurchasebillitemService;
import cn.it.utils.PageList;
import cn.it.utils.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/purchasebillitem")
public class PurchasebillitemController{

    @Autowired
    private IPurchasebillitemService purchasebillitemService;

    @RequestMapping("/index")
    public String index(){
        return "purchasebillitem";
    }

    @ResponseBody
    @RequestMapping("/list")
    public List<PurchasebillitemVo> page (PurchasebillitemQuery purchasebillitemQuery){
            return purchasebillitemService.findData(purchasebillitemQuery);
    }

    @ResponseBody
    @RequestMapping("/find3DData")
    public List<Map<String, Object>> find3DData(PurchasebillitemQuery query){
        return purchasebillitemService.find3DData(query);
    }

}