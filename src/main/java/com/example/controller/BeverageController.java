package com.example.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.example.dto.BoardTO;
import com.example.mapper.BoardMapperInter;

@Controller
public class BeverageController {
	
    // 베버리지 탭 mapping-----------------------------------------------------------
    @RequestMapping("/BeverageList")
    public String showBeverageList() {
        return "(1.6)beverage/(1.6.1)BeverageList";
    }     
    @RequestMapping("/BeverageInfo")
    public String showBeverageInfo() {
        return "(1.6)beverage/(1.6.1.1)BeverageInfo";
    } 
}
