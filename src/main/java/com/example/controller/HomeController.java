package com.example.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/home")
public class HomeController {

    @RequestMapping("/")
    public String showMain() {
        return "index";
    }
    
//-> 디자인 테스트를 위한 임시 맵핑 ( 강성혁 주소 수정중 )
    @RequestMapping("/index")
    public String showIndex() {
        return "eunchong/(1)Index";
    }

    @RequestMapping("/about")
    public String showAbout() {
        return "eunchong/(1.5)About";
    }
}
