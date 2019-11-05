package cn.itsource.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/map")
public class MapController {
    @RequestMapping("/index")
    public String index(){
        return "map/map";
    }
}
