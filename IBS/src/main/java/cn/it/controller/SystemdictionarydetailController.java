package cn.it.controller;

import cn.it.domain.Systemdictionarydetail;
import cn.it.query.SystemdictionarydetailQuery;
import cn.it.service.ISystemdictionarydetailService;
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
@RequestMapping("/systemDictionaryDetail")
public class SystemdictionarydetailController{

    @Autowired
    private ISystemdictionarydetailService systemdictionarydetailService;

    @RequestMapping("/index")
    public String index(){
        return "systemdictionarydetail";
    }

    @ResponseBody
    @RequestMapping("/list")
    public PageList<Systemdictionarydetail> page (SystemdictionarydetailQuery systemdictionarydetailQuery){
        return systemdictionarydetailService.findAll(systemdictionarydetailQuery);
    }

    @ResponseBody
    @RequestMapping("/save")
    public Result save(Systemdictionarydetail systemdictionarydetail){
        Result result = null;
        try {
            if(systemdictionarydetail.getId() != null && systemdictionarydetail.getId() > 0)
                result = new Result(200,"编辑成功！");
            else
                result = new Result(200,"新增成功！");
            systemdictionarydetailService.save(systemdictionarydetail);
        } catch (Exception e) {
            e.printStackTrace();
            result = new Result(500,"操作失败：" + e.getMessage());
        }
        return result;
    }

    @ResponseBody
    @RequestMapping("/findOne")
    public Systemdictionarydetail findOne(Long id){
        return systemdictionarydetailService.findOne(id);
    }

    @ResponseBody
    @RequestMapping("/delete")
    public Result delete(String ids){
        try {
            systemdictionarydetailService.delete(ids);
            return new Result(200,"删除成功！");
        } catch (Exception e) {
            e.printStackTrace();
            return new Result(500,"删除失败：" + e.getMessage());
        }
    }
    /**
     * 查询所有的商品数量单位
     * @return
     */
    @ResponseBody
    @RequestMapping("/loadAllUnits")
    public List<Systemdictionarydetail> loadAllUnits(){
        return systemdictionarydetailService.findAllUnit("productUnit");
    }

    /**
     * 查询所有的商品品牌
     * @return
     */
    @ResponseBody
    @RequestMapping("/loadAllBrands")
    public List<Systemdictionarydetail> loadAllBrands(){
        return systemdictionarydetailService.findAllBrand("productBrand");
    }

}