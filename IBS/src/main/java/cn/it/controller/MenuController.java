package cn.it.controller;

import cn.it.domain.Menu;
import cn.it.domain.MenuVo;
import cn.it.query.MenuQuery;
import cn.it.service.IMenuService;
import cn.it.service.IMenuVoService;
import cn.it.utils.PageList;
import cn.it.utils.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import java.util.List;

@Controller
@RequestMapping("/menu")
public class MenuController{

    @Autowired
    private IMenuService menuService;
    @Autowired
    private IMenuVoService menuVoService;

    @RequestMapping("/index")
    public String index(){
        return "menu";
    }

    @ResponseBody
    @RequestMapping("/list")
    public PageList<MenuVo> page (MenuQuery menuQuery){
        return menuVoService.findAll(menuQuery);
    }

    @ResponseBody
    @RequestMapping("/save")
    public Result save(Menu menu){
        Result result = null;
        try {
            if(menu.getId() != null && menu.getId() > 0)
                result = new Result(200,"编辑成功！");
            else{
                result = new Result(200,"新增成功！");
                if (menu.getParent()!=null && menu.getParent().getId()==-1L){
                    menu.setParent(null);
                    menu.setIcon("icon-tree-parent");
                }else {
                    menu.setIcon("icon-tree-children");
                }
            }
            menuService.save(menu);
        } catch (Exception e) {
            e.printStackTrace();
            result = new Result(500,"操作失败：" + e.getMessage());
        }
        return result;
    }

    @ResponseBody
    @RequestMapping("/findOne")
    public Menu findOne(Long id){
        return menuService.findOne(id);
    }

    @ResponseBody
    @RequestMapping("/delete")
    public Result delete(String ids){
        try {
            menuService.delete(ids);
            return new Result(200,"删除成功！");
        } catch (Exception e) {
            e.printStackTrace();
            return new Result(500,"删除失败：" + e.getMessage());
        }
    }

    @ResponseBody
    @RequestMapping("/treeMenu")
    public List<Menu> treeMenu(){
        return menuService.findByLoginUser();
    }

    @ResponseBody
    @RequestMapping("/parent")
    public List<Menu> parent(){
        List<Menu> list = menuService.findByParentIsNull();
        list.add(0,new Menu("请选择父级菜单",-1L));
        return list;
    }
    @ResponseBody
    @RequestMapping("/child")
    public List<Menu> child(){
        List<Menu> list = menuService.findByParentIsNotNull();
        list.add(0,new Menu("请选择子菜单",-1L));
        return list;
    }
}