package com.example.controller;

import com.example.dto.MemberTO;
import com.example.service.TestService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/guest")
public class TestController {
    @Autowired
    private TestService testService;

    @RequestMapping("/logintest")
    public String loginTest() {
        return "login";
    } // 로그인 테스트

    @RequestMapping("/logintest_ok")
    public String loginTestOk() {
        return "redirect:/";
    } // 로그인 테스트

    @RequestMapping("/registertest")
    public String registerTest() {
        return "register";
    } // 회원가입 테스트

    @RequestMapping("/registertest_ok")
    public String registerTest(MemberTO to) {
        testService.save(to);
        return "login";
    }

    @RequestMapping("/logouttest")
    public String logoutTest() {
        return "redirect:/";
    }

}
