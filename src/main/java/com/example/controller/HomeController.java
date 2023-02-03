package com.example.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/home")
public class HomeController {

    @RequestMapping("/")
    public String showMain() {
        return "index";
    }

    @RequestMapping("/index")
    public String showIndex() {
        return "(1)mainpage/(1)main";
    }

    @RequestMapping("/about")
    public String showAbout() {
        return "(1.5)about/(1.5)About";
    }

    @RequestMapping("/recommend")
    public String showRecommendPage () {
        return "(1.7)recommend/(1.7)_recommend";
    }
}
