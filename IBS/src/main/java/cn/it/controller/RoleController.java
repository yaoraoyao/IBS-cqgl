package cn.it.controller;

import cn.it.domain.Role;
import cn.it.query.RoleQuery;
import cn.it.service.IRoleService;
import cn.it.utils.PageList;
import cn.it.utils.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("/role")
public class RoleController{

    @Autowired
    private IRoleService roleService;

    @RequestMapping("/index")
    public String index(){
        return "role";
    }

    @ResponseBody
    @RequestMapping("/list")
    public PageList<Role> page (RoleQuery roleQuery){
        return roleService.findAll(roleQuery);
    }

    @ResponseBody
    @RequestMapping("/save")
    public Result save(Role role){
        Result result = null;
        try {
            if(role.getId() != null && role.getId() > 0)
                result = new Result(200,"编辑成功！");
            else
                result = new Result(200,"新增成功！");
            roleService.save(role);
        } catch (Exception e) {
            e.printStackTrace();
            result = new Result(500,"操作失败：" + e.getMessage());
        }
        return result;
    }

    @ResponseBody
    @RequestMapping("/findOne")
    public Role findOne(Long id){
        return roleService.findOne(id);
    }

    @ResponseBody
    @RequestMapping("/delete")
    public Result delete(String ids){
        try {
            roleService.delete(ids);
            return new Result(200,"删除成功！");
        } catch (Exception e) {
            e.printStackTrace();
            return new Result(500,"删除失败：" + e.getMessage());
        }
    }
}