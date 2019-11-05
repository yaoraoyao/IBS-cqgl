package cn.itsource.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/returncar")
public class ReturnCarController {
    @RequestMapping("/index")
    public String index(){
        return "returncar/returncar";
    }

}
