package cn.it.shiro;

import java.util.LinkedHashMap;
import java.util.Map;

public class MyFiltersMapBuilder {
    public Map<String, Object> buildMyFilters(){
        Map<String, Object> map = new LinkedHashMap<>();
        map.put("myPerms", new MyPermissionsAuthorizationFilter());
        return map;
    }
}
