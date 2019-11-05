package cn.itsource.shiro.util;

import cn.itsource.domain.Employee;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;

public class ShiroSessionUtil {
    private static final String SESSIONKEY = "loginUser";

    public static void setUser(Employee employee){
        //获取当前用户【Shiro认为只要执行上面几行代码，就认为你是一个用户，不管你是否登录】
        Subject currentUser = SecurityUtils.getSubject();
        //如果已经登录成功，就将当前登录用户保存到Session中
        if(currentUser.isAuthenticated()){
            currentUser.getSession().setAttribute(SESSIONKEY, currentUser.getPrincipal());
        }
    }

    public static Employee getUser(){
        //获取当前用户【Shiro认为只要执行上面几行代码，就认为你是一个用户，不管你是否登录】
        Subject currentUser = SecurityUtils.getSubject();
        return (Employee)currentUser.getSession().getAttribute(SESSIONKEY);
    }

}
