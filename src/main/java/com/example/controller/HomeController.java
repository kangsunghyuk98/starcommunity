package com.example.controller;

import com.example.service.HomeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/home")
public class HomeController {

    @Autowired
    private HomeService homeService;

    @RequestMapping("/")
    public String showMain() {
        return "index";
    }
    
//-> 디자인 테스트를 위한 임시 맵핑 ( 강성혁 주소 수정중 )
    @RequestMapping("/index")
    public String showIndex() {
        return "(1)Index";
    }


}
