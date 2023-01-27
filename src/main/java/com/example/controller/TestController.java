package com.example.controller;

import com.example.dto.MemberTO;
import com.example.service.TestService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class TestController {
    @Autowired
    private TestService testService;

    @RequestMapping("/logintest")
    public String loginTest() {
        return "login";
    }

    @RequestMapping("/registertest")
    public String registerTest() {
        return "register";
    }

    @RequestMapping("/registertest_ok")
    public String registerTest(MemberTO to) {
        testService.save(to);
        return "login";
    }

}
