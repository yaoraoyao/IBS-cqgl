package cn.itsource.web.controller;

import cn.itsouce.util.PageList;
import cn.itsource.domain.SystemLog;
import cn.itsource.query.SystemLogQuery;
import cn.itsource.service.ISystemLogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;


@RestController
@RequestMapping("/systemlog")
public class SystemLogController {

    @Autowired
    private ISystemLogService systemLogService;

    //日志主页面
    @RequestMapping("/index")
    private ModelAndView index(){
        ModelAndView view = new ModelAndView();
        view.setViewName("systemlog/systemlog");
        return view;
    }

    @RequestMapping("/queryPage")
    private PageList<SystemLog> queryByPage(@RequestBody SystemLogQuery systemLogQuery){
        System.out.println(systemLogQuery);
        PageList<SystemLog> list = systemLogService.queryByPage(systemLogQuery);
        return list;
    }
    @RequestMapping("/query")
    List<SystemLog> query(@RequestBody SystemLogQuery systemLogQuery){
        List<SystemLog> list =systemLogService.query(systemLogQuery);
        return list;
    }

}
