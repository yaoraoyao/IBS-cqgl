import cn.itsource.domain.RepairOrder;
import cn.itsource.service.IPermissionService;
import cn.itsource.service.IRepairOrderService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath*:*.xml")
public class TestRepairOrder {

    @Autowired
    private IRepairOrderService repairOrderService;

    @Test
    public void text() throws Exception{
        List<RepairOrder> all = repairOrderService.findAll();
        all.forEach(e-> System.out.println(e));
    }
}
