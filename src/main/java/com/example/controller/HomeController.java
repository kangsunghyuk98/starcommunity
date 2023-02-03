package com.example.controller;

import com.example.mapper.MapperInter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class HomeController {

	@Autowired
    private MapperInter mapperInter;

	// 인덱스 mapping-----------------------------------------------------------
    @RequestMapping("/")
    public String showMain() {
        return "(1)Index";
    }
    
	// 메인페이지 mapping-----------------------------------------------------------    
    @RequestMapping("/Index")
    public String showIndex() {
        return "(1)Index";
    }
    
	// 로그인 관련 mapping-----------------------------------------------------------
    @RequestMapping("/Login")
    public String showLogin() {
        return "(1.1)login/(1.1)login_form";
    }
    @RequestMapping("/SignUp")
    public String showSignUp() {
        return "(1.1)login/(1.1.1)signup_form";
    }
    @RequestMapping("/FindID")
    public String showFindID() {
        return "(1.1)login/(1.1.2)findID_form";
    }
    @RequestMapping("/FindPW")
    public String showFindPW() {
        return "(1.1)login/(1.1.3)findPW_form";
    }
    
	// 관리자 페이지 mapping-----------------------------------------------------------
    @RequestMapping("/ManagerPage")
    public String showManagerPage() {
        return "(1.2)managerPage/(1.2)_managerPage";
    } 
    
	// 커뮤니티탭 mapping-----------------------------------------------------------
    @RequestMapping("/DailyBoardList")
    public String showDailyBoardList() {
        return "(1.3)community/(1.3.1)daily_board_list";
    }
    @RequestMapping("/BeverageBoardList")
    public String showBeverageBoardList() {
        return "(1.3)community/(1.3.2)beverage_board_list";
    }
    @RequestMapping("/ReviewBoardList")
    public String showReviewBoardList() {
        return "(1.3)community/(1.3.3)review_board_list";
    }
    @RequestMapping("/MDBoardList")
    public String showMDBoardList() {
        return "(1.3)community/(1.3.4)MD_board_list";
    }
    @RequestMapping("/FrequencyBoardList")
    public String showFrequencyBoardList() {
        return "(1.3)community/(1.3.5)frequency_board_list";
    }
    @RequestMapping("/BoardView")
    public String showBoardView() {
        return "(1.3)community/(1.3.1.1)BoardView";
    }   
    @RequestMapping("/BoardWrite")
    public String showBoardWrite() {
        return "(1.3)community/(1.3.1.2)BoardWrite";
    }      
    @RequestMapping("/BoardModify")
    public String showBoardModify() {
        return "(1.3)community/(1.3.1.3)BoardModify";
    }
    
	// 마이 페이지 탭 mapping-----------------------------------------------------------
    @RequestMapping("/MypageInfo")
    public String showMypageInfo() {
        return "(1.4)myPage/(1.4.1)mypage_info";
    }
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
    
    // 어바웃 mapping-----------------------------------------------------------
    @RequestMapping("/About")	
    public String showAbout() {
        return "(1.5)about/(1.5)About";
    }
    
    // 베버리지 탭 mapping-----------------------------------------------------------
    @RequestMapping("/BeverageList")
    public String showBeverageList() {
        return "(1.6)beverage/(1.6.1)BeverageList";
    }     
    @RequestMapping("/BeverageInfo")
    public String showBeverageInfo() {
        return "(1.6)beverage/(1.6.1.1)BeverageInfo";
    } 
    
    // 음료 추천 mapping-----------------------------------------------------------
    @RequestMapping("/Recommend")
    public String showRecommend() {
        return "(1.7)recommend/(1.7)_recommend";
    }
    
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
