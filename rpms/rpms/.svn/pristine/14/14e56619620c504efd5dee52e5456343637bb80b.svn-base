package cn.itsource.web.controller;

import cn.itsouce.util.HttpClientUtils;
import cn.itsouce.util.WeixinConstants;
import cn.itsource.domain.Employee;
import cn.itsource.service.IEmployeeService;
import cn.itsource.shiro.util.ShiroSessionUtil;
import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping("/wechat")
public class WechatController {

    private String unionid;

    @Autowired
    private IEmployeeService employeeService;

    //回到页面：
    @RequestMapping("/index")
    public ModelAndView index(){
        ModelAndView modelAndView = new ModelAndView();

        modelAndView.setViewName("wechat/wechatIndex");
        return modelAndView;
    }

    /**
     * 微信登录的回调方法
     * @return
     */
    @RequestMapping("/callback")
    public String callback(String code, String state){
        System.out.println(11);
        ModelAndView view = null;
        if (!StringUtils.isEmpty(code) && !StringUtils.isEmpty(state) && "1".equals(state)){
            try {
                //获取code 获得GET请求
                String httpGet = HttpClientUtils.httpGet(WeixinConstants.GET_AT_URL.replace("APPID", WeixinConstants.APPID)
                        .replace("SECRET", WeixinConstants.APPSECRET)
                        .replace("CODE", code));
                //解析字符串 获取openid的值和access_token的值
                JSON json = new JSONObject();
                JSONObject parse =(JSONObject) json.parse(httpGet);
                String openId = parse.get("openid").toString();
                String at =  parse.get("access_token").toString();
                //获取用户信息
                String userHttpGet = HttpClientUtils.httpGet(WeixinConstants.GET_USER_INFO.replace("ACCESS_TOKEN", at)
                        .replace("OPENID", openId));
                JSONObject userParse =(JSONObject) json.parse(userHttpGet);
                unionid = userParse.get("unionid").toString();

                Employee employee = new Employee();
                employee.setUsername("admin");
                employee.setPassword("admin");
                ShiroSessionUtil.setUser(employee);

                return "forward:/WEB-INF/views/wechat/jup.jsp";
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return "forward:/WEB-INF/views/wechat/weLogin.jsp";
    }


}
