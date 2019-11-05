package cn.it.controller;

import cn.it.domain.Permission;
import cn.it.query.PermissionQuery;
import cn.it.service.IPermissionService;
import cn.it.utils.PageList;
import cn.it.utils.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("/permission")
public class PermissionController{

    @Autowired
    private IPermissionService permissionService;

    @RequestMapping("/index")
    public String index(){
        return "permission";
    }

    @ResponseBody
    @RequestMapping("/list")
    public PageList<Permission> page (PermissionQuery permissionQuery){
        return permissionService.findAll(permissionQuery);
    }

    @ResponseBody
    @RequestMapping("/save")
    public Result save(Permission permission){
        Result result = null;
        try {
            if(permission.getId() != null && permission.getId() > 0)
                result = new Result(200,"编辑成功！");
            else{
                result = new Result(200,"新增成功！");
                if (permission.getMenu().getParent()!=null && permission.getMenu().getParent().getId()==-1L){
                    permission.getMenu().setParent(null);
                    permission.getMenu().setIcon("icon-tree-parent");
                }else {
                    permission.getMenu().setIcon("icon-tree-child");
                }
            }
            permissionService.save(permission);
        } catch (Exception e) {
            e.printStackTrace();
            result = new Result(500,"操作失败：" + e.getMessage());
        }
        return result;
    }

    @ResponseBody
    @RequestMapping("/findOne")
    public Permission findOne(Long id){
        return permissionService.findOne(id);
    }

    @ResponseBody
    @RequestMapping("/delete")
    public Result delete(String ids){
        try {
            permissionService.delete(ids);
            return new Result(200,"删除成功！");
        } catch (Exception e) {
            e.printStackTrace();
            return new Result(500,"删除失败：" + e.getMessage());
        }
    }
}