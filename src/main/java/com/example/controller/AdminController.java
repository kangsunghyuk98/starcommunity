package com.example.controller;

import com.example.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin")
public class AdminController {

    @Autowired
    private AdminService adminService;

    @RequestMapping("/main")
    public String showAdminPage(Model model) {
        model.addAttribute("allMember",adminService.selectAllMember());
        return "hyowon/(1.2)_managerPage";
    }
}
