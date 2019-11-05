package cn.itsource.web.aop;

import cn.itsource.domain.Employee;
import cn.itsource.domain.SystemLog;
import cn.itsource.service.ISystemLogService;
import cn.itsource.shiro.util.ShiroSessionUtil;
import org.aspectj.lang.JoinPoint;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;


@Component
public class LoggerAspect {

    @Autowired
    private ISystemLogService systemLogService;
    /**
     * 后置通知（无论方法是否发生异常都会执行,所以访问不到方法的返回值）
     * @param joinPoint
     */
//    public void afterMethod(JoinPoint joinPoint){
//        String methodName = joinPoint.getSignature().getName();
//        System.out.println("this method "+methodName+" end.");
//        MethodSignature signature = (MethodSignature) joinPoint.getSignature();
//        Method method = signature.getMethod();
            SystemLog systemLog = new SystemLog();
//        SystemLogAnnotation sysLog = method.getAnnotation(SystemLogAnnotation.class);
////        if (systemLog != null) {
//
//            // 注解上的描述
////            systemLog.setFunction(sysLog.action());
//        }

//        HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder
//                .getRequestAttributes()).getRequest();
//        String header = request.getHeader("X-Forwarded-For");
//        String ip = request.getRemoteAddr();
//        systemLog.setOpIp(ip);
//        //获取当前登录对象
//        Employee user = ShiroSessionUtil.getUser();
//        if(user != null){
//            systemLog.setOpUser(user.getUsername());
//        }else {
//            return;
//        }
//        // 获取目标类名
//        String className = joinPoint.getTarget().getClass().getName();
//
//        // 获取方法名
//        String methodName = joinPoint.getSignature().getName();
//        systemLog.setFunction(className + "." + methodName + "()");
//
//        // 请求的参数
//        Object[] args = joinPoint.getArgs();
//        if (args != null && args.length != 0 && args[0] != null) {
//            systemLog.setParams(args[0].toString());
//        }
//        Date date = new Date();
//        systemLog.setOpTime(date);
//
//        System.out.println("切面类=====");
//        systemLog.setOpTime(date);
//        // 保存系统日志
//        systemLogService.save(systemLog);
//    }



}
