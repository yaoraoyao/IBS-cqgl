package cn.itsource.web.controller;

import cn.itsouce.util.AjaxResult;
import cn.itsouce.util.PageList;
import cn.itsource.domain.Employee;
import cn.itsource.domain.Menu;
import cn.itsource.query.MenuQuery;
import cn.itsource.service.IMenuService;
import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@RestController
@RequestMapping("/menu")
public class MenuController {
    @Autowired
    private IMenuService menuService;

    @RequestMapping("/index")
    public ModelAndView index(){
        ModelAndView view = new ModelAndView();
        view.setViewName("menu/menu");
        return view;
    }

    @RequestMapping("/menulist")
    public List<Menu> findByEmployeeId(){
        //获取当前登录用户的id
        Employee employee = (Employee) SecurityUtils.getSubject().getPrincipal();
        List<Menu> menus = menuService.findMenuByEmployeeId(employee.getId());
        return menus;
    }

    @ResponseBody
    @RequestMapping("/queryPage")
    public PageList<Menu> page(MenuQuery menuQuery){
        return menuService.queryByPage(menuQuery);
    }

    @RequestMapping("/findAll")
    public List<Menu> findAll(){
        List<Menu> list = menuService.findAll();
        return list;
    }

    @RequestMapping("/findOne")
    public Menu findOne(Long id){
        menuService.findOne(id);
        return null;
    }


    @RequestMapping("/query")
    List<Menu> query(@RequestBody MenuQuery menuQuery){
        List<Menu> list = menuService.query(menuQuery);
        return list;
    }

    @RequestMapping("/save")
    private AjaxResult save(@RequestBody Menu menu){
       try {
               if (menu.getId()!=null&&menu.getId()>0){
                   //编辑
                   menuService.update(menu);
               }else {
                   //新增
                   menuService.save(menu);
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
            menuService.delete(id);
            return AjaxResult.Me();
        } catch (Exception e) {
            e.printStackTrace();
            return AjaxResult.Me().setSuccess(false).setMsg("操作失败"+e.getMessage());
        }
    }
}
