package cn.it.controller;

import cn.it.domain.Product;
import cn.it.query.ProductQuery;
import cn.it.service.IProductService;
import cn.it.utils.PageList;
import cn.it.utils.Result;
import net.coobird.thumbnailator.Thumbnails;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

@Controller
@RequestMapping("/product")
public class ProductController{

    @Autowired
    private IProductService productService;

    @RequestMapping("/index")
    public String index(){
        return "product";
    }

    @ResponseBody
    @RequestMapping("/list")
    public PageList<Product> page (ProductQuery productQuery){
        return productService.findAll(productQuery);
    }

    @ResponseBody
    @RequestMapping("/save")
    public Result save(Product product){
        product.setSmallpic(product.getPic()+"_small.jpg");
        Result result = null;
        try {
            if(product.getId() != null && product.getId() > 0)
                result = new Result(200,"编辑成功！");
            else{
                result = new Result(200,"新增成功！");
            }
            productService.save(product);
        } catch (Exception e) {
            e.printStackTrace();
            result = new Result(500,"操作失败：" + e.getMessage());
        }
        return result;
    }

    @ResponseBody
    @RequestMapping("/findOne")
    public Product findOne(Long id){
        return productService.findOne(id);
    }

    @ResponseBody
    @RequestMapping("/delete")
    public Result delete(String ids,String paths){
        try {
            productService.delete(ids,paths);
            return new Result(200,"删除成功！");
        } catch (Exception e) {
            e.printStackTrace();
            return new Result(500,"删除失败：" + e.getMessage());
        }
    }

    @ResponseBody
    @RequestMapping("/upload")
    public String upload(MultipartFile pic, HttpServletRequest request) throws Exception {
        String fileName = pic.getOriginalFilename();
        //获取文件名称后缀
        String ext = fileName.substring(fileName.lastIndexOf("."));
        //使用随机数+时间毫秒   或者UUID 来作为文件名称
        String newName = UUID.randomUUID().toString();
        //现在是开发阶段，文件路径就写成项目路径下，若是要发布上线，就需要改为tomcat的webapps目录路径
        String realPath = request.getServletContext().getRealPath("/upload/");
        File out = new File(realPath + newName + ext);
        //将请求中的文件二进制数据写入到服务器端的磁盘文件中
        pic.transferTo(out);
        Thumbnails.of(out).size(60, 40).toFile(new File(out.getAbsolutePath()+"_small.jpg"));
        return "/upload/" + newName + ext;
    }

    @ResponseBody
    @RequestMapping("/findAll")
    public List<Product> findAll(ProductQuery productQuery){
        return productService.findRealAll(productQuery);
    }
}