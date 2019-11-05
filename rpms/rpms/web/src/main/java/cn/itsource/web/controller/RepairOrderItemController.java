package cn.itsource.web.controller;

import cn.itsouce.util.AjaxResult;
import cn.itsource.domain.RepairOrder;
import cn.itsource.domain.RepairOrderItem;
import cn.itsource.service.IRepairOrderItemService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import java.math.BigDecimal;
import java.util.List;

@RestController
@RequestMapping("/repairorderitem")
public class RepairOrderItemController {

    @Autowired
    private IRepairOrderItemService repairOrderItemService;

    /**跳转维修明细列表页面*/
    @RequestMapping("/index")
    public ModelAndView index(){
        ModelAndView view = new ModelAndView();
        view.setViewName("repairorderitem/repairorderitem");
        return view;
    }
    @RequestMapping("/findAll")
    public List<RepairOrderItem> findAll(){
        List<RepairOrderItem> all = repairOrderItemService.findAll();
        return all;
    }
    @RequestMapping("/findByMainId")
    public List<RepairOrderItem> findByMainId(Long mainid){
        System.out.println(mainid);
        System.out.println(repairOrderItemService.findByMainId(mainid));
        return repairOrderItemService.findByMainId(mainid);
    }

    @RequestMapping("/save")
    public AjaxResult save(@RequestBody RepairOrderItem repairOrderItem) {
        try {
            if (repairOrderItem.getId() !=null && repairOrderItem.getId() > 0 ){
                //如果id为空则新增
                System.out.println("=====" + repairOrderItem);
                repairOrderItemService.update(repairOrderItem);
                return AjaxResult.Me().setMsg("操作成功");
            }else {
                repairOrderItemService.save(repairOrderItem);
                return AjaxResult.Me().setMsg("操作成功");
            }
        } catch (Exception e) {
            e.printStackTrace();
            return AjaxResult.Me().setSuccess(false).setMsg("操作失败");
        }
    }
}
