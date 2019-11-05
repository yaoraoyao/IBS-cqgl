package cn.itsource.web.controller;

import cn.itsouce.util.AjaxResult;
import cn.itsource.domain.RepairOrder;
import cn.itsource.domain.RepairOrderItem;
import cn.itsource.domain.SettedBill;
import cn.itsource.service.IPartService;
import cn.itsource.service.IRepairOrderItemService;
import cn.itsource.service.IRepairOrderService;
import cn.itsource.service.ISettedBillService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;


@RestController
@RequestMapping("/repairorder")
public class RepairOrderController {

    @Autowired
    private IRepairOrderService repairOrderService;

    @Autowired
    private ISettedBillService settedBillService;

    @Autowired
    private IPartService partService;

    @Autowired
    private IRepairOrderItemService repairOrderItemService;

    @RequestMapping("/index")
    public ModelAndView index(){
        ModelAndView view = new ModelAndView();
        view.setViewName("repairorder/repairorder");
        return view;
    }

    @RequestMapping("/findAll")
    public List<RepairOrder> findAll(){
        List<RepairOrder> all = repairOrderService.findAll();
        return all;
    }
    @RequestMapping("/findItemsById")
    public List<RepairOrderItem> findItemsById(Long id){
        List<RepairOrderItem> list = repairOrderService.findItemsById(id);
        return list;
    }
    @RequestMapping("/findOne")
    public RepairOrder findOne(Long id){
        return repairOrderService.findOne(id);
    }

    @RequestMapping("/save")
    public AjaxResult save(@RequestBody RepairOrder repairOrder){
        System.out.println("====="+repairOrder);
        try {
            if (repairOrder.getId() !=null && repairOrder.getId() > 0 ){
                //如果id为空则新增
                repairOrderService.update(repairOrder);
                return AjaxResult.Me();
            }else {
                repairOrderService.save(repairOrder);
                return AjaxResult.Me().setMsg("修改成功");
            }
        } catch (Exception e) {
            e.printStackTrace();
            return AjaxResult.Me().setSuccess(false).setMsg("操作失败");
        }
        //todo
    }
    //删除数据
    @RequestMapping("/delete")
    public AjaxResult delete(Long id){
        try {
            repairOrderService.delete(id);
            return AjaxResult.Me();
        } catch (Exception e) {
            e.printStackTrace();
            return AjaxResult.Me().setSuccess(false).setMsg("删除失败");
        }
    }
    //生成结算单
    @RequestMapping("/updateState")
    public AjaxResult updateState(@RequestBody SettedBill settedBill){
        try {
            //先查出维修单 把状态修改为已结算1
            RepairOrder repairOrder = findOne(settedBill.getMainId());
            //再把结算单存入数据库
            settedBill.setStatus(1);
            repairOrderService.update(repairOrder);
            repairOrder.setStatus(1);
            settedBillService.save(settedBill);
            return new AjaxResult();
        } catch (Exception e) {
            e.printStackTrace();
            return AjaxResult.Me().setSuccess(false).setMsg("结算失败");
        }
    }
    @RequestMapping("/getReAmount")
    public SettedBill getReAmount(Long id){
        RepairOrder repairOrder = findOne(id);
        System.out.println(repairOrder);
        List<RepairOrderItem> items = repairOrderItemService.findByMainId(id);
        System.out.println(items);
        //创建一个BigDecimal接收总价
        BigDecimal total = new BigDecimal(0);
        for (RepairOrderItem item : items) {
            BigDecimal totalamt = item.getTotalamt();
            System.out.println("总价："+totalamt);
            total=total.add(totalamt);
        }
        //创建一个SettedBill对象 接收参数
        SettedBill settedBill = new SettedBill();
        settedBill.setAddress(repairOrder.getAddress());
        settedBill.setCustomer(repairOrder.getCustomer());
        settedBill.setMainId(repairOrder.getId());
        settedBill.setReAmount(total);
        settedBill.setPayAmount(total);
        return settedBill;
    }
}
