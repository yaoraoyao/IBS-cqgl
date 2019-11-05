package cn.itsource.web.controller;


import cn.itsouce.util.AjaxResult;
import cn.itsouce.util.PageList;
import cn.itsource.domain.Employee;
import cn.itsource.domain.Menu;
import cn.itsource.query.EmployeeQuery;
import cn.itsource.query.MenuQuery;
import cn.itsource.service.IEmployeeService;
import com.hazelcast.util.MD5Util;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import java.util.Date;
import java.util.List;

@RestController
@RequestMapping("/employee")
public class EmployeeController {

    @Autowired
    private IEmployeeService employeeService;

    @RequestMapping("/index")
    public ModelAndView index(){
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("employee/employee");
        return modelAndView;
    }


    @RequestMapping("/findAll")
    public List<Employee> findAll(){
        List<Employee> list = employeeService.findAll();
        return list;
    }

    @RequestMapping("/findOne")
    public Employee findOne(Long id){
        Employee one = employeeService.findOne(id);
        return one;
    }
    @RequestMapping("/queryPage")
    public PageList<Employee> queryPage(@RequestBody EmployeeQuery employeeQuery){
        PageList<Employee> page = employeeService.queryByPage(employeeQuery);
        return page;
    }

    @RequestMapping("/query")
    Employee query(@RequestBody EmployeeQuery employeeQuery){
        Employee byName = employeeService.findByName(employeeQuery.getKeyword());
        return byName;
    }

    @RequestMapping("/save")
    private AjaxResult save(@RequestBody Employee employee){
        try {
            if (employee.getId()!=null&&employee.getId()>0){
                //编辑
                employeeService.update(employee);
            }else {
                employee.setHiredate(new Date());
                String password = MD5Util.toMD5String(employee.getUsername());
                employee.setPassword(password);
                //新增
                employeeService.save(employee);
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
            employeeService.delete(id);
            return AjaxResult.Me();
        } catch (Exception e) {
            e.printStackTrace();
            return AjaxResult.Me().setSuccess(false).setMsg("操作失败"+e.getMessage());
        }
    }


}
