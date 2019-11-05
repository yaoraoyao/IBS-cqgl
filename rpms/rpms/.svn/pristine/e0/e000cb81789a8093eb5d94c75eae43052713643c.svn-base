package cn.itsource.service.impl;

import cn.itsource.base.mapper.BaseMapper;
import cn.itsource.base.service.impl.BaseServiceImpl;
import cn.itsource.domain.Menu;
import cn.itsource.mapper.MenuMapper;
import cn.itsource.service.IMenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
@Transactional(propagation = Propagation.SUPPORTS,readOnly = true)
public class MenuServiceImpl extends BaseServiceImpl<Menu> implements IMenuService {

    @Autowired
    private MenuMapper menuMapper;

    @Override
    protected BaseMapper<Menu> getMapper() {
        return menuMapper;
    }


    @Override
    public List<Menu> findMenuByEmployeeId(Serializable id) {
        //创建一个List用来保存一级菜单结果
        List<Menu> list = new ArrayList<>();
        //查询所有的菜单
        List<Menu> menus = menuMapper.findMenuByEmployeeId(id);
        //自己组装菜单树数据
        Map<Long,Menu> map = new HashMap<>();
        for (Menu menu : menus) {
            map.put(menu.getId(), menu);
        }

        for (Menu menu : menus) {
            //是否是一级菜单
            if(menu.getParent_id()==null){
                //一级菜单直接添加到list中
                list.add(menu);
            }else{
                //不是一级菜单到map中找到他的父菜单，加到父菜单的子菜单集合中
                Menu parent = map.get(menu.getParent_id());
                parent.getChildren().add(menu);
            }
        }
        return list;
    }
}
