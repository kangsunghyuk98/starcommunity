package com.example.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.example.dto.BoardTO;
import com.example.mapper.BoardMapperInter;

@Controller
public class MypageController {
	
	// 마이 페이지 탭 mapping-----------------------------------------------------------
	
    @RequestMapping("/MypageWriteList")
    public String showMypageWriteList() {
        return "(1.4)myPage/(1.4.2)mypage_write_list";
    }
    @RequestMapping("/MypageCustom")
    public String showMypageCustom() {
        return "(1.4)myPage/(1.4.3)mypage_custom";
    }
    @RequestMapping("/MypageInfoModify")
    public String showMypageInfoModify() {
        return "(1.4)myPage/(1.4.1.1)mypage_info_modify";
    }
    
}
