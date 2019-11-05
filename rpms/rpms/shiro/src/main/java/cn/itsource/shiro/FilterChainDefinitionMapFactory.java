package cn.itsource.shiro;

import cn.itsource.domain.Permission;
import cn.itsource.mapper.PermissionMapper;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

/**
 *
 **/
public class FilterChainDefinitionMapFactory {

    @Autowired
    private PermissionMapper permissionMapper;

    //LinkedHashMap有序的
    public Map<String,String> buildFilterChanDefinitionMap(){
        Map<String,String> map = new LinkedHashMap<>();
        //静态资源放行【css、js、图片】
        map.put("/static/**","anon");
        //登录表单提交地址必须放开，不需要登录就可以直接访问
        map.put("/login", "anon");
        map.put("/*.jar", "anon");
        map.put("/wechat/*", "anon");
        map.put("/webservice/*", "anon");
        map.put("/settedwebservice/*", "anon");

        //配置哪些资源需要权限认证：哪些权限
        List<Permission> list = permissionMapper.findAll();
        list.forEach(p -> map.put(p.getResource(), "myPerms["+p.getSn()+"]"));
        //除了上面的之外的其他所有资源都必须登录后才能访问
//        map.put("/**", "authc");
        map.put("/**", "anon");
        return map;
    }

}
