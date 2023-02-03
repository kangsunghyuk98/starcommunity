package com.example.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.example.dto.BoardTO;
import com.example.mapper.BoardMapperInter;

@Controller
public class CustomController {
	
    // 커스텀 레시피 탭 mapping-----------------------------------------------------------
    @RequestMapping("/Custom1")
    public String showCustom1() {
        return "(1.8)customRecipe/(1.8)custom1";
    }
    @RequestMapping("/Custom2")
    public String showCustom2() {
        return "(1.8)customRecipe/(1.8.1)custom2";
    }
}
