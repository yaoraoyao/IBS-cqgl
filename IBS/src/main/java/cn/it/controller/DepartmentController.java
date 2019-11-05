package cn.it.controller;

import cn.it.domain.Department;
import cn.it.query.DepartmentQuery;
import cn.it.service.IDepartmentService;
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
@RequestMapping("/department")
public class DepartmentController{

    @Autowired
    private IDepartmentService departmentService;

    @RequestMapping("/index")
    public String index(){
        return "department";
    }

    @ResponseBody
    @RequestMapping("/list")
    public List<Department> findDepartments(DepartmentQuery departmentQuery){
        List<Department> list = departmentService.findRealAll(departmentQuery);
        list.add(0,new Department(-1L, "请选择部门"));
        return list;
    }

    @ResponseBody
    @RequestMapping("/page")
    public List<Department> findAll(DepartmentQuery departmentQuery){
        List<Department> list = departmentService.findRealAll(departmentQuery);
        return list;
    }

    @ResponseBody
    @RequestMapping("/save")
    public Result save(Department department){
        Result result = null;
        try {
            if(department.getId() != null && department.getId() > 0)
                result = new Result(200,"编辑成功！");
            else
                result = new Result(200,"新增成功！");
            departmentService.save(department);
        } catch (Exception e) {
            e.printStackTrace();
            result = new Result(500,"操作失败：" + e.getMessage());
        }
        return result;
    }

    @ResponseBody
    @RequestMapping("/findOne")
    public Department findOne(Long id){
        return departmentService.findOne(id);
    }

    @ResponseBody
    @RequestMapping("/delete")
    public Result delete(String ids){
        try {
            departmentService.delete(ids);
            return new Result(200,"删除成功！");
        } catch (Exception e) {
            e.printStackTrace();
            return new Result(500,"删除失败：" + e.getMessage());
        }
    }
}