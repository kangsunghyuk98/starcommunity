package com.example.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.example.dto.BoardTO;
import com.example.mapper.BoardMapperInter;

@Controller
public class CommunityController {
	@Autowired
	private BoardMapperInter mapper;
	
	// 커뮤니티 탭 mapping-----------------------------------------------------------
	
	@RequestMapping("/DailyBoardList")
	public ModelAndView showDailyBoardList(ModelAndView modelAndView) {
		List<BoardTO> boardLists = mapper.boardList();
		System.out.println(boardLists);
		
		modelAndView.addObject("boardLists", boardLists);
		modelAndView.setViewName("(1.3.1)daily_board_list");
		return modelAndView;
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
}
