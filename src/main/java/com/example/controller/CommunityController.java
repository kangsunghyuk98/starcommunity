package com.example.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.example.dto.BoardTO;
import com.example.dto.Pagination;
import com.example.service.BoardService;

@Controller
public class CommunityController {
	@Autowired
	private BoardService service;
	
	// 커뮤니티 탭 mapping-----------------------------------------------------------
	
	@RequestMapping("/DailyBoardList")
	public String showDailyBoardList(Model model, @RequestParam(value="boardname") String boardname, @RequestParam(value = "currentPage", defaultValue = "1") int currentPage ) {
		
		int boardListCount = service.selectAllListCount(boardname);
		Pagination pagination = new Pagination(boardListCount, currentPage);
		List<BoardTO> boardLists = service.selectAllListTen(boardname, pagination.getStartIndex());
		
		model.addAttribute("boardLists", boardLists);
		model.addAttribute("boardListCount", boardListCount);
        model.addAttribute("pagination", pagination);
		model.addAttribute("boardname", boardname);
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
    public String showBoardView(Model model, @RequestParam(value="boardname") String boardname,  @RequestParam(value="seq") int seq) {

    	BoardTO to = service.viewPageContents(boardname, seq);
    	
    	model.addAttribute("to", to);
    	model.addAttribute("boardname", boardname);
    	model.addAttribute("seq", seq);
    	
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
    
    @RequestMapping("/BoardDelete")
    @ResponseBody
    public int boardDelete(String boardname, int seq) {
    	
    	System.out.println(boardname);
    	System.out.println(seq);
    	
    	int flag = service.deleteBoardContent(boardname, seq);
    	System.out.println(flag);
    	
    	
    	return flag;
    }
    
    
}
