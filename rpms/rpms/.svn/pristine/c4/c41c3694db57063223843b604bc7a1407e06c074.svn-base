package cn.itsource.web.controller;

import cn.itsouce.util.AjaxResult;
import cn.itsouce.util.PageList;
import cn.itsource.domain.PayWay;
import cn.itsource.query.PayWayQuery;
import cn.itsource.service.IPayWayService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@RestController
@RequestMapping("/payway")
public class PayWayController {
    @Autowired
    private IPayWayService payWayService;
    @RequestMapping("/index")
    public ModelAndView index(){
        ModelAndView view = new ModelAndView();
        view.setViewName("payway/payway");
        return view;
    }

    @RequestMapping("/findAll")
    public List<PayWay> findAll(){
        List<PayWay> list = payWayService.findAll();
        return list;
    }

    @RequestMapping("/query")
    List<PayWay> query(PayWayQuery payWayQuery){
        List<PayWay> list = payWayService.query(payWayQuery);
        return list;
    }
    @RequestMapping("/queryByPage")
    public PageList<PayWay> queryPage(@RequestBody PayWayQuery payWayQuery){
        return payWayService.queryByPage(payWayQuery);
    }

    @RequestMapping("/saveOrUpdate")
    public AjaxResult saveOrUpdate(@RequestBody PayWay payWay){
        try {
            if(payWay.getId()!=null && payWay.getId() > 0){
                //表示编辑
                payWayService.update(payWay);
            }else{
                //新增
                payWayService.save(payWay);
            }
            return AjaxResult.Me();
        }catch (Exception e){
            e.printStackTrace();
            return AjaxResult.Me().setSuccess(false).setMsg("操作失败" + e.getMessage());
        }

    }

    @RequestMapping("/delete")
    public AjaxResult delete(Long id) {
        try {
            payWayService.delete(id);
            return AjaxResult.Me();
        } catch (Exception e) {
            e.printStackTrace();
            return AjaxResult.Me().setSuccess(false).setMsg("操作失败"+e.getMessage());
        }
    }
}
