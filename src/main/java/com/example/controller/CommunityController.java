package com.example.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

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
		
		String category = "DailyBoardList";
		int boardListCount = service.selectAllListCount(boardname);
		Pagination pagination = new Pagination(boardListCount, currentPage);
		List<BoardTO> boardLists = service.selectAllListTen(boardname, pagination.getStartIndex());
		
		model.addAttribute("boardLists", boardLists);
		model.addAttribute("boardListCount", boardListCount);
        model.addAttribute("pagination", pagination);
        model.addAttribute("category", category);
		model.addAttribute("boardname", boardname);
		model.addAttribute("currentPage", currentPage);
		return "(1.3)community/(1.3.1)daily_board_list";
	}
	
	@RequestMapping("/BeverageBoardList")
    public String showBeverageBoardList(Model model, @RequestParam(value="boardname") String boardname, @RequestParam(value = "currentPage", defaultValue = "1") int currentPage ) {
		
		String category = "BeverageBoardList";
		int boardListCount = service.selectAllListCount(boardname);
		Pagination pagination = new Pagination(boardListCount, currentPage);
		List<BoardTO> boardLists = service.selectAllListTen(boardname, pagination.getStartIndex());
		
		model.addAttribute("boardLists", boardLists);
		model.addAttribute("boardListCount", boardListCount);
        model.addAttribute("pagination", pagination);
        model.addAttribute("category", category);
		model.addAttribute("boardname", boardname);
		model.addAttribute("currentPage", currentPage);
        return "(1.3)community/(1.3.2)beverage_board_list";
    }
	
    @RequestMapping("/ReviewBoardList")
    public String showReviewBoardList(Model model, @RequestParam(value="boardname") String boardname, @RequestParam(value = "currentPage", defaultValue = "1") int currentPage ) {
    	
    	String category = "ReviewBoardList";
    	int boardListCount = service.selectAllListCount(boardname);
		Pagination pagination = new Pagination(boardListCount, currentPage);
		List<BoardTO> boardLists = service.selectAllListTen(boardname, pagination.getStartIndex());
		
		model.addAttribute("boardLists", boardLists);
		model.addAttribute("boardListCount", boardListCount);
        model.addAttribute("pagination", pagination);
        model.addAttribute("category", category);
		model.addAttribute("boardname", boardname);
		model.addAttribute("currentPage", currentPage);
    	return "(1.3)community/(1.3.3)review_board_list";
    }

    @RequestMapping("/MDBoardList")
    public String showMDBoardList(Model model, @RequestParam(value="boardname") String boardname, @RequestParam(value = "currentPage", defaultValue = "1") int currentPage ) {
    	
    	String category = "MDBoardList";
    	int boardListCount = service.selectAllListCount(boardname);
		Pagination pagination = new Pagination(boardListCount, currentPage);
		List<BoardTO> boardLists = service.selectAllListTen(boardname, pagination.getStartIndex());
		
		model.addAttribute("boardLists", boardLists);
		model.addAttribute("boardListCount", boardListCount);
        model.addAttribute("pagination", pagination);
        model.addAttribute("category", category);
		model.addAttribute("boardname", boardname);
		model.addAttribute("currentPage", currentPage);
    	return "(1.3)community/(1.3.4)MD_board_list";
    }
    
    @RequestMapping("/FrequencyBoardList")
    public String showFrequencyBoardList(Model model, @RequestParam(value="boardname") String boardname, @RequestParam(value = "currentPage", defaultValue = "1") int currentPage ) {
    	
    	String category = "FrequencyBoardList";
    	int boardListCount = service.selectAllListCount(boardname);
		Pagination pagination = new Pagination(boardListCount, currentPage);
		List<BoardTO> boardLists = service.selectAllListTen(boardname, pagination.getStartIndex());
		
		model.addAttribute("boardLists", boardLists);
		model.addAttribute("boardListCount", boardListCount);
        model.addAttribute("pagination", pagination);
        model.addAttribute("category", category);
		model.addAttribute("boardname", boardname);
		model.addAttribute("currentPage", currentPage);
    	return "(1.3)community/(1.3.5)frequency_board_list";
    }
    
    @RequestMapping("/BoardView")
	public String showBoardView(Model model, @RequestParam(value="category") String category, @RequestParam(value="boardname") String boardname,  @RequestParam(value="seq") int seq, @RequestParam(value="currentPage") int currentPage) {
    	BoardTO to = service.viewPageContents(boardname, seq);
    	
    	model.addAttribute("to", to);
    	model.addAttribute("boardname", boardname);
    	model.addAttribute("seq", seq);
    	model.addAttribute("category", category);
    	model.addAttribute("currentPage", currentPage);
        return "(1.3)community/(1.3.1.1)BoardView";
    }   
    
    @RequestMapping("/board/BoardWrite")
    public String showBoardWrite(@RequestParam(value="boardname") String boardname, Model model) {
    	System.out.println( "board_write is called" );
    	model.addAttribute("boardname", boardname);
        return "(1.3)community/(1.3.1.2)BoardWrite";
    }     
    
    @RequestMapping("/board/BoardWrite_ok")
    public String BoardWriteOk( @RequestParam(value="category") String category, @RequestParam(value="boardname") String boardname, MultipartFile upload , HttpServletRequest request, Model model ) {
    
    	System.out.println( "board_write_ok is called" );
    	System.out.println( request.getParameter( "content" ) );
    	System.out.println( request.getParameter( "memberKey" ) );
    	
    	BoardTO to = new BoardTO();
    	to.setSubject( request.getParameter( "subject" ) );
    	to.setContent( request.getParameter( "content" ) );
    	to.setMemberkey( Integer.parseInt( request.getParameter( "memberKey" ) ) );
    	
    	try {
			if( !upload.isEmpty() ) {
				to.setImgname( upload.getOriginalFilename() );	
				// 아직 DB에 filesize없음.. 일단 걍 BoardTO에만 만듦
				to.setFilesize( upload.getSize() ); 
				
				upload.transferTo( new File( upload.getOriginalFilename() ) );
			}
		} catch (IllegalStateException e) {
			System.out.println( e.getMessage() );
		} catch( IOException e ) {
			System.out.println( e.getMessage() );
		}
    	
    	int flag = service.boardWriteOk( boardname, to );
    	System.out.println( flag );
    	
    	model.addAttribute( "flag", flag );
    	model.addAttribute( "boardname", boardname );
    	model.addAttribute( "category", category );
    	
    	return "okaction/board_write_ok";
    } 
    
    @RequestMapping("/board/BoardModify")
    public String showBoardModify(@RequestParam(value="boardname") String boardname, @RequestParam(value="seq") int seq, Model model) {
    	model.addAttribute("boardname", boardname);
    	model.addAttribute("seq", seq);
        return "(1.3)community/(1.3.1.3)BoardModify";
    }
    
    @RequestMapping("/board/BoardDelete")
    @ResponseBody
    public int boardDelete(String boardname, int seq) {
    	int flag = service.deleteBoardContent(boardname, seq);
   	
    	return flag;
    }
    
    
}
