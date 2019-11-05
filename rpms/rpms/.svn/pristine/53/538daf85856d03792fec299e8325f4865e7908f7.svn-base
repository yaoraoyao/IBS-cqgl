package cn.itsource.web.controller;


import cn.itsouce.util.AjaxResult;
import cn.itsource.domain.Role;
import cn.itsource.query.RoleQuery;
import cn.itsource.service.IRoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@RestController
@RequestMapping("/role")
public class RoleController {

    @Autowired
    private IRoleService roleService;

    @RequestMapping("/index")
    public ModelAndView index(){
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("role/role");
        return modelAndView;
    }


    @RequestMapping("/findAll")
    public List<Role> findAll(){
        List<Role> list = roleService.findAll();
        return list;
    }

    @RequestMapping("/findOne")
    public Role findOne(Long id){
        roleService.findOne(id);
        return null;
    }


    @RequestMapping("/query")
    List<Role> query(@RequestBody RoleQuery roleQuery){
        System.out.println(roleQuery.getKeyword());
        List<Role> list = roleService.query(roleQuery);
        return list;
    }

    @RequestMapping("/save")
    private AjaxResult save(@RequestBody Role Role){
       try {
               if (Role.getId()!=null&&Role.getId()>0){
                   //编辑
                   roleService.update(Role);
               }else {
                   //新增
                   roleService.save(Role);
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
            roleService.delete(id);
            return AjaxResult.Me();
        } catch (Exception e) {
            e.printStackTrace();
            return AjaxResult.Me().setSuccess(false).setMsg("操作失败"+e.getMessage());
        }
    }


}
