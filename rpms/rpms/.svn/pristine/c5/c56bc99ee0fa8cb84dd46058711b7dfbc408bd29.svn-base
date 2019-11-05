package cn.itsource.service.impl;



import cn.itsource.base.mapper.BaseMapper;
import cn.itsource.base.service.impl.BaseServiceImpl;
import cn.itsource.domain.Part;
import cn.itsource.mapper.PartMapper;
import cn.itsource.service.IPartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;



@Service
@Transactional(propagation = Propagation.SUPPORTS,readOnly = true)
public class PartServiceImpl extends BaseServiceImpl<Part> implements IPartService{

    @Autowired
    private PartMapper partMapper;

    @Override
    protected BaseMapper<Part> getMapper() {
        return this.partMapper;
    }

}
