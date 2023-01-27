package com.example.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class TestController {

    @RequestMapping("/logintest")
    public String loginTest() {
        return "login";
    }

    @RequestMapping("/registertest")
    public String registerTest() {
        return "register";
    }

}
