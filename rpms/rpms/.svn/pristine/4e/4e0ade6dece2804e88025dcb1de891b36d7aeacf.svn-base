package cn.itsource.shiro;

import javax.servlet.Filter;
import java.util.HashMap;
import java.util.Map;

public class ShiroFiltersMapFactory {

    public Map<String, Filter> buildShiroFiltersMap(){
        Map<String, Filter> map = new HashMap<>();
        map.put("myPerms", new MyPermissionsAuthorizationFilter());
        return map;
    }

}
