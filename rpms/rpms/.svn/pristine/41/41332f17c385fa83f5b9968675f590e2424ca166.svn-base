import cn.itsource.domain.Menu;
import cn.itsource.service.IMenuService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath*:*.xml")
public class TestMenuList {
    @Autowired
    private IMenuService menuService;
    @Test
    public void text() throws Exception{
        List<Menu> menu = menuService.findMenuByEmployeeId(1L);
        menu.forEach(m-> System.out.println(m));
    }
}
