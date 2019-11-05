package cn.it.service.impl;

import cn.it.domain.Product;
import cn.it.repository.IProductRepository;
import cn.it.service.IProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

import java.io.File;

@Service
public class ProductServiceImpl extends BaseServiceImpl<Product, Long> implements IProductService {

    @Autowired
    private IProductRepository productRepository;

    @Override
    @Transactional
    public void delete(String ids, String paths) {
        if (paths != null) {
            String[] strings = paths.split(",");
            for (String savePath : strings) {
                if (StringUtils.hasText(savePath)) {
                    File file = new File("D:/software/IdeaProjects/IBS/target/IBS/"+savePath);
                    if (file.exists()) {
                        file.delete();
                    }
                    file = new File("D:/software/IdeaProjects/IBS/target/IBS/"+savePath+"_small.jpg");
                    if (file.exists()) {
                        file.delete();
                    }
                }
            }
        }
        productRepository.delete(ids);
    }
}