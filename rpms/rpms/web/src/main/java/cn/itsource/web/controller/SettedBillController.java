package cn.itsource.web.controller;


import cn.itsouce.util.AjaxResult;
import cn.itsouce.util.PageList;
import cn.itsource.domain.SettedBill;
import cn.itsource.query.SettedBillQuery;
import cn.itsource.service.ISettedBillService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@RestController
@RequestMapping("/settedbill")
public class SettedBillController {
    @Autowired
    private ISettedBillService settedBillService;

    @RequestMapping("/index")
    public ModelAndView index(){
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("settedbill/settedbill");
        return modelAndView;
    }

    @RequestMapping("/findAll")
    public List<SettedBill> findAll(){
        List<SettedBill> list = settedBillService.findAll();
        return list;
    }
    @RequestMapping("/findByStatus")
    public List<SettedBill> findByStatus(){
        System.out.println("+++++");
        List<SettedBill> list = settedBillService.findByStatus(1);
        return list;
    }


    @RequestMapping("/query")
    List<SettedBill> query(SettedBillQuery settedBillQuery){
        List<SettedBill> list = settedBillService.query(settedBillQuery);
        return list;
    }
    @RequestMapping("/findByWay")
    SettedBill findByWay(Long way){
        return settedBillService.findByWay(way);
    }

    @RequestMapping("/saveorupdate")
    public AjaxResult saveOrUpdate(@RequestBody SettedBill settedBill){
        try {
            if(settedBill.getId()!=null && settedBill.getId() > 0){
                //表示编辑
                settedBillService.update(settedBill);
            }else{
                //新增
                settedBillService.save(settedBill);
            }
            return AjaxResult.Me();
        }catch (Exception e){
            e.printStackTrace();
            return AjaxResult.Me().setSuccess(false).setMsg("操作失败" + e.getMessage());
        }
    }
    @RequestMapping("/queryByPage")
    public PageList<SettedBill> queryPage(@RequestBody SettedBillQuery settedBillQuery){
        return settedBillService.queryByPage(settedBillQuery);
    }

    @RequestMapping("/delete")
    public AjaxResult delete(Long id) {
        try {
            settedBillService.delete(id);
            return AjaxResult.Me();
        } catch (Exception e) {
            e.printStackTrace();
            return AjaxResult.Me().setSuccess(false).setMsg("操作失败"+e.getMessage());
        }
    }
}

