package cn.it.controller;

import cn.it.domain.Dept;
import cn.it.query.DeptQuery;
import cn.it.service.IDeptService;
import cn.it.utils.PageList;
import cn.it.utils.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("/dept")
public class DeptController{

    @Autowired
    private IDeptService deptService;

    @RequestMapping("/index")
    public String index(){
        return "dept";
    }

    @ResponseBody
    @RequestMapping("/list")
    public PageList<Dept> page (DeptQuery deptQuery){
        return deptService.findAll(deptQuery);
    }

    @ResponseBody
    @RequestMapping("/save")
    public Result save(Dept dept){
        Result result = null;
        try {
            if(dept.getId() != null && dept.getId() > 0)
                result = new Result(200,"员工编辑成功！");
            else
                result = new Result(200,"员工新增成功！");
            deptService.save(dept);
        } catch (Exception e) {
            e.printStackTrace();
            result = new Result(500,"操作失败：" + e.getMessage());
        }
        return result;
    }

    @ResponseBody
    @RequestMapping("/findOne")
    public Dept findOne(Long id){
        return deptService.findOne(id);
    }

    @ResponseBody
    @RequestMapping("/delete")
    public Result delete(String ids){
        try {
            deptService.delete(ids);
            return new Result(200,"删除成功！");
        } catch (Exception e) {
            e.printStackTrace();
            return new Result(500,"删除失败：" + e.getMessage());
        }
    }
}