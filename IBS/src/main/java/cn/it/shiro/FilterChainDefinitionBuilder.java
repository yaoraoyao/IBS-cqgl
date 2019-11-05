package cn.it.shiro;

import cn.it.domain.Employee;
import cn.it.domain.Permission;
import cn.it.repository.IEmployeeRepository;
import cn.it.repository.IPermissionRepository;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

public class FilterChainDefinitionBuilder {
    @Autowired
    private IPermissionRepository permissionRepository;

    public Map<String, String> build(){
        Map<String, String> filterChainMap = new LinkedHashMap<String, String>();
        filterChainMap.put("/login","anon");
        filterChainMap.put("*.js","anon");
        filterChainMap.put("*.css","anon");
        filterChainMap.put("/bootstrap/css/**","anon");
        filterChainMap.put("/bootstrap/js/**","anon");
        filterChainMap.put("/jquery-easyui-1.5/**","anon");
        filterChainMap.put("/img/**","anon");
        List<Permission> list = permissionRepository.findAll();
        list.forEach(permission -> filterChainMap.put(permission.getUrl(), "myPerms["+permission.getSn()+"]"));
        filterChainMap.put("/**", "authc");
        return filterChainMap;
    }
}
