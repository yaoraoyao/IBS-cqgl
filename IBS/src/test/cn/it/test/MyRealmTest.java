package cn.it.test;

import cn.it.shiro.JpaRealm;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authc.credential.HashedCredentialsMatcher;
import org.apache.shiro.crypto.hash.SimpleHash;
import org.apache.shiro.mgt.DefaultSecurityManager;
import org.apache.shiro.subject.Subject;
import org.junit.Test;

public class MyRealmTest {
    @Test
    public void testRealm() throws Exception {
        DefaultSecurityManager manager = new DefaultSecurityManager();
        JpaRealm jpaRealm = new JpaRealm();
        manager.setRealm(jpaRealm);
        HashedCredentialsMatcher matcher = new HashedCredentialsMatcher();
        matcher.setHashAlgorithmName("MD5");
        matcher.setHashIterations(10);
        jpaRealm.setCredentialsMatcher(matcher);
        SecurityUtils.setSecurityManager(manager);
        Subject currentUser = SecurityUtils.getSubject();
        try {
            if (!currentUser.isAuthenticated()) {
                UsernamePasswordToken token = new UsernamePasswordToken("admin", "123");
                currentUser.login(token);
            }
        } catch (UnknownAccountException e) {
            /**
             * UnknownAccountException
             *  Unknown(未知的)    Account(账户)
             */
            e.printStackTrace();
            System.out.println("登录失败：用户名错误！");
        } catch (IncorrectCredentialsException e) {
            /**
             * IncorrectCredentialsException
             *  Incorrect(不正确的)     Credentials(凭证)
             */
            e.printStackTrace();
            System.out.println("登录失败：密码错误！");
        } catch (AuthenticationException e) {
            e.printStackTrace();
        }

        System.out.println("是否已经登录：" + currentUser.isAuthenticated());
        //判断角色
        System.out.println("判断当前用户是否属于admin角色：" + currentUser.hasRole("admin"));
        System.out.println("判断当前用户是否属于guest角色：" + currentUser.hasRole("guest"));
        //判断权限
        System.out.println("判断当前用户是否拥有employee:*权限：" + currentUser.isPermitted("employee:*"));
        System.out.println("判断当前用户是否拥有employee:save权限：" + currentUser.isPermitted("employee:save"));
        System.out.println("判断当前用户是否拥有department:save权限：" + currentUser.isPermitted("department:save"));
        System.out.println("判断当前用户是否拥有department:update权限：" + currentUser.isPermitted("department:update"));


    }

    @Test
    public void testPassword() throws Exception {
        SimpleHash simpleHash = new SimpleHash("MD5", "123", "cn.it", 10);
        System.out.println(simpleHash);
    }
}
