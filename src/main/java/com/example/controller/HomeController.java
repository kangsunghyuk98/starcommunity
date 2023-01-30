package com.example.controller;

import com.example.service.HomeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class HomeController {

    @Autowired
    private HomeService homeService;

    @RequestMapping("/")
    public String showMain() {
        return "index";
    }
    
//-> 디자인 테스트를 위한 임시 맵핑
    @RequestMapping("/Index")
    public String showIndex() {
        return "(1)Index";
    }
    
    @RequestMapping("/BoardView")
    public String showBoardView() {
        return "(1.3.1.1)BoardView";
    }
    
    @RequestMapping("/BoardWrite")
    public String showBoardWrite() {
        return "(1.3.1.2)BoardWrite";
    }    
    
    @RequestMapping("/BoardModify")
    public String showBoardModify() {
        return "(1.3.1.3)BoardModify";
    }
    
    @RequestMapping("/About")
    public String showAbout() {
        return "(1.5)About";
    }
    
    @RequestMapping("/BeverageList")
    public String showBeverageList() {
        return "(1.6.1)BeverageList";
    } 
    
    @RequestMapping("/BeverageInfo")
    public String showBeverageInfo() {
        return "(1.6.1.1)BeverageInfo";
    } 
//->
}
