package cn.itsource.web.controller;


import cn.itsouce.util.AjaxResult;
import cn.itsouce.util.PageList;
import cn.itsource.domain.Department;
import cn.itsource.query.DepartmentQuery;
import cn.itsource.service.IDepartmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@RestController
@RequestMapping("/department")
public class DepartmentController {

    @Autowired
    private IDepartmentService departmentService;


    @RequestMapping("/index")
    public ModelAndView index(){
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("department/department");
        return modelAndView;
    }

    @ResponseBody
    @RequestMapping("/queryPage")
    public PageList<Department> page(DepartmentQuery departmentQuery){
        return departmentService.queryByPage(departmentQuery);
    }

    @RequestMapping("/findAll")
    public List<Department> findAll(){
        List<Department> list = departmentService.findAll();
        return list;
    }

    @RequestMapping("/findOne")
    public Department findOne(Long id){
        departmentService.findOne(id);
        return null;
    }


  /*  @RequestMapping("/query.do")
    List<department> query(departmentQuery departmentQuery){
        List<department> list = departmentService.query(departmentQuery);
        return list;
    }*/

    @RequestMapping("/save")
    private AjaxResult save(@RequestBody Department department){
       try {
               if (department.getId()!=null&&department.getId()>0){
                   //编辑
                   departmentService.update(department);
               }else {
                   //新增
                   departmentService.save(department);
                   System.out.println(department);
               }
               return AjaxResult.Me();
       } catch (Exception e) {
           e.printStackTrace();
           return AjaxResult.Me().setSuccess(false).setMsg("操作失败"+e.getMessage());
       }

   }


    @RequestMapping("/delete")
    public AjaxResult delete(Long id) {
        try {
            departmentService.delete(id);
            System.out.println("id=="+id);
            return AjaxResult.Me();
        } catch (Exception e) {
            e.printStackTrace();
            return AjaxResult.Me().setSuccess(false).setMsg("操作失败"+e.getMessage());
        }
    }

    @RequestMapping("/list")
    public List<Department> list(DepartmentQuery departmentQuery){
        List<Department> list = departmentService.query(departmentQuery);
        list.add(0, new Department(-1L,"请选择部门"));
        return list;
    }

}
