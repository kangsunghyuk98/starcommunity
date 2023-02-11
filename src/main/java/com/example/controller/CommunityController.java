package com.example.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.example.dto.BoardCmtTO;
import com.example.dto.BoardLikeTO;
import com.example.security.SecurityMember;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
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
	
	@Value("${spring.servlet.multipart.location}")
	private String multipartLocation;
	
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
    
    @RequestMapping("/board/BoardView")
	public String showBoardView(Model model, @RequestParam(value="category") String category, @RequestParam(value="boardname") String boardname,
								@RequestParam(value="seq") int seq, @RequestParam(value="currentPage") int currentPage,
								@AuthenticationPrincipal SecurityMember securityMember) {

		if (securityMember == null) {
			return "okaction/pleaselogin";
		} else {
			BoardTO to = service.viewPageContents(boardname, seq);

			// 댓글 view 관련 처리
			List<BoardCmtTO> allCmtList = service.selectAllCmtList(boardname, seq);

			model.addAttribute("to", to);
			model.addAttribute("boardname", boardname);
			model.addAttribute("seq", seq);
			model.addAttribute("category", category);
			model.addAttribute("currentPage", currentPage);
			model.addAttribute("allCmtList",allCmtList);

			return "(1.3)community/(1.3.1.1)BoardView";
		}
    }

	@RequestMapping("/redirect/login")
	public String redirectLoginPage () {
		return "redirect:/guest/login";
	}

	@RequestMapping("/board/clicklike")
	public String clickLikeBtn(BoardLikeTO boardLikeTO, Model model) {

		int result = service.checkLikeMember(boardLikeTO);
		model.addAttribute("result", result); // 좋아요 했으면 1 안했으면 0

		return "okaction/like_check_ok";

	}

	@RequestMapping("/board/selectlike")
	public String selectLikeBtn(BoardLikeTO boardLikeTO, Model model) {

		int result = service.selectLikeMember(boardLikeTO);
		model.addAttribute("result", result); // 좋아요 했으면 1 안했으면 0

		return "okaction/like_check_ok";

	}

    
    @RequestMapping("/board/BoardWrite")
    public String showBoardWrite( @RequestParam(value="category") String category, @RequestParam(value="boardname") String boardname, Model model) {    	
    	model.addAttribute("boardname", boardname);
    	model.addAttribute("category", category);
        return "(1.3)community/(1.3.1.2)BoardWrite";
    }     
    
    @RequestMapping("/board/BoardWrite_ok")
    public String BoardWriteOk( @RequestParam(value="category") String category, @RequestParam(value="boardname") String boardname, MultipartFile upload , BoardTO to, Model model ) {
    	// file reneme
    	String fileRename = System.currentTimeMillis() + "_" + upload.getOriginalFilename();    	
    	if( !upload.isEmpty() ) {
			to.setImgname( fileRename );	
			to.setFilesize( upload.getSize() ); 
			to.setImgformat( fileRename.substring( fileRename.length()-3, fileRename.length() ) );	// 확장자만 자르기
		}
    	
    	int flag = service.boardWriteOk( boardname, upload, to );
    	
    	model.addAttribute( "flag", flag );
    	model.addAttribute( "category", category );
    	model.addAttribute( "boardname", boardname );    	
    	return "okaction/board_write_ok";
    } 
    
    @RequestMapping("/board/BoardModify")
    public String showBoardModify( @RequestParam(value="category") String category, @RequestParam(value="boardname") String boardname, @RequestParam(value="currentPage") int currentPage, @RequestParam(value="seq") int seq, BoardTO to, Model model) {
    	
    	to = service.boardModify( boardname, seq, to );
    	
    	model.addAttribute( "category", category );
    	model.addAttribute( "boardname", boardname );
    	model.addAttribute( "currentPage", currentPage );
    	model.addAttribute( "seq", seq );
    	model.addAttribute( "to", to );
        return "(1.3)community/(1.3.1.3)BoardModify";
    }
    
    @RequestMapping("/board/BoardModify_ok")
    public String BoardModifyOk( @RequestParam(value="category") String category, @RequestParam(value="boardname") String boardname, @RequestParam(value="currentPage") int currentPage, @RequestParam(value="seq") int seq, MultipartFile upload, BoardTO to, Model model) {
    	System.out.println( category ); 
    	System.out.println( boardname );
    	System.out.println( currentPage ); 
    	System.out.println( seq );
    	System.out.println( upload.getSize() );
    	System.out.println( to.getContent() );
    	System.out.println( multipartLocation );
    	
    	// file reneme
    	String fileRename = System.currentTimeMillis() + "_" + upload.getOriginalFilename();    	
    	if( !upload.isEmpty() ) {
			to.setImgname( fileRename );	
			to.setFilesize( upload.getSize() ); 
			to.setImgformat( fileRename.substring( fileRename.length()-3, fileRename.length() ) );	// 확장자만 자르기
		}
    	
    	int flag = service.boardModifyOk( boardname, seq, upload, to );
    	
    	model.addAttribute( "flag", flag );
    	model.addAttribute( "category", category );
    	model.addAttribute( "boardname", boardname );
    	model.addAttribute( "currentPage", currentPage );
    	model.addAttribute( "seq", seq );
        return "okaction/board_modify_ok";
    }
    
    @RequestMapping("/board/BoardDelete")
    @ResponseBody
    public int boardDelete(String boardname, int seq, String imgname) {
    	
    	int flag = service.deleteBoardContent(boardname, seq);
    			
    	//String path = "C:/Users/zxzz9/Documents/files/";
    	//String path = "C:/Team Project/StarbucksCommunity/src/main/webapp/upload";
    	
    	//파일 삭제
    	if (flag == 0 && imgname != null) {
    		try {
    			//File file = new File(path + imgname);
    			File file = new File(multipartLocation + imgname);
    			
    			boolean result = file.delete();
    			
    			if (result) {
    	            System.out.println("File is deleted");
    	        } else {
    	            System.out.println("Failed to delete");
    	        }
    			
    		} catch (Exception e) {
    			// TODO Auto-generated catch block
    			e.printStackTrace();
    		}
    	}
    	
    	return flag;
    }
	
	// 댓글 관련 처리 메서드
	@RequestMapping("/board/writecmt")
	public String writeCmt (BoardCmtTO bto, @RequestParam("currentPage") int currentPage ,
							@RequestParam("category") String category, Model model) {
		int flag = service.writeCmt(bto);

		model.addAttribute("flag",flag);
		model.addAttribute("seq",bto.getSeq());
		model.addAttribute("boardname",bto.getBoardname());
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("category",category);

		return "okaction/write_board_cmt_ok";

	}

	@RequestMapping("/board/deletecmt")
	public String deleteCmt (BoardCmtTO bto ,Model model) {
		int flag = service.deleteCmt(bto);
		model.addAttribute("flag",flag);

		return "okaction/board_cmt_delete";
	}
    
    
}
