package com.example.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin")
public class AdminController {

    @RequestMapping("/main")
    public String showAdminPage() {
        return "admin";
    }
    // 관리자 페이지 매핑
}
