package cn.it.controller;

import cn.it.domain.Depot;
import cn.it.query.DepotQuery;
import cn.it.service.IDepotService;
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
@RequestMapping("/depot")
public class DepotController{

    @Autowired
    private IDepotService depotService;

    @RequestMapping("/index")
    public String index(){
        return "depot";
    }

    @ResponseBody
    @RequestMapping("/list")
    public PageList<Depot> page (DepotQuery depotQuery){
        return depotService.findAll(depotQuery);
    }

    @ResponseBody
    @RequestMapping("/save")
    public Result save(Depot depot){
        Result result = null;
        try {
            if(depot.getId() != null && depot.getId() > 0)
                result = new Result(200,"编辑成功！");
            else
                result = new Result(200,"新增成功！");
            depotService.save(depot);
        } catch (Exception e) {
            e.printStackTrace();
            result = new Result(500,"操作失败：" + e.getMessage());
        }
        return result;
    }

    @ResponseBody
    @RequestMapping("/findOne")
    public Depot findOne(Long id){
        return depotService.findOne(id);
    }

    @ResponseBody
    @RequestMapping("/delete")
    public Result delete(String ids){
        try {
            depotService.delete(ids);
            return new Result(200,"删除成功！");
        } catch (Exception e) {
            e.printStackTrace();
            return new Result(500,"删除失败：" + e.getMessage());
        }
    }

    @ResponseBody
    @RequestMapping("/findAll")
    public List<Depot> findAll(DepotQuery depotQuery){
        return depotService.findRealAll(depotQuery);
    }
}