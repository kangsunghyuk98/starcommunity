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
        return "eunchong/(1)Index";
    }

    @RequestMapping("/about")
    public String showAbout() {
        return "eunchong/(1.5)About";
    }

    @RequestMapping("/recommend")
    public String showRecommendPage () {
        return "hyowon/(1.7)_recommend";
    }
}
