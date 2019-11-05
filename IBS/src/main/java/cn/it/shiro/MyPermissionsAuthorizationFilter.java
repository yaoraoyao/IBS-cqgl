package cn.it.shiro;
import org.apache.shiro.subject.Subject;
import org.apache.shiro.util.StringUtils;
import org.apache.shiro.web.filter.authz.PermissionsAuthorizationFilter;
import org.apache.shiro.web.util.WebUtils;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;

public class MyPermissionsAuthorizationFilter extends PermissionsAuthorizationFilter{
    @Override
    protected boolean onAccessDenied(ServletRequest request, ServletResponse response) throws IOException {
        Subject subject = this.getSubject(request, response);
        if (subject.getPrincipal() == null){
            this.saveRequestAndRedirectToLogin(request,response );
        }else {
            HttpServletRequest req = (HttpServletRequest) request;
            String header = req.getHeader("X-Requested-With");
            if (StringUtils.hasText(header)){
                response.setContentType("text/json; charset=UTF-8");
                response.getWriter().println("{\"status\":500,\"msg\":\"对不起!您没有操作这个功能的权限!"+req.getServletPath()+"\"}");
                response.getWriter().flush();
                response.getWriter().close();
            }else {
                String unauthorizedUrl = this.getUnauthorizedUrl();
                if (StringUtils.hasText(unauthorizedUrl)){
                    WebUtils.issueRedirect(request,response ,unauthorizedUrl );
                }else {
                    WebUtils.toHttp(response).sendError(401);
                }
            }
        }
        return false;
    }
}
