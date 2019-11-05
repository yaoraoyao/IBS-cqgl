package cn.itsource.shiro;

import cn.itsource.domain.Employee;
import cn.itsource.domain.Permission;
import cn.itsource.service.IEmployeeService;
import cn.itsource.service.IPermissionService;
import org.apache.shiro.authc.*;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.util.ByteSource;
import org.apache.shiro.util.SimpleByteSource;
import org.springframework.beans.factory.annotation.Autowired;

import javax.sound.midi.Soundbank;
import java.util.List;
import java.util.Set;

/**
 * 自定义登录验证
 **/
public class LoginRealm extends AuthorizingRealm {
    @Autowired
    private IEmployeeService employeeService;

    @Autowired
    private IPermissionService permissionService;

    public String getRealmName(){
        return "LoginRealm";
    }

    //登陆身份认证
    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authenticationToken) throws AuthenticationException {
        //类型强转
        UsernamePasswordToken usernamePasswordToken = (UsernamePasswordToken) authenticationToken;
        //获取前台提交的用户名
        String username = usernamePasswordToken.getUsername();
        System.out.println(username);
        //通过username茶轩数据库
        Employee employee = employeeService.findByName(username);
        //判断返回值是否为null
        if(employee == null){
            //如果没查到，返回null
            return null;
        }
        //查询到employee则创建AuthenticationInfo对象
        //参数一：主体对象principal
        //参数二：密码 credentials
        //参数三：盐值 BySource
        //参数四： 自定义Realm类名
        ByteSource byteSource = new SimpleByteSource("cn.itsource");
        AuthenticationInfo athenticationInfo = new SimpleAuthenticationInfo(employee,employee.getPassword(),byteSource,getRealmName());
        return athenticationInfo;
    }

    //授权，身份验证通过后
    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principalCollection) {
        //获取认证主题对象
        Employee employee = (Employee)principalCollection.getPrimaryPrincipal();
        //获取员工的id
        Long empId = employee.getId();
        //通过员工ID查询当前用户拥有的权限
        Set<String> permissions = permissionService.findPermissionByEmployeeId(empId);
        SimpleAuthorizationInfo authorizationInfo = new SimpleAuthorizationInfo();
        authorizationInfo.setStringPermissions(permissions);
        return authorizationInfo;
    }
}
