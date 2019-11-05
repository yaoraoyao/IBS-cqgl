package cn.it.shiro;

import cn.it.domain.Employee;
import cn.it.service.IEmployeeService;
import cn.it.service.IPermissionService;
import cn.it.utils.ShiroSessionUtils;
import org.apache.shiro.authc.*;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.util.ByteSource;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.HashSet;
import java.util.Set;

public class JpaRealm extends AuthorizingRealm {

    @Autowired
    private IEmployeeService employeeService;
    @Autowired
    private IPermissionService permissionService;

    @Override
    public String getName() {
        return "jpaRealm";
    }

    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principalCollection) {
        Employee employee = ShiroSessionUtils.getUser();
        Set<String> permissions = permissionService.findSnByEmp(employee.getId());
        SimpleAuthorizationInfo simpleAuthorizationInfo = new SimpleAuthorizationInfo();
        simpleAuthorizationInfo.setStringPermissions(permissions);
        return simpleAuthorizationInfo;
    }

    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authenticationToken) throws AuthenticationException {
        UsernamePasswordToken token = (UsernamePasswordToken)authenticationToken;
        String username = token.getUsername();
        Employee employee = employeeService.findByUsername(username);
        if (employee==null){
            return null;
        }
        String password = employee.getPassword();
        ByteSource salt = ByteSource.Util.bytes("cn.it");
        SimpleAuthenticationInfo authenticationInfo = new SimpleAuthenticationInfo(employee,password,salt,getName());
        return authenticationInfo;
    }

}
