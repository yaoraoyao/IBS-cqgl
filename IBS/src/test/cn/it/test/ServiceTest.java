package cn.it.test;

import cn.it.domain.Menu;
import cn.it.domain.MenuVo;
import cn.it.domain.Purchasebillitem;
import cn.it.repository.IMenuRepository;
import cn.it.service.IEmployeeService;
import cn.it.service.IPurchasebillitemService;
import org.junit.Test;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

public class ServiceTest extends BaseTest {
    @Autowired
    private IEmployeeService employeeService;
    @Autowired
    private IMenuRepository menuRepository;
    @Autowired
    private IPurchasebillitemService purchasebillitemService;

    @Test
    public void testDel () throws Exception{
        employeeService.delete("272");
    }

    @Test
    public void testParent () throws Exception{
        List<Menu> list = menuRepository.findByParentIsNull();
        list.forEach(menu -> System.out.println(menu));
    }
    @Test
    public void testChild () throws Exception{
        List<Menu> list = menuRepository.findByParentIsNotNull();
        list.forEach(menu -> System.out.println(menu));
    }

    @Test
    public void testName () throws Exception{
        List<Menu> list = menuRepository.findAll();
        List<MenuVo> listVo=new ArrayList<>();
        for (Menu menu : list) {
            MenuVo vo = new MenuVo();
            BeanUtils.copyProperties(menu, vo);
            listVo.add(vo);
        }
    }

    @Test
    public void testQuery () throws Exception{
        List<Purchasebillitem> list = purchasebillitemService.findByJpql("select e from Purchasebillitem e where e.bill.buyer.id=?1",4L);
        list.forEach(e -> System.out.println(e));
    }
}
