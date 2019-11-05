package cn.it.service.impl;

import cn.it.domain.Employee;
import cn.it.domain.Menu;
import cn.it.repository.IMenuRepository;
import cn.it.service.IMenuService;
import cn.it.utils.ShiroSessionUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

@Service
public class MenuServiceImpl extends BaseServiceImpl<Menu,Long> implements IMenuService {

    @Autowired
    private IMenuRepository menuRepository;
    
    @Override
    @Transactional
    public void delete(String ids) {
        menuRepository.delete(ids);
    }

    @Override
    public List<Menu> findByLoginUser() {
        Employee employee = ShiroSessionUtils.getUser();
        List<Menu> children = menuRepository.findByLoginUser(employee.getId());
        List<Menu> parents = new ArrayList<>();
        children.forEach(child-> {
            Menu parent = child.getParent();
            if (!parents.contains(parent)){
                parents.add(parent);
                parent.getChildren().clear();
            }
            parent.getChildren().add(child);
        });
        return parents;
    }

    @Override
    public List<Menu> findByParentIsNotNull() {
        return menuRepository.findByParentIsNotNull();
    }

    @Override
    public List<Menu> findByParentIsNull() {
        return menuRepository.findByParentIsNull();
    }
}