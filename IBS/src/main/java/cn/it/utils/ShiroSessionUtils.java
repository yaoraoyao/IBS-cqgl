package cn.it.utils;

import cn.it.domain.Employee;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;

public class ShiroSessionUtils {
    private static final String LOGINUSER_IN_SESSION = "loginUser";

    public static void setUser(Employee employee){
        //获得当前登录用户对象【主体对象】
        Subject subject = SecurityUtils.getSubject();
        //获取Session
        Session session = subject.getSession();
        session.setAttribute(LOGINUSER_IN_SESSION, employee);
    }

    public static Employee getUser(){
        //获得当前登录用户对象【主体对象】
        Subject subject = SecurityUtils.getSubject();
        //获取Session
        Session session = subject.getSession();
        Employee employee = (Employee)session.getAttribute(LOGINUSER_IN_SESSION);
        return employee;
    }
}
