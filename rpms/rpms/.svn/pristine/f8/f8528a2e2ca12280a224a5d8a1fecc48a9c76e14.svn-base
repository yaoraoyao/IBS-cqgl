package cn.itsource.web.controller;

import cn.itsouce.util.AjaxResult;
import cn.itsource.domain.Employee;
import cn.itsource.shiro.util.ShiroSessionUtil;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.Map;

@Controller
public class LoginController {



    @RequestMapping("/index")
    public String index(){
        return "index";
    }

    /**
     * method = RequestMethod.GET       指定请求方法是GET或者POST
     * method = RequestMethod.POST
     * @return
     */
    @RequestMapping(value = "/login",method = RequestMethod.GET)
    public String loginPage(){
        return "login";
    }

    @ResponseBody
    @RequestMapping(value = "/login",method = RequestMethod.POST)
    public AjaxResult login(@RequestBody Map<String,String> param){
        //获取当前用户【Shiro认为只要执行上面几行代码，就认为你是一个用户，不管你是否登录】
        System.out.println(param.get("username")+"=="+param.get("password"));
        Subject currentUser = SecurityUtils.getSubject();
        try {
            if (ShiroSessionUtil.getUser()!=null){
                UsernamePasswordToken usernamePasswordToken = new UsernamePasswordToken("admin","admin");
                currentUser.login(usernamePasswordToken);
                //如果已经登录成功，就将当前登录用户保存到Session中
                ShiroSessionUtil.setUser((Employee) currentUser.getPrincipal());
            }else {
                if(!currentUser.isAuthenticated()){
                    //UsernamePasswordToken表示令牌，就包含用户名和密码【从前端表单提交过来的用户名和密码】
                    UsernamePasswordToken usernamePasswordToken = new UsernamePasswordToken(param.get("username"),param.get("password"));
                    //登录
                    System.out.println("++++++++++++");
                    currentUser.login(usernamePasswordToken);
                    //如果已经登录成功，就将当前登录用户保存到Session中

                    ShiroSessionUtil.setUser((Employee) currentUser.getPrincipal());
                }
            }

        } catch (UnknownAccountException e){
            e.printStackTrace();
            return AjaxResult.Me().setSuccess(false).setMsg("登陆失败！");//new Result(500,"登录失败：用户名错误！");
        } catch (IncorrectCredentialsException e){
            e.printStackTrace();
            return AjaxResult.Me().setSuccess(false).setMsg("登陆失败！");
        } catch (AuthenticationException e) {
            e.printStackTrace();
            return AjaxResult.Me().setSuccess(false).setMsg("登陆失败！");
        }
        return AjaxResult.Me().setMsg("登录成功");
    }

    @RequestMapping("/logout")
    public String logout(){
        //获取当前用户【Shiro认为只要执行上面几行代码，就认为你是一个用户，不管你是否登录】
        Subject currentUser = SecurityUtils.getSubject();
        currentUser.logout();
        return "login";
    }

}

