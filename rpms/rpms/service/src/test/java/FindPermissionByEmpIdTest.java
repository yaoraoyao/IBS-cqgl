import cn.itsource.domain.Permission;
import cn.itsource.mapper.PermissionMapper;
import cn.itsource.service.IPermissionService;
import org.apache.ibatis.ognl.ObjectMethodAccessor;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath*:*.xml")
public class FindPermissionByEmpIdTest {

    @Autowired
    private IPermissionService permissionService;

    @Autowired
    private PermissionMapper permissionMapper;
    @Test
    public void text() throws Exception{
        List<Permission> list = permissionMapper.findPermissionByEmployeeId(1L);
        list.forEach(p-> System.out.println(p));
//        Permission one = permissionService.findOne(1L);
//        System.out.println(one);
    }
}
