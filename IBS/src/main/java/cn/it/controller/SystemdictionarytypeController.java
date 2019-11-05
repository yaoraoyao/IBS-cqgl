package cn.it.controller;

import cn.it.domain.Systemdictionarytype;
import cn.it.query.SystemdictionarytypeQuery;
import cn.it.service.ISystemdictionarytypeService;
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
@RequestMapping("/systemDictionaryType")
public class SystemdictionarytypeController{

    @Autowired
    private ISystemdictionarytypeService systemdictionarytypeService;

    @RequestMapping("/index")
    public String index(){
        return "systemdictionarytype";
    }

    @ResponseBody
    @RequestMapping("/list")
    public PageList<Systemdictionarytype> page (SystemdictionarytypeQuery systemdictionarytypeQuery){
        return systemdictionarytypeService.findAll(systemdictionarytypeQuery);
    }

    @ResponseBody
    @RequestMapping("/save")
    public Result save(Systemdictionarytype systemdictionarytype){
        Result result = null;
        try {
            if(systemdictionarytype.getId() != null && systemdictionarytype.getId() > 0)
                result = new Result(200,"编辑成功！");
            else
                result = new Result(200,"新增成功！");
            systemdictionarytypeService.save(systemdictionarytype);
        } catch (Exception e) {
            e.printStackTrace();
            result = new Result(500,"操作失败：" + e.getMessage());
        }
        return result;
    }

    @ResponseBody
    @RequestMapping("/findOne")
    public Systemdictionarytype findOne(Long id){
        return systemdictionarytypeService.findOne(id);
    }

    @ResponseBody
    @RequestMapping("/delete")
    public Result delete(String ids){
        try {
            systemdictionarytypeService.delete(ids);
            return new Result(200,"删除成功！");
        } catch (Exception e) {
            e.printStackTrace();
            return new Result(500,"删除失败：" + e.getMessage());
        }
    }

    @ResponseBody
    @RequestMapping("/findAll")
    public List<Systemdictionarytype> findAll(SystemdictionarytypeQuery systemdictionarytypeQuery){
        return systemdictionarytypeService.findRealAll(systemdictionarytypeQuery);
    }
}