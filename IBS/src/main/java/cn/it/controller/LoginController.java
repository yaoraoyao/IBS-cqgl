package cn.it.controller;

import cn.it.domain.Employee;
import cn.it.utils.Result;
import cn.it.utils.ShiroSessionUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;

@Controller
public class LoginController {

    @RequestMapping(value="/login",method = RequestMethod.GET)
    public String loginPage(){
        return "login";
    }

    /**
     * 登录
     * @return
     */
    @ResponseBody
    @RequestMapping(value="/login",method = RequestMethod.POST)
    public Result login(String userName, String password){
        //获取当前用户【shiro】
        Subject currentUser = SecurityUtils.getSubject();
        try {
            //判断是否已经登录
            if(!currentUser.isAuthenticated()){
                //未登录就执行登录
                UsernamePasswordToken token = new UsernamePasswordToken(userName, password);
                currentUser.login(token);
                if(currentUser.isAuthenticated()){
                    Employee loginUser = (Employee)currentUser.getPrincipal();
                    ShiroSessionUtils.setUser(loginUser);
                }
            }
        } catch (UnknownAccountException e) {
            e.printStackTrace();
            return new Result(500,"登录失败：用户名错误！");
        } catch (IncorrectCredentialsException e) {
            e.printStackTrace();
            return new Result(500,"登录失败：密码错误！");
        } catch (AuthenticationException e) {
            e.printStackTrace();
            return new Result(500,"登录失败：系统繁忙！");
        }
        //登录成功就跳转到这个页面
        return new Result(200,"登录成功！");
    }


    /**
     * 退出登录
     * @return
     */
    @RequestMapping("/logout")
    public String logout(){
        //获取当前用户【shiro】
        Subject currentUser = SecurityUtils.getSubject();
        //如果用户已经登录，那就退出登录
        if(currentUser.isAuthenticated()){
            currentUser.logout();
        }
        //退出到登录页面
        return "redirect:/login";
    }

    /**
     * 跳转到欢迎页面
     * @return
     */
    @RequestMapping(value="/index",method=RequestMethod.GET)
    public String index(){
        return "index";
    }

}
