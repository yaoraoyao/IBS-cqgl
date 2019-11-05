package cn.itsource.web.controller;

import cn.itsouce.util.AjaxResult;
import cn.itsouce.util.PageList;
import cn.itsource.domain.Part;
import cn.itsource.query.PartQuery;
import cn.itsource.service.IPartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;


@RestController
@RequestMapping("/part")
public class PartController {

    @Autowired
    private IPartService iPartService;

    @RequestMapping("/index")
    public ModelAndView index() {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("part/part");
        return modelAndView;
    }

    @RequestMapping("/findOne")
    public Part findOne(Long id){

        return iPartService.findOne(id);
    }

    @RequestMapping("/deleteById")
    public AjaxResult deleteById(Long id){
        try {
            iPartService.delete(id);
            return AjaxResult.Me();
        } catch (Exception e) {
            e.printStackTrace();
            return  AjaxResult.Me().setSuccess(false).setMsg("操作失败:"+e.getMessage());
        }
    }

    @RequestMapping("/findAll")
    public List<Part> findAll(){

        return iPartService.findAll();
    }


    @RequestMapping("/query")
    public List<Part> query(@RequestBody PartQuery partQuery){

        return iPartService.query(partQuery);
    }

    @RequestMapping("/queryPage")
    public PageList<Part> queryPage(@RequestBody PartQuery partQuery){

        return iPartService.queryByPage(partQuery);
    }


    @RequestMapping("/saveOrUpdate")
    public AjaxResult saveOrUpdate(@RequestBody Part part){

        try {
            if(part.getId()!=null){
                //编辑
                iPartService.update(part);
            }else{
                //新增
                iPartService.save(part);
            }

            return AjaxResult.Me();
        } catch (Exception e) {
            e.printStackTrace();

            return AjaxResult.Me().setSuccess(false).setMsg("操作失败："+e.getMessage());
        }

    }

}
