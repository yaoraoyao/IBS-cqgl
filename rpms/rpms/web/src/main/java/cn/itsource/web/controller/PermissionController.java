package cn.itsource.web.controller;

import cn.itsouce.util.AjaxResult;
import cn.itsouce.util.PageList;
import cn.itsource.domain.Permission;
import cn.itsource.query.PermissionQuery;
import cn.itsource.service.IPermissionService;
import net.sf.ehcache.transaction.xa.commands.StorePutCommand;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@RestController
@RequestMapping("/permission")
public class PermissionController {

    @Autowired
    private IPermissionService permissionService;

    @RequestMapping("/index")
    public ModelAndView index(){
        ModelAndView view = new ModelAndView();
        view.setViewName("permission/permission");
        return view;
    }
    //分页查询
    @RequestMapping("/queryPage")
    public PageList<Permission> queryByPage(@RequestBody PermissionQuery permissionQuery){
        PageList<Permission> pageList = permissionService.queryByPage(permissionQuery);
        return pageList;
    }

    @RequestMapping("/findOne")
    public Permission findOne(Long id){
        return  permissionService.findOne(id);
    }


    @RequestMapping("/query")
    List<Permission> query(@RequestBody PermissionQuery permissionQuery){
        List<Permission> list = permissionService.query(permissionQuery);
        return list;
    }

    @RequestMapping("/save")
    private AjaxResult save(@RequestBody Permission permission){
        try {
            if (permission.getId()!=null&&permission.getId()>0){
                //编辑
                permissionService.update(permission);
            }else {
                //新增
                permissionService.save(permission);
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
            permissionService.delete(id);
            return AjaxResult.Me();
        } catch (Exception e) {
            e.printStackTrace();
            return AjaxResult.Me().setSuccess(false).setMsg("操作失败"+e.getMessage());
        }
    }

}
