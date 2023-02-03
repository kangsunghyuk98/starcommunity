package com.example.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/member")
public class ContentsController {

    @RequestMapping("/myinfo")
    public String showMyinfo() {
        return "(1.4)myPage/(1.4.1)mypage_info";
    }
}
