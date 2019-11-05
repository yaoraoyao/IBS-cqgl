package cn.itsource.shiro;

import org.apache.shiro.subject.Subject;
import org.apache.shiro.util.StringUtils;
import org.apache.shiro.web.filter.authz.PermissionsAuthorizationFilter;
import org.apache.shiro.web.util.WebUtils;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;

public class MyPermissionsAuthorizationFilter extends PermissionsAuthorizationFilter {

    @Override
    protected boolean onAccessDenied(ServletRequest request, ServletResponse response) throws IOException {
        Subject subject = this.getSubject(request, response);
        if (subject.getPrincipal() == null) {
            this.saveRequestAndRedirectToLogin(request, response);
        } else {
            //类型强转
            HttpServletRequest req = (HttpServletRequest)request;
            //获取请求头信息
            String xRequestedWith = req.getHeader("X-Requested-With");
            //判断是同步请求还是异步请求
            if(StringUtils.hasText(xRequestedWith)){
                //X-Requested-With这个请求头信息不为空，就一定是异步请求
                response.setCharacterEncoding("UTF-8");
                response.getWriter().println("{\"status\":500,\"msg\":\"对不起，你没有访问资源的权限："+req.getServletPath()+"！\"}");
                response.getWriter().flush();
                response.getWriter().close();
            }else{
                String unauthorizedUrl = this.getUnauthorizedUrl();
                if (StringUtils.hasText(unauthorizedUrl)) {
                    WebUtils.issueRedirect(request, response, unauthorizedUrl);
                } else {
                    WebUtils.toHttp(response).sendError(401);
                }
            }
        }
        return false;
    }
}
