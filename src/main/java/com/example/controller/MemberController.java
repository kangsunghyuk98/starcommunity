package com.example.controller;

import com.example.dto.MemberTO;
import com.example.service.TestService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/guest")
public class MemberController {
    @Autowired
    private TestService testService;

    @RequestMapping("/login")
    public String loginTest() {
        return "login";
    } // 로그인 테스트

    @RequestMapping("/login_ok")
    public String loginTestOk() {
        return "redirect:/";
    } // 로그인 테스트

    @RequestMapping("/register")
    public String registerTest() {
        return "register";
    } // 회원가입 테스트

    @RequestMapping("/register_ok")
    public String registerTest(MemberTO to) {
        testService.save(to);
        return "login";
    }

    @RequestMapping("/logout")
    public String logoutTest() {
        return "redirect:/";
    }

}
